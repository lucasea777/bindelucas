#!/bin/bash

#SCRIPTPATH=`pwd -P` #http://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
#Graba cantidad_archivos .mp3 de segundos cada uno, siempre y cuando 
#exista el archivo (posiblemente vacio) "play" (eliminar archivo play para parar grabacion)
#http://superuser.com/questions/889912/how-to-record-10-seconds-of-audio-with-sox
#http://digitalcardboard.com/blog/2009/08/25/the-sox-of-silence/
#https://jordilin.wordpress.com/2006/07/28/howto-recording-audio-from-the-command-line/
SCRIPT="`readlink -e $0`"
SCRIPTPATH="`dirname $SCRIPT`"
echo $SCRIPTPATH
segundos=5
cantidad_archivos=3

#evitar verbose en rec y arecord

i="1"
#while [ $i -lt 4 ]
#while [ ! -f $SCRIPTPATH"/"stop ]
while [ -f $SCRIPTPATH"/"play ]
do
echo "Recording" out$i.mp3
rm $SCRIPTPATH"/"*_$i_exwav.mp3
#rm *_$i.mp3
SCRIPTNAME=$(date +"%m-%d-%y_%H:%M:%S_")$i
#arecord -f cd -d $segundos -t raw | lame -r - $SCRIPTPATH"/"$SCRIPTNAME".mp3" & #esta de mas?
timeout $segundos rec $SCRIPTPATH"/"$SCRIPTNAME".wav" -q silence 1 0.1 0.5% -1 3.0 0.5%
lame -V2 $SCRIPTPATH"/"$SCRIPTNAME".wav" $SCRIPTPATH"/"$SCRIPTNAME"_exwav.mp3"
rm $SCRIPTPATH"/"*_$i.wav
#sleep 3
i=$[$i+1]
if [ $i -gt $cantidad_archivos ]
then
i="1"
fi
#xterm &
done
echo "El archivo play dejo de existir?"
#arecord -f cd -d 300 -t raw | lame -r - out.mp3
