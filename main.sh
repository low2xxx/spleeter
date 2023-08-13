#!/bin/bash

filename=$(basename "$1")
extension="${filename##*.}"
musicname="${filename%.*}"

echo filename: $filename
echo extension: $extension
echo musicname: $musicname

if [ "$extension" == "wav" ]; then
    docker-compose exec -u root demucs python3 -m demucs -d cpu ./origin/$filename
elif [ "$extension" == "mp3" ]; then
    docker-compose exec -u root demucs python3 -m demucs --mp3 -d cpu ./origin/$filename
else
    echo "サポートされていないファイル形式です: $extension"
    exit 1
fi

docker-compose exec -u root basic-pitch mkdir -p ./midi/$musicname

docker-compose exec -u root basic-pitch \
    basic-pitch ./midi/$musicname/ \
    ./separated/htdemucs/$musicname/vocals.$extension \
    ./separated/htdemucs/$musicname/bass.$extension \
    ./separated/htdemucs/$musicname/drums.$extension \
    ./separated/htdemucs/$musicname/other.$extension
