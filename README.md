# Credit
Original project https://github.com/Godot-dcl/ffmpeg-node
Updated to Godot release build 4.0.1

# Linux

```
git submodule update --init --recursive

cd ffmpeg_build_scripts
./linux.sh

cd ..
scons target=template_debug dev_build=yes
```
# Windows

Precompiled ffmpeg libraries (4.4) can be found here:

https://github.com/BtbN/FFmpeg-Builds/wiki/Latest

Download the win64-gpl-shared-4.4

Unpack the package and copy include, lib and bin into [project]/lib/windows/x86_64:

```
scons target=template_debug dev_build=yes
```

Copy all dlls from ffmpeg-4-shared/bin to bin/windows:

```
$ cp ffmpeg-4-shared/bin/*.dll bin/windows/

$ ls bin/windows
avcodec-58.dll*  avdevice-58.dll*  avfilter-7.dll*  avformat-58.dll*  avutil-56.dll*  libffmpegmediadecoder.64.dll*  libffmpegmediadecoder.64.exp  libffmpegmediadecoder.64.lib  postproc-55.dll*  swresample-3.dll*  swscale-5.dll*
```
