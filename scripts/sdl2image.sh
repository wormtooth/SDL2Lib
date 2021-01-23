SDL2_IMAGE_VERSION=2.0.5
SDL2_IMAGE_SRC=https://www.libsdl.org/projects/SDL_image/release/SDL2_image-${SDL2_IMAGE_VERSION}.tar.gz

build_sdl2image() {
    if lib_existed libSDL2_image.a ; then
        return
    fi
    echo "##### Building SDL2_image-${SDL2_IMAGE_VERSION} #####"

    enter_src_folder $SDL2_IMAGE_SRC

    #build dependencies
    cd external
    for dep in `ls -d */`; do
        # skip zlib as it is part of macos already
        if [[ $dep == zlib* ]]; then
            continue
        fi
        echo "=== Building dependency: $dep ==="
        cd $dep
        if [[ $dep == libwebp* ]]; then
            ./autogen.sh
        fi
        if [[ $dep == tiff* ]]; then
            extra_opts=--disable-cxx
        else
            extra_opts=
        fi
        build $extra_opts
        cd ..
        echo "=== Built dependency: $dep ==="
    done
    cd ..

    cd $TMP_DIR
    rm -fr SDL2_image-${SDL2_IMAGE_VERSION}
    extract SDL2_image-${SDL2_IMAGE_VERSION}.tar.gz
    cd SDL2_image-${SDL2_IMAGE_VERSION}
    build

    echo "##### Built SDL2_image-${SDL2_IMAGE_VERSION} #####"
}

build_sdl2image
