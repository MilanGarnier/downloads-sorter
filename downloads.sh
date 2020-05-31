#!/bin/bash

move(){
	FILETEMP="$FILE";
	if [ "${FILETEMP:0:1}" != "*" ]; then
		TARGET=$TYPE
		if [ -f "$FILE.part" ]; then
			echo "Download of file \"$FILE\" seems to be active. It will be moved to $TARGET when it will be over."
			return
		fi
		mkdir -p $TARGET
		echo "File $FILE will be moved in $TARGET"
		FILE_LIST+=" $FILE"
		MOVE_COUNT+=1
		mv -b "$FILE" "$TARGET/$FILE"
		echo "Moved file"
	fi
}

cd $HOME/Téléchargements || cd $HOME/Downloads

while [ 1 ]; do  

FILE_LIST=" "
MOVE_COUNT=0

# Documents
for FILE in *.doc *.docx *.html *.odt *.odp *.odg *.pdf *.ppt *.pptx; do
	TYPE="Documents"
	move
done 

# Images
for FILE in *.png *.jpg *.svg *.xcf *.bmp *.tif; do
	TYPE="Images"
	move
done 

# Videos
for FILE in *.mov *.mkv *.avi *.mp4; do
	TYPE="Vidéos"
	move
done 

# Archive
for FILE in *.7z *.rar *.tar *.tar.gz *.tar.xz *.zip *.deb; do
	TYPE="Archives"
	move
done 

# Score
for FILE in *.mscz; do
	TYPE="Partitions"
	move
done 

# Windows Stuff
for FILE in *.dll *.bat *.exe; do
	TYPE="Windows"
	move
done 

# Torrent
for FILE in *.torrent; do
	TYPE="Torrents"
	move
done 

# Raw
for FILE in *.o *.bin *.apk *.jar; do
	TYPE="Binaries"
	move
done

for FILE in *.c *.cpp *.cs *.h *.hpp *.sh *.txt; do
	TYPE="Raw Text"
	move
done

if [ $MOVE_COUNT != 0 ]; then
	OUTPUT="Moved"
	OUTPUT+=$FILE_LIST
	OUTPUT+="."
	notify-send "$OUTPUT"
fi

sleep 3

done