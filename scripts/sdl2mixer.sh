SDL2_MIXER_VERSION=2.0.4
SDL2_MIXER_SRC=https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${SDL2_MIXER_VERSION}.tar.gz
SDL2_MIXER_OPTS="
--disable-music-flac-shared
--disable-music-midi-fluidsynth-shared
--disable-music-mod-mikmod-shared
--disable-music-mod-modplug-shared
--disable-music-mp3-mpg123-shared
--disable-music-ogg-shared
--disable-music-opus-shared
--disable-shared
"

build_sdl2mixer() {
    if lib_existed libSDL2_mixer.a ; then
        return
    fi
    echo "##### Building SDL2_mixer-${SDL2_MIXER_VERSION} #####"
    enter_src_folder $SDL2_MIXER_SRC
    cp $SCRIPTS_DIR/endian.h $BUILD_DIR/include

    # build dependency
    cd external

    deps="libogg flac mpg123 libvorbis"
    for dep in $deps; do
        if [[ $dep == flac ]]; then
            extra_opts=--disable-cpplibs
        else
            extra_opts=
        fi
        echo "=== Building dependency: $dep ==="
        enter_folder $dep
        build $extra_opts
        cd ..
        echo "=== Built dependency: $dep ==="
    done

    cd ..

    build $SDL2_MIXER_OPTS
    echo "##### Built SDL2_mixer-${SDL2_MIXER_VERSION} #####"
}

build_sdl2mixer
