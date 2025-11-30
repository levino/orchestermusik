\version "2.24.0"

\header {
  title = "Streichquartett-Auszug"
  subtitle = "Übungsmaterial für Ensemble"
  composer = "Beispielkomposition"
  tagline = "Erstellt mit LilyPond - Orchestermusik"
}

violin_one = \relative c'' {
  \clef treble
  \key d \major
  \time 4/4

  d4 fis a fis |
  e4 g fis e |
  d4 cis b a |
  d2. r4 |

  \bar "|."
}

violin_two = \relative c'' {
  \clef treble
  \key d \major
  \time 4/4

  a4 d fis d |
  cis4 e d cis |
  b4 a g fis |
  a2. r4 |

  \bar "|."
}

viola = \relative c' {
  \clef alto
  \key d \major
  \time 4/4

  fis4 a d a |
  a4 cis a a |
  fis4 e d d |
  fis2. r4 |

  \bar "|."
}

cello = \relative c {
  \clef bass
  \key d \major
  \time 4/4

  d4 d d d |
  a4 a a a |
  b4 b g a |
  d2. r4 |

  \bar "|."
}

\score {
  \new StaffGroup <<
    \new Staff \with { instrumentName = "Violine I" } \violin_one
    \new Staff \with { instrumentName = "Violine II" } \violin_two
    \new Staff \with { instrumentName = "Viola" } \viola
    \new Staff \with { instrumentName = "Violoncello" } \cello
  >>

  \layout { }
  \midi { \tempo 4 = 90 }
}
