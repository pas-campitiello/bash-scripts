#!/bin/bash
# move in the directory where there are the MP3 files
ls -la
for entry in "$search_dir"$(pwd)/*
do
  echo "----------------------------------------------"  
  echo Converting "$entry"...
  echo "----------------------------------------------"
  ffmpeg -i $entry -af 'volume='"$1" $entry-UP.mp3
  echo FINISHED "$entry"
  echo "----------------------------------------------"
  echo "***"
done
