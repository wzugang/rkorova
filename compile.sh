#!/bin/bash 
gcc -Wall -fPIC -c -o rk.o rk.c
gcc -shared -fPIC -s -Wl,-soname -Wl,librkorova.so -ldl -o librk.so rk.o
rm rk.o
