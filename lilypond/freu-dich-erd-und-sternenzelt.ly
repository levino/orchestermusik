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

    g4-3\downbow a-0 b c\upbow |
    d d d2 |
    c4\upbow d e2-4 |
    d1-3 |
    d4 d c\upbow c |
    b-1 b a2 |
    b4 c4\upbow a2 |
    g1-3 |
    b4-1 a b c\upbow |
    d2 a-0 |
    b4-1 a b c\upbow |
    d2 a-0 |
    b e-4 |
    d4-3 b-1 a2-0 |
    g1-3\fermata
    \bar "|."\mark \markup { \musicglyph "scripts.ufermata" }
  }
  \layout { }
  \midi { \tempo 4 = 100 }
}
