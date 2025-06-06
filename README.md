# Exploring Cobol and C/C++ interop

Currently just tested on GnuCobol. Currently two explorations:

- params-copybook: Uses a copybook to share params between main program and
  subprogram. The Cobol subprogram works independently of the copybook string
  pic lengths. This style helps for calling the C/C++ code correctly.
- subprogram-template: Probably too clever for its own good and also behind
  params-copybook in ways. This is an attempt to templatize the params copybook
  and the wrapper subprogram to allow choosing text pic lengths with the copy
  `replacing` feature.
