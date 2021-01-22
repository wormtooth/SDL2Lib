SDL2_VERSION=2.0.14
SDL2_SRC=https://www.libsdl.org/release/SDL2-${SDL2_VERSION}.tar.gz

build_sdl2() {
    if lib_existed libSDL2.a ; then
        return
    fi
    echo "##### Building SDL2-${SDL2_VERSION} #####"
    enter_src_folder $SDL2_SRC
    build
    echo "##### Built SDL2-${SDL2_VERSION} #####"
}

build_sdl2
