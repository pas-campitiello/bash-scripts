# mp3split

mp3split is a script initially written by Alec Jacbson (http://www.alecjacobson.com/weblog/?p=4378)  
and later updated by Pasquale Campitiello (http://pcampitiello.blogspot.com)

You can use mp3split to split an MP3 file in several MP3 files equally long,
<br>for example an MP3 file long 60 minutes, in 6 MP3 files 10 minutes each. 


Dependencies:
- python
- ffmpeg

How to execute:
<br>./mp3split.sh NAME_OF_THE_FILE MINUTES_CHUNK

Example:
<br>./mp3split.sh myfile.mp3 10
