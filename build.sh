#!/bin/bash

WORK_DIR=`pwd`
TMP_DIR=$WORK_DIR/tmp
BUILD_DIR=$TMP_DIR/macos
PROD_DIR=$WORK_DIR/SDL2
SCRIPTS_DIR=$WORK_DIR/scripts
mkdir -p $TMP_DIR $BUILD_DIR
CONFIG_OPTS="--prefix=${BUILD_DIR} --enable-shared=no"
export PKG_CONFIG_PATH=$BUILD_DIR/lib/pkgconfig:$PKG_CONFIG_PATH
export CFLAGS="-I$BUILD_DIR/include"
export LDFLAGS="-L$BUILD_DIR/lib"

download() {
    # $1 URL; #2 filename
    if [ -f $2 ]; then
        echo "$2: already downloaded"
    else
        echo "$2: downloading ..."
        curl -L $1 -o $2
        echo "$2: downloaded"
    fi
}

extract() {
    # $1 filename
    folder=`basename $1 .tar.gz`
    if [ -d $folder ]; then
        echo "$1: already extracted"
    else
        echo "$1: extracting ..."
        tar -xzf $1
        echo "$1: extracted"
    fi
}

build() {
    set +e
    ./configure $CONFIG_OPTS $@
    make
    make install
    set -e
}

enter_src_folder() {
    # $1 url
    cd $TMP_DIR
    fname=`basename $1 .tar.gz`
    download $1 ${fname}.tar.gz
    extract ${fname}.tar.gz
    cd $fname
}

enter_folder() {
    # $1 folder name without version info
    for folder in `ls -d */`; do
        if [[ $folder == $1* ]]; then
            cd $folder
            break
        fi
    done
}

lib_existed() {
    # $1 lib to check
    if [ -f $BUILD_DIR/lib/$1 ]; then
        echo "$1 has built already. Skip."
        echo "To rebuild $1, clean first: make clean"
        return 0
    fi
    return 1
}

for src in $@; do
    source $SCRIPTS_DIR/$src.sh
done
