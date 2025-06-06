       identification division.
       program-id. rep-repeat.

       data division.
       working-storage section.
       01  in-len  pic 9(4) comp-5.
       01  out-len pic 9(4) comp-5.

       linkage section.
       copy rep-repeat-params.

       procedure division
           using
               rep-repeat-in
               rep-repeat-count
               rep-repeat-out.
           compute in-len = function length(rep-repeat-in)
           compute out-len = function length(rep-repeat-out)
           call "rep_repeat_cobol" using
               rep-repeat-in
               in-len
               rep-repeat-count
               rep-repeat-out
               out-len
           goback.
       end program rep-repeat.
