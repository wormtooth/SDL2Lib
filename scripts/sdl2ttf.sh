SDL2_TTF_VERSION=2.0.15
SDL2_TTF_SRC=https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${SDL2_TTF_VERSION}.tar.gz

build_sdl2ttf() {
    if lib_existed libSDL2_ttf.a ; then
        return
    fi
    echo "##### Building SDL2_ttf-${SDL2_TTF_VERSION} #####"
    enter_src_folder $SDL2_TTF_SRC

    #build dependencies
    cd external
    echo "=== Building dependency: freetype ==="
    enter_folder freetype
    build
    cd ..
    echo "=== Built dependency: freetype ==="
    cd ..

    build
    echo "##### Built SDL2_ttf-${SDL2_TTF_VERSION} #####"
}

build_sdl2ttf
