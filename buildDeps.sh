#!/bin/bash

cd deps/sdl2
mkdir libs
cd libs
cmake ..
make
cd ../../..

cd deps/glew
make extensions
make
cd ../..

cd deps/glfw
cmake .
make
cd ../..

cd deps/glm
cmake .
make
cd ../..
