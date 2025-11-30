\version "2.24.0"

\header {
  title = "Tonleiter-Übung"
  subtitle = "C-Dur Tonleiter"
  composer = "Übungsmaterial"
  tagline = "Erstellt mit LilyPond - Orchestermusik"
}

\score {
  \relative c' {
    \clef treble
    \key c \major
    \time 4/4

    % Aufsteigende C-Dur Tonleiter
    c4 d e f |
    g a b c' |

    % Absteigende C-Dur Tonleiter
    c'4 b a g |
    f e d c |

    \bar "|."
  }

  \layout { }
  \midi { \tempo 4 = 120 }
}
