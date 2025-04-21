\version "2.24.4"

\paper {
  #(set-paper-size "a4")
  % Add space for instrument names
  indent = 10\mm
}

\header { 
 title = "Psalm 140"
  subtitle = "manualiter zetting"
  subsubtitle = "in een enge ligging"
  instrument = "voor keyboard"
  arranger = "arr. B. Matter"
}

treble = \relative g {
    \key g \major
    \chordmode {
      g2/b  e4:m/b d \override Score.BarLine.stencil = ##f
      \override Score.BarNumber.stencil = ##f
      g2/d e4:m a2:m/e c'4/e g2/d
      d2
      
    }
    \relative {
      b'\rest
    }
    \chordmode {
      g2/d c'4/e g/d d e4:m/b b,2:m e:m/b d
    }
    \relative {
      b'\rest
    }
    \chordmode {
      b:m/fis c'4/e g/d d2 d/a g4/b d/a a,2:m d/fis
   } 
   \relative {
      b'\rest
   }
   \chordmode {
      g/d c'4/e g/d d4 g4/b c'2/e d2 g/b
      \revert Score.BarLine.stencil
       \bar "||"
       
   }
}

bass = \relative c { 
  \clef "bass"
  \key g \major
  \relative c {
    g'2 e4 d 
    g2 e4 a,2 c4 g'2
    d d\rest
    g c,4 g' d e b2 e2
    d d\rest
    b c4 g' d,2 d' g,4 d' a2 d
    d\rest
    g, c4 g' d g4 c,2 d g,
  } 
}
<<

  \new ChordNames {
    \treble
  }
  \new Staff {
  \treble
  }
  \new Staff {
  \bass
  }
>>
 \layout {
   \context {
          \Score
          \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
        }
   \context {
    \Staff
    \remove "Time_signature_engraver"
  }
}

