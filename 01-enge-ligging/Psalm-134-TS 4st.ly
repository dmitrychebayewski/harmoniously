\version "2.24.4"

psalm = 134

\paper {
  #(set-paper-size "a4")
  % Add space for instrument names
  indent = 10\mm
}

\header { 
 title = "Psalm 134"
  subtitle = "tenorzetting"
  arranger = "~~C. Goudimel"
}


SopranoMusic = \relative c'' {
   \key g \major
  b2-5  b4-5 \override Score.BarLine.stencil = ##f a-8 a4-3 fis-8 e( g2-8 fis4 -3 g2-8) d'\rest
  g,-3  fis4-5 g-8 e-5 e-3 g2-5 g-8 fis-3 d'\rest
  
  \revert Score.BarLine.stencil
  \bar "||"
}

Words = \lyricmode { 
  Looft, looft nu all- ler heer- en HEER,
  Gij, zij- ne knech- ten, geeft Hem eer;
  Gij, die des nachts zijn huis be- waakt
  
}

AltoMusic =\relative c' {
  d2 d4 d c b b2 d d g\rest
  e d4 d c c e2 d d g\rest
  
}

TenorMusic = \relative c' {
  g2-G g4-G fis4-D e4-Am d4-Bm g2-E a2-D b2-G f\rest
  b2-Em b4-Bm b4-G a4-Am g4-C c2-C b2-G a2-D r
  g2-G a4-D b4-G a4-Am g4-C e2-Bm fis2-D g2-G r
  d'2-D b2-G g2-C a4-8 c-5 b2-8 a-3 g1-5
}


BassMusic =  \relative c {
  \key g \major
  g2 g4 d' a b e2 d g, b\rest
  e b4 g a c c2 g4 (b4) d2 b\rest
  g d'4 g, a c c (a2  d4) g,2 b2\rest
  g' g, c
}

global = {
  \time 2/2
}

% Use markup to center the chant on the page
\markup {
  \fill-line {
    \score {  % centered
      
      <<
        \new ChoirStaff <<
          \new Staff <<
            \global
            \clef "treble"
            \new Voice = "Soprano" <<
              \voiceOne
              \SopranoMusic
            >>
            \new Voice = "Alto" <<
              \voiceTwo
              \AltoMusic
            >>
          >>
          \new Staff <<
            \clef "bass"
            \global
            \new Voice = "Tenor" <<
              \voiceOne
               #(set-accidental-style 'forget)
              \once \override TextScript #'X-offset = #-2
              s2-\markup \italic { c.f. }
              \TenorMusic
            >>
            \new Voice = "Bass" <<
              \voiceTwo
              \BassMusic
            >>
          >>
          \new Lyrics \lyricsto "Tenor" {
           \Words
          }
        >>
      >>
      \layout {
        \context {
          \Score
          \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/2)
        }
        \context {
          \Staff
          \remove "Time_signature_engraver"
        }
      }
    }  % End score
  }
}  % End markup