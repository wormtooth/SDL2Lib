all:
	bash build.sh sdl2 sdl2gfx sdl2image sdl2ttf sdl2mixer

sdl2:
	bash build.sh sdl2

sdl2gfx: sdl2
	bash build.sh sdl2gfx

sdl2image: sdl2
	bash build.sh sdl2image

sdl2ttf: sdl2
	bash build.sh sdl2ttf

sdl2mixer: sdl2
	bash build.sh sdl2mixer

install:
	bash build.sh install

clean:
	bash build.sh clean

clean-all:
	rm -fr SDL2 tmp

