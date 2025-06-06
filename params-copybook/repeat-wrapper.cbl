       identification division.
       program-id. repeat-wrapper.

       data division.
       working-storage section.
       01  in-len       pic 9(4) comp-5.
       01  out-len      pic 9(4) comp-5.

       linkage section.
       copy repeat-params.

       procedure division
           using
               repeat-in-str
               repeat-count
               repeat-out-buf.
           compute in-len = function length(repeat-in-str)
           compute out-len = function length(repeat-out-buf)
           call "repeat_string" using
               repeat-in-str
               in-len
               repeat-count
               repeat-out-buf
               out-len
           goback.
       end program repeat-wrapper.
