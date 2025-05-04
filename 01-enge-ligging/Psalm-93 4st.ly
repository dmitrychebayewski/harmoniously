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
  c-3 a-5  c-8 b4-3 g-5 a-8 b-3 c2-8 a-5 g-8 b\rest g\breve-8
  \revert Score.BarLine.stencil
  \bar "||"
}

Words = \lyricmode { 
  
}

AltoMusic = \relative c' {
  \key c \major
  
  
}

TenorMusic = \relative a {
   \key c \major
 
}


BassMusic =  \relative c' {
 \key c \major
 g\breve
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