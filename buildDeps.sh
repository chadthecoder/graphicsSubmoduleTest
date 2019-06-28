cd deps/sdl2
mkdir libs
cd libs
cmake ..
make
cd ../../..

cd deps/glfw
cmake .
make
cd ../..