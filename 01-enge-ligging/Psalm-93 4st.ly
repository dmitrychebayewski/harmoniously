\version "2.24.4"

\paper {
  #(set-paper-size "a4")
  % Add space for instrument names
  indent = 10\mm
}

\header { 
 title = "Psalm 93"
  subtitle = "vierstemmig zetting"
  arranger = "arr. B. Matter"
}

SopranoMusic = \relative g' {
  \key c \major
  g2-8 e-5 \override Score.BarLine.stencil = ##f  f-3
  g4-5 g-3 a-5 c-8 c-5 b-3 c2-8  b\rest 
  c-3 a-5  c-8 b4-3 g-5 a-8 b-3 c2-8 a-5 g-8 b\rest 
  e,-5 f4-3 g-5 a2-3 g-5 f4-3 d-5 e-8 e-3 d2-5 b'\rest
  g2-8 g4-5 g-3 a2-5 c-8 c4-5 b-3 c2-8 a-5 g\breve-8
  \revert Score.BarLine.stencil
  \bar "||"
}

Words = \lyricmode { 
  De Heer is ko- ning, Hij re- geert al- tijd,
  om- gord met macht, be- kleed met ma- jes- teit.
  Hij grond- vest de~aar- de, houdt haar vast in stand.
  On- wrik- baar staat het bouw- werk van zijn hand.
}

AltoMusic = \relative c' {
  \key c \major
  d2 c d e4 e f <g e> <a f> g <g e>2 s 
  a  f <g e> g4 e e g <g e>2 f d 
  s c d4 e f2 e d4 b a c b2 
  s d e4 e f2 <g e> a4 g <g e>2 f d\breve
  
  
}

TenorMusic = \relative a {
   \key c \major
 b2 a  a c4 b d s s d s s s s 
 d2 d  s d4 c c d s s d2 b 
 s a a4 c c2 c a4 g a f g2 
 s b c4 b d2 s f4 d s s d2 b\breve
}


BassMusic =  \relative c' {
 \key c \major
 g2 a, d c4 e d c' f, g c2 d, \rest
 a' d, c' g4 c, a' g c2 d, g 
 s a, d4 c f2 c d4 g, e' c g2
 d'\rest g c,4 e d2 c' f,4 g c2 d,2 g\breve
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