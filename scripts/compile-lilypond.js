#!/usr/bin/env node

/**
 * LilyPond Compilation Script
 *
 * This script compiles all .ly files in the lilypond/ directory
 * and outputs PDFs and SVGs to static/scores/
 */

const { execSync, spawnSync } = require("child_process");
const fs = require("fs");
const path = require("path");

const LILYPOND_DIR = path.join(__dirname, "..", "lilypond");
const OUTPUT_DIR = path.join(__dirname, "..", "static", "scores");

/**
 * Check if LilyPond is installed
 */
function checkLilyPond() {
  try {
    const result = spawnSync("lilypond", ["--version"], { encoding: "utf-8" });
    if (result.status === 0) {
      const version = result.stdout.split("\n")[0];
      console.log(`✓ Found ${version}`);
      return true;
    }
  } catch {
    // LilyPond not found
  }

  console.error("✗ LilyPond is not installed or not in PATH");
  console.error("");
  console.error("Please install LilyPond:");
  console.error("  - Ubuntu/Debian: sudo apt-get install lilypond");
  console.error("  - macOS: brew install lilypond");
  console.error("  - Windows: https://lilypond.org/download.html");
  console.error("");
  return false;
}

/**
 * Find all .ly files in the lilypond directory
 */
function findLilyPondFiles() {
  if (!fs.existsSync(LILYPOND_DIR)) {
    console.log(`Creating lilypond directory: ${LILYPOND_DIR}`);
    fs.mkdirSync(LILYPOND_DIR, { recursive: true });
    return [];
  }

  const files = fs.readdirSync(LILYPOND_DIR).filter((f) => f.endsWith(".ly"));

  return files.map((f) => path.join(LILYPOND_DIR, f));
}

/**
 * Compile a single .ly file
 */
function compileLilyPondFile(filePath) {
  const fileName = path.basename(filePath, ".ly");
  const tempDir = path.join(OUTPUT_DIR, ".temp");

  // Create temp directory for compilation
  fs.mkdirSync(tempDir, { recursive: true });

  console.log(`  Compiling ${fileName}.ly...`);

  try {
    // Compile to PDF
    execSync(
      `lilypond --pdf -o "${path.join(tempDir, fileName)}" "${filePath}"`,
      {
        stdio: ["pipe", "pipe", "pipe"],
        encoding: "utf-8",
      }
    );

    // Move PDF to output directory
    const pdfSource = path.join(tempDir, `${fileName}.pdf`);
    const pdfDest = path.join(OUTPUT_DIR, `${fileName}.pdf`);
    if (fs.existsSync(pdfSource)) {
      fs.renameSync(pdfSource, pdfDest);
      console.log(`    ✓ Created ${fileName}.pdf`);
    }

    // Try to compile to SVG as well for web display
    try {
      execSync(
        `lilypond --svg -o "${path.join(tempDir, fileName)}" "${filePath}"`,
        {
          stdio: ["pipe", "pipe", "pipe"],
          encoding: "utf-8",
        }
      );

      // Move SVG files to output directory
      const svgFiles = fs
        .readdirSync(tempDir)
        .filter((f) => f.startsWith(fileName) && f.endsWith(".svg"));
      for (const svgFile of svgFiles) {
        const svgSource = path.join(tempDir, svgFile);
        const svgDest = path.join(OUTPUT_DIR, svgFile);
        fs.renameSync(svgSource, svgDest);
        console.log(`    ✓ Created ${svgFile}`);
      }
    } catch {
      // SVG generation is optional
      console.log(`    - SVG generation skipped`);
    }

    return true;
  } catch (error) {
    console.error(`    ✗ Failed to compile ${fileName}.ly`);
    if (error.stderr) {
      console.error(`      ${error.stderr}`);
    }
    return false;
  }
}

/**
 * Clean up temporary files
 */
function cleanup() {
  const tempDir = path.join(OUTPUT_DIR, ".temp");
  if (fs.existsSync(tempDir)) {
    fs.rmSync(tempDir, { recursive: true, force: true });
  }
}

/**
 * Main function
 */
function main() {
  console.log("");
  console.log("🎵 LilyPond Compilation Script");
  console.log("================================");
  console.log("");

  // Check LilyPond installation
  if (!checkLilyPond()) {
    console.error("");
    console.error("⚠ Warning: LilyPond is not installed - skipping score compilation");
    console.error("  Scores will not be available in this build.");
    console.error("");
    // Don't fail the build, just skip LilyPond compilation
    return;
  }

  console.log("");

  // Find .ly files
  const files = findLilyPondFiles();

  if (files.length === 0) {
    console.log("No .ly files found in lilypond/ directory");
    console.log("");
    return;
  }

  console.log(`Found ${files.length} LilyPond file(s)`);
  console.log("");

  // Create output directory
  fs.mkdirSync(OUTPUT_DIR, { recursive: true });

  // Compile each file
  let successCount = 0;
  let failCount = 0;

  for (const file of files) {
    if (compileLilyPondFile(file)) {
      successCount++;
    } else {
      failCount++;
    }
  }

  // Cleanup
  cleanup();

  // Summary
  console.log("");
  console.log("================================");
  console.log(`✓ Compiled: ${successCount}`);
  if (failCount > 0) {
    console.log(`✗ Failed: ${failCount}`);
  }
  console.log(`Output directory: ${OUTPUT_DIR}`);
  console.log("");

  if (failCount > 0) {
    process.exit(1);
  }
}

main();
