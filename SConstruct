#!/usr/bin/env python

import os
import sys

env = SConscript("godot-cpp/SConstruct")

if env['platform'] == "windows" and not env["use_mingw"]:
    env.msvc = True
else:
    env.msvc = False

if env["platform"] == "windows":
    if not (env.msvc):
        env["CXX"] = "x86_64-w64-mingw32-g++-posix"
        env["LINK"] = "x86_64-w64-mingw32-g++-posix"
        env["SHLIBSUFFIX"] = ".dll.a"
        env.Append(LIBPATH=["lib/" + env["platform"] + "/" + env["arch"] + "/bin"])

env.Append(LIBPATH=["lib/" + env["platform"] + "/" + env["arch"] + "/lib"])
env.Append(CPPPATH=["src/", "lib/" + env["platform"] + "/" + env["arch"] + "/include"])
env.Append(LIBS=["avformat", "avcodec", "avutil", "avfilter", "swresample", "swscale"])
sources = Glob("src/*.cpp")

suffix = env["SHLIBSUFFIX"]
if env["platform"] == "windows":
    suffix = ".dll"

library = env.SharedLibrary(
    "bin/" + env["platform"] + "/libffmpegmediadecoder." + env["arch"] + suffix, 
    source=sources
)

Default(library)
