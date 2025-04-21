\version "2.24.4"

\paper {
  #(set-paper-size "a4")
  % Add space for instrument names
  indent = 10\mm
}

\header { 
 title = "Psalm 140"
  subtitle = "vierstemmig zetting"
  arranger = "arr. B. Matter"
}

SopranoMusic = \relative g' {
  \key g \major
  g2-8 g4-3 a-5  \override Score.BarLine.stencil = ##f 
  b2-3 b4-5 c2-3 c4-8 b2-3 a-5 b \rest 
  b-3 c4-8 b-3 a-5 g-3 
  fis2-5 g-3 a-5 b \rest 
  d-3 c4-8 b-3 a2-5 fis-3 g4-8 fis-3 e2-5 d-8 b' \rest 
  b-3 c4-8 b-3 a-5 g-8 b2-3 a-5 g\breve-8
  \revert Score.BarLine.stencil
  \bar "||"
}

Words = \lyricmode { 
  Be- scherm mij, Heer, be- hoed mijn le- ven, 
  dat door ge- weld wordt o- ver- mand.
  Be- dwing hen die naar on- recht stre ven,
  wier strijd- lust el- ke dag ont- brand
}

AltoMusic = \relative c' {
  \key g \major
  d2 e4 fis4
  g2 g4 a2 g4 g2  fis2 s
  g2 g4 g fis e d2 e fis s
  <b fis> g4 g fis2 d d4 d c2 s s
  g' g4 g fis d g2 fis d\breve
  
}

TenorMusic = \relative a {
   \key g \major
  b2 b4 d4 d2 e4 e2 e4 d2 d2 s
  d e4 d d b b2 b d s
  s e4 d d2 a b4 a a2
  <fis a> s d' e4 d d b d2 d b\breve
}


BassMusic =  \relative c' {
 \key g \major
 g2 e4 d4 g2 e4 a,2 c4 g'2 d d \rest
 g2 c,4 g' d e b2 e d d \rest
 b c4 g' d,2 d' g,4 d' a2 d d \rest
 g c,4 g' d g g,2 d' g\breve
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