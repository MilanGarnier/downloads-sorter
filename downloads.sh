#!/bin/bash

move(){
	FILETEMP="$FILE";
	if [ "${FILETEMP:0:1}" != "*" ]; then
		TARGET=$TYPE
		mkdir -p $TARGET
		echo "File $FILE will be moved in $TARGET"
		mv -b "$FILE" "$TARGET/$FILE"
		echo "Moved file"
	fi
}

cd $HOME/Téléchargements

while [ 1 ]; do  

# Documents
for FILE in *.doc *.docx *.html *.odt *.odp *.odg *.pdf *.ppt *.pptx; do
	TYPE=Documents
	move
done 

# Images
for FILE in *.png *.jpg *.svg *.xcf *.bmp *.tif; do
	TYPE=Images
	move
done 

# Videos
for FILE in *.mov *.mkv *.avi *.mp4; do
	TYPE=Vidéos
	move
done 

# Archive
for FILE in *.7z *.rar *.tar *.tar.gz *.tar.xz *.zip *.deb; do
	TYPE=Archives
	move
done 

# Score
for FILE in *.mscz; do
	TYPE=Partitions
	move
done 

# Windows Stuff
for FILE in *.dll *.bat *.exe; do
	TYPE=Windows
	move
done 

# Torrent
for FILE in *.torrent; do
	TYPE=Torrents
	move
done 

# Raw
for FILE in *.o *.bin *.apk; do
	TYPE=Binaries
	move
done

sleep 10

done