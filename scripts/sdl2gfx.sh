SDL2_GFX_VERSION=1.0.4
SDL2_GFX_SRC=https://sourceforge.net/projects/sdl2gfx/files/SDL2_gfx-${SDL2_GFX_VERSION}.tar.gz

build_sdl2gfx() {
    if lib_existed libSDL2_gfx.a ; then
        return
    fi
    echo "##### Building SDL2_gfx-${SDL2_GFX_VERSION} #####"
    cd $TMP_DIR
    enter_src_folder $SDL2_GFX_SRC
    build
    echo "##### Built SDL2_gfx-${SDL2_GFX_VERSION} #####"
}

build_sdl2gfx
