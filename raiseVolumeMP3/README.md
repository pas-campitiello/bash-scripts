# Raise Volume MP3

1. move into the directory where there are the MP3 files
2. launch, for example: raiseVolumeMP3.sh 1.5

-----------------

#Other notes

Half the input volume:

`ffmpeg -i input.wav -af "volume=0.5" output.wav`

150% of current volume:

`ffmpeg -i input.wav -af "volume=1.5" output.wav`

Using decibels you can also use dB:

`ffmpeg -i input.wav -af "volume=10dB" output.wav`

https://trac.ffmpeg.org/wiki/How%20to%20change%20audio%20volume%20up-down%20with%20FFmpeg
