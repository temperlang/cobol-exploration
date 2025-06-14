mkdir -p build && \
g++ -c repeat.cpp -o build/repeat.o && \
ar rcs build/librepeat.a build/repeat.o && \
g++ -c repeat-cobol.cpp -o build/repeat-cobol.o && \
cobc -fstatic-call -x main.cbl rep-repeat.cbl \
    build/repeat-cobol.o -Lbuild -lrepeat -lstdc++ -o build/main && \
./build/main
