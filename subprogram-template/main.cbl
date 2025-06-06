       identification division.
       program-id. repeatcall.

       data division.
       working-storage section.
       copy repeat-params.

       procedure division.
           move "hi" to repeat-in-str
           move 3 to repeat-count
           call "repeat-wrapper" using
               repeat-in-str repeat-count repeat-out-buf
           display "result: [" repeat-out-buf "]"
           stop run.
