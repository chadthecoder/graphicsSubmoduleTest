cc = g++

main = main.cpp

linksWin = -lglew32 -lglfw3 -lgdi32 -lopengl32 -lmingw32 -lSDL2main -lSDL2

linksLin = -lSDL2main -lSDL2
fun = -lGLEW -lglfw 

includeDepsWin = -I "libsWin\glew\include" -I "libsWin\glfw\include" -I "libsWin\SDL2\i686-w64-mingw32\include"

includeDepsLin = -I ".\deps\sdl2\include\"

linkingDepsWin = -L "libsWin\glew\lib\Release\Win32" -L "libsWin\glfw\lib-mingw" -L "libsWin\SDL2\i686-w64-mingw32\lib"

linkingDepsLin = -L ".\deps\sdl2\libs\"

libsWin = $(includeDepsWin) $(linkingDepsWin) $(linksWin)

libsLin = $(includeDepsLin) $(linkingDepsLin) $(linksLin)

dotOWin = windows/main.o windows/Game.o

dotOLin = linux/main.o

iconO = windows/windows.res

outputWin = -o "windows/Rocket League"

outputLin = -o "linux/main"

win: $(dotOWin)
	windres windows/windows.rc -O coff -o $(iconO)
	$(cc) $(outputWin) $(dotOWin) $(iconO) $(libsWin)

windows/main.o: main.cpp
	$(cc) -c main.cpp -o windows/main.o

windows/Game.o: Game.cpp
	$(cc) -c Game.cpp -o windows/Game.o

runWin:
	"windows/Rocket League"

lin: $(dotOLin)
	$(cc) $(outputLin) $(dotOLin) $(libsLin)

linux/main.o: main.cpp
	$(cc) -c main.cpp -o linux/main.o

runLin:
	./linux/main

clean:
	rm linux/*.o
	rm linux/main