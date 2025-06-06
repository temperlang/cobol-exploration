GNU tools:

```
mkdir -p build && \
g++ -c repeat.cpp -o build/repeat.o && \
ar rcs build/librepeat.a build/repeat.o && \
cobc -x main.cob -fstatic-call -Lbuild -lrepeat -o build/main && \
./build/main
```

```
Result: [Hi        Hi        Hi                                                                             ]
```

Powershell with MSVC tools (noting the warning below that seems to be ok):

```
if (-not (Test-Path build)) { mkdir build }
cl /c /EHsc /Fo:build\ repeat.cpp
lib /out:build\repeat.lib build\repeat.obj
cobc -x main.cob -fstatic-call build\repeat.lib -o build\main
.\build\main
```

```
Microsoft (R) C/C++ Optimizing Compiler Version 19.43.34810 for x64
Copyright (C) Microsoft Corporation.  All rights reserved.

repeat.cpp
Microsoft (R) Library Manager Version 14.43.34810.0
Copyright (C) Microsoft Corporation.  All rights reserved.

Warning: corrupt .drectve at end of def file
Result: [Hi        Hi        Hi                                                                             ]
```

If just C, can do this:

```
cobc -x main.cob repeat.c && ./main
```
