# Raise Volume MP3

1) move into the directory where there are the MP3 files
2) launch, for example: raiseVolumeMP3.sh 1.5

-----------------

#Other notes

To turn the audio volume up or down, you may use FFmpeg's Audio Filter named ​volume, like in the following example. If we want our volume to be half of the input volume:

ffmpeg -i input.wav -af "volume=0.5" output.wav
150% of current volume:

ffmpeg -i input.wav -af "volume=1.5" output.wav
If you are familiar with decibels you can also use dB:

ffmpeg -i input.wav -af "volume=10dB" output.wav
In older versions of FFmpeg, the option "-af" wasn't implemented, so we had to use this:

ffmpeg -f lavfi -i "amovie=input.wav,volume=0.5" output.wav
