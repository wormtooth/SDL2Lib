# SDL2 static libraries

The project builds static libraries for SDL2 and its extension libraries for OS X. Currently, it has

- SDL2
- SDL2_gfx
- SDL2_image (with jpg, png, tif and webp supported)
- SDL2_ttf
- SDL2_mixer (with flac, mp3, and ogg supported)

Before build, install the following required packages from [homebrew](https://brew.sh).

```bash
brew install autoconfig automake libtool
```

## How to Build

To build all libraries:

```bash
make && make install
```

If successfully finished, there is a folder **SDL2** in the root directory of the project. It contains necessary headers in **include** and static libraries in **lib**.

## How to Use

Add **SDL2** to Xcode project and link against the following frameworks:

- ApplicationServices.framework
- AudioToolbox.framework
- AudioUnit.framework
- Carbon.framework
- Cocoa.framework
- CoreAudio.framework
- CoreHaptics.framework
- CoreServices.framework
- CoreVideo.framework
- ForceFeedback.framework
- GameController.framework
- IOKit.framework
- Metal.framework
- OpenGL.framework
- QuartzCore.framework
- libbz2.tbd
- libz.tbd
- libiconv.tbd
