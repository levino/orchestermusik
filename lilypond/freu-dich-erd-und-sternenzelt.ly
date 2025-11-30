\version "2.24.0"

\header {
  title = "Freu dich, Erd und Sternenzelt"
  subtitle = ""
  composer = "Traditionell"
}
\score {
  \relative c'' {
    \key g \major
    \time 2/2

    g4 a b c |
    d d d2 |
    c4 d e2 |
    d1 |
    d4 d c c |
    b b a2 |
    b4 c4 a2 |
  }
  \layout { }
  \midi { \tempo 4 = 100 }
}
