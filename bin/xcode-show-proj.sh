#!/bin/sh
proj=`pwd`
if [ -d ./*.xcodeproj ] ; then
    proj="${proj}/*.xcodeproj"
elif [ -d ../*.xcodeproj ] ; then
    proj="${proj}/../*.xcodeproj"
else
    exit 1
fi
osascript ~/bin/xcode-show-proj.scpt $proj
