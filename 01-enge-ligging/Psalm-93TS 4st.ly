\version "2.24.4"

\paper {
  #(set-paper-size "a4")
  % Add space for instrument names
  indent = 10\mm
}

\header { 
 title = "Psalm 93"
  subtitle = "vierstemmig (tenor)zetting"
  arranger = "zett. C. Goudimel"
}

SopranoMusicX = \relative g' {
  \key c \major
  g2-8 e-5 \override Score.BarLine.stencil = ##f  f-3
  g4-5 g-3 a-5 c-8 c-5 b-3 c2-8  b\rest 
  c-3 a-5  c-8 b4-3 g-5 a-8 b-3 c2-8 a-5 g-8 b\rest 
  e,-5 f4-3 g-5 a2-3 g-5 f4-3 d-5 e-8 e-3 d2-5 b'\rest
  g2-8 g4-5 g-3 a2-5 c-8 c4-5 b-3 c2-8 a-5 g\breve-8
  \revert Score.BarLine.stencil
  \bar "||"
}

SopranoMusic = \relative c'' {
  g2 g \override Score.BarLine.stencil = ##f f d4 d f e g g g2 r
  g2 fis g g4 d f g a( g2) fis4 g2 r
  g2 f4 e f2 e d4 d cis cis d2 r
  d2 e4 e f2 g g4 g a( g2) fis4 g1
   \revert Score.BarLine.stencil
  \bar "||"
}

Words = \lyricmode { 
  De Heer is ko- ning, Hij re- geert al- tijd,
  om- gord met macht, be- kleed met ma- jes- teit.
  Hij grond- vest de~aar- de, houdt haar vast in stand.
  On- wrik- baar staat het bouw- werk van zijn hand.
}

AltoMusic =\relative c' {
  d2 c a b4 b c c d d e2 r
  e2 d e d4 b d d e2 d d r
  c2 a4 c c2 c a4 a a a a2 r
  b2 c4 b d2 e e4 d e2 d d1
}

TenorMusic = \relative c' {
  g2 e f g4 g a c c b c2 r
  c2 a c b4 g a b c2 a g r
  e2 f4 g a2 g f4 d e e d2 r
  g2 g4 g a2 c c4 b c2 a g1
}


BassMusic =  \relative c {
  g2 c d g,4 g' f a g g c,2 r
  c2 d c g'4 g d g c,2 d g, r
  c2 d4 c f2 c d4 d a a d2 r
  g,2 c4 e d2 c c4 g c2 d g,1
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
          \new Lyrics \lyricsto "Soprano" {
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