## Things that seem to work

Posix shell and GNU tools:

```sh
mkdir -p build && \
g++ -c repeat.cpp -o build/repeat.o && \
ar rcs build/librepeat.a build/repeat.o && \
g++ -c repeat-cobol.cpp -o build/repeat-cobol.o && \
cobc -fstatic-call -x main.cbl rep-repeat.cbl \
    build/repeat-cobol.o -Lbuild -lrepeat -lstdc++ -o build/main && \
./build/main
```

```
result: [Hi        Hi        Hi                                                                             ]
```

Powershell with GNU tools:

```ps1
if (-not (Test-Path build)) { mkdir build }
g++ -c repeat.cpp -o build/repeat.o && `
ar rcs build/librepeat.a build/repeat.o && `
g++ -c repeat-cobol.cpp -o build/repeat-cobol.o && `
cobc -fstatic-call -x main.cbl rep-repeat.cbl `
    build/repeat-cobol.o -Lbuild -lrepeat -lstdc++ -o build/main && `
./build/main
```

```
result: [hi        hi        hi                                                                              ]
```

## Things that probably won't work for us

Powershell with MSVC tools:

```ps1
if (-not (Test-Path build)) { mkdir build }
cl /c /EHsc /Fo:build\ repeat.cpp
lib /out:build\repeat.lib build\repeat.obj
cl /c /EHsc /Fo:build\ repeat-cobol.cpp
lib /out:build\repeat-cobol.lib build\repeat-cobol.obj
pushd build
cobc -fstatic-call -C -I.. ../main.cbl ../rep-repeat.cbl
popd
```

The above works, but below are multiple different failures.

```
cl /EHsc build\main.c build\rep-repeat.c repeat.cpp repeat-cobol.cpp `
    /I C:\Users\work2\Apps\GC32M-BDB-x64\include /I build `
    /link build\repeat.lib build\repeat-cobol.lib /OUT:build\main.exe
cobc -fstatic-call -x main.cbl rep-repeat.cbl `
    build\repeat-cobol.lib build\repeat.lib -o build\main
.\build\main
```

It used to work before c++ std lib got involved (noting the warning below that
seemed to be ok):

```
Microsoft (R) C/C++ Optimizing Compiler Version 19.43.34810 for x64
Copyright (C) Microsoft Corporation.  All rights reserved.

repeat.cpp
Microsoft (R) Library Manager Version 14.43.34810.0
Copyright (C) Microsoft Corporation.  All rights reserved.

Warning: corrupt .drectve at end of def file
result: [Hi        Hi        Hi                                                                             ]
```

If just C, can do this:

```
cobc -x main.cbl repeat.c && ./main
```
