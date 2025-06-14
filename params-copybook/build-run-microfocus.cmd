@echo off
cl /c /Fo:build\ repeat.cpp
cl /c /Fo:build\ repeat-cobol.cpp
pushd build\
cbllink ..\main.cbl ..\rep-repeat.cbl repeat-cobol.obj repeat.obj msvcprt.lib libcmt.lib
popd
.\build\main
