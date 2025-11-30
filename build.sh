#!/bin/bash
# Build script for Cloudflare Pages cloud builds
# This script downloads a prebuilt LilyPond binary since apt-get is not available
# in Cloudflare's sandboxed build environment.

set -e

LILYPOND_VERSION="2.24.4"
LILYPOND_URL="https://gitlab.com/api/v4/projects/lilypond%2Flilypond/packages/generic/lilypond/${LILYPOND_VERSION}/lilypond-${LILYPOND_VERSION}-linux-x86_64.tar.gz"
LILYPOND_DIR="$HOME/lilypond"

echo "==================================="
echo "Cloudflare Pages Build Script"
echo "==================================="
echo ""

# Function to install LilyPond from prebuilt binary
install_lilypond() {
    echo "Attempting to install LilyPond ${LILYPOND_VERSION}..."

    # Create directory for LilyPond
    mkdir -p "$LILYPOND_DIR"

    # Download LilyPond
    echo "Downloading LilyPond from GitLab releases..."
    if curl -L --fail -o "/tmp/lilypond.tar.gz" "$LILYPOND_URL"; then
        echo "Download successful, extracting..."
        tar -xzf "/tmp/lilypond.tar.gz" -C "$LILYPOND_DIR" --strip-components=1
        rm -f "/tmp/lilypond.tar.gz"

        # Add to PATH
        export PATH="$LILYPOND_DIR/bin:$PATH"

        # Verify installation
        if command -v lilypond &> /dev/null; then
            echo "LilyPond installed successfully!"
            lilypond --version | head -1
            return 0
        else
            echo "Warning: LilyPond binary not found after extraction"
            return 1
        fi
    else
        echo "Warning: Failed to download LilyPond"
        return 1
    fi
}

# Check if LilyPond is already available
if command -v lilypond &> /dev/null; then
    echo "LilyPond is already installed:"
    lilypond --version | head -1
else
    # Try to install LilyPond
    if ! install_lilypond; then
        echo ""
        echo "================================================"
        echo "WARNING: LilyPond installation failed!"
        echo "The build will continue but LilyPond scores will"
        echo "not be compiled. Consider using GitHub Actions"
        echo "deployment instead for full LilyPond support."
        echo "================================================"
        echo ""
    fi
fi

echo ""
echo "Installing npm dependencies..."
npm ci

echo ""
echo "Building site..."
# Export PATH again in case LilyPond was installed
export PATH="$LILYPOND_DIR/bin:$PATH"
npm run build

echo ""
echo "Build completed!"
