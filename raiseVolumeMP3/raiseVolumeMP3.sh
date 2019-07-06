#!/bin/bash
ls -la
for entry in "$(pwd)"/*
do
  echo "----------------------------------------------"  
  echo Converting "$entry"...
  echo "----------------------------------------------"
  ffmpeg -i "$entry" -af 'volume='"$1" "$entry"-UP.mp3
  echo FINISHED "$entry"
  echo "----------------------------------------------"
  echo "***"
done
