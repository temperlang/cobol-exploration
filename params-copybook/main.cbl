       identification division.
       program-id. repeatcall.

       data division.
       working-storage section.
       copy rep-repeat-params.

       procedure division.
           move "hi" to rep-repeat-in
           move 3 to rep-repeat-count
           call "rep-repeat" using
               rep-repeat-in rep-repeat-count rep-repeat-out
           display "result: [" rep-repeat-out "]"
           goback.
