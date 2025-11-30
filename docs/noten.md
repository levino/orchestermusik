---
sidebar_position: 2
---

# Noten

Hier finden Sie alle verfügbaren Noten zum Download. Die Quelldateien (`.ly`) können Sie im [GitHub Repository](https://github.com/levino/orchestermusik/tree/main/lilypond) finden und selbst bearbeiten.

## Übungsmaterial

### Tonleiter-Übung (C-Dur)

Eine einfache C-Dur Tonleiter für Anfänger.

- [PDF herunterladen](/scores/example-scale.pdf)
- [Quelldatei (.ly)](https://github.com/levino/orchestermusik/blob/main/lilypond/example-scale.ly)

### Kleine Melodie (für Violine)

Eine einfache Melodie in G-Dur für Violine.

- [PDF herunterladen](/scores/simple-melody.pdf)
- [Quelldatei (.ly)](https://github.com/levino/orchestermusik/blob/main/lilypond/simple-melody.ly)

## Ensemble

### Streichquartett-Auszug

Ein kurzer Auszug für Streichquartett (2 Violinen, Viola, Violoncello) in D-Dur.

- [PDF herunterladen](/scores/string-quartet-excerpt.pdf)
- [Quelldatei (.ly)](https://github.com/levino/orchestermusik/blob/main/lilypond/string-quartet-excerpt.ly)

## Eigene Noten kompilieren

Um die LilyPond-Quelldateien selbst zu kompilieren, benötigen Sie [LilyPond](https://lilypond.org/).

### Installation

- **Ubuntu/Debian**: `sudo apt-get install lilypond`
- **macOS**: `brew install lilypond`
- **Windows**: [Download von lilypond.org](https://lilypond.org/download.html)

### Kompilierung

```bash
# Einzelne Datei kompilieren
lilypond dateiname.ly

# Alle Dateien im Repository kompilieren
npm run lilypond
```
