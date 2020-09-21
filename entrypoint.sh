#!/bin/sh -l

swift build -v -Xlinker --export-dynamic -Xswiftc -g -Xlinker -L/usr/lib/x86_64-linux-gnu/hdf5/serial -Xcc -I/usr/include/hdf5/serial/
swift test -v -Xlinker --export-dynamic -Xswiftc -g -Xlinker -L/usr/lib/x86_64-linux-gnu/hdf5/serial -Xcc -I/usr/include/hdf5/serial/
