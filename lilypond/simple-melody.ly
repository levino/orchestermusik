\version "2.24.0"

\header {
  title = "Kleine Melodie"
  subtitle = "für Violine"
  composer = "Anonym"
  tagline = "Erstellt mit LilyPond - Orchestermusik"
}

\score {
  \new Staff {
    \relative c'' {
      \clef treble
      \key g \major
      \time 3/4

      % Erster Teil
      g4 a b |
      a2 g4 |
      fis4 e d |
      g2. |

      % Zweiter Teil
      b4 c d |
      c2 b4 |
      a4 g fis |
      g2. |

      \bar "|."
    }
  }

  \layout { }
  \midi { \tempo 4 = 100 }
}
