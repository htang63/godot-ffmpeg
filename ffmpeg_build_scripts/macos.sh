#!/bin/sh

cd ../ffmpeg

ARCH=$(uname -m)

./configure \
	--prefix=./../lib/macos/${ARCH} \
	--enable-pthreads \
	--enable-shared \
	--disable-static \
	--disable-zlib \
	--disable-programs \
	--disable-doc \
	--disable-manpages \
	--disable-podpages \
	--disable-txtpages \
	--disable-ffplay \
	--disable-ffprobe \
	--disable-ffmpeg \
	--disable-yasm \
	--arch=${ARCH}

make clean
make install
