#!/usr/bin/env python

import os
import sys

env = SConscript("godot-cpp/SConstruct")

if env['platform'] == "windows" and not env["use_mingw"]:
    env.msvc = True
else:
    env.msvc = False

arch = "x86_64"

if env["platform"] == "windows":
    env.Append(LIBPATH=["lib/" + env["platform"] + "/" + arch + "/bin"])
    if not (env.msvc):
        env["CXX"] = "x86_64-w64-mingw32-g++-posix"
        env["LINK"] = "x86_64-w64-mingw32-g++-posix"
        env["SHLIBSUFFIX"] = ".dll.a"

env.Append(LIBPATH=["lib/" + env["platform"] + "/" + arch + "/lib"])
env.Append(CPPPATH=["src/", "lib/" + env["platform"] + "/" + arch + "/include"])
env.Append(LIBS=["avformat", "avcodec", "avutil", "swresample", "swscale"])
sources = Glob("src/*.cpp") + Glob("lib/*.c")

suffix = env["SHLIBSUFFIX"]
if env["platform"] == "windows":
    suffix = ".dll"

library = env.SharedLibrary("bin/" + env["platform"] + "/libffmpegmediadecoder.64" + suffix, source=sources)

Default(library)
