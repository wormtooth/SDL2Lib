SDL2_PROD=$PROD_DIR
SDL2_INC=$SDL2_PROD/include
SDL2_LIB=$SDL2_PROD/lib

mkdir -p $SDL2_INC $SDL2_LIB

cp -R $BUILD_DIR/include/SDL2/ $SDL2_INC/
cd $BUILD_DIR/lib
copylibs="
libSDL2.a

libSDL2_gfx.a

libSDL2_image.a
libjpeg.a
libpng16.a
libwebp.a
libtiff.a

libSDL2_ttf.a
libfreetype.a

libSDL2_mixer.a
libFLAC.a
libmpg123.a
libogg.a
libvorbis.a
libvorbisfile.a
"
for lib in $copylibs; do
	cp $lib $SDL2_LIB
done
