# music2midi

[Basic Pitch](https://github.com/spotify/basic-pitch)と[Demucs](https://github.com/facebookresearch/demucs)を使用して、楽曲ファイル(wav | mp3)を**vocals**, **bass**, **drums**, **other**に分離した後、midiファイルへ変換します。

## usage

1. 楽曲ファイルを**music/origin/**下に置く。

2. dockerコンテナを立ち上げる。

```
docker-compose up -d --build
```

3. 下記コマンドを実行
```
bash main.sh [1.で置いた楽曲ファイル名]
```

例:
```
bash main.sh MUSIC.wav
```

4. 下記ディレクトリにファイルが生成される。
```
music/
    separated/ ... パート毎に分離したオーディオファイル
    midi/ ... パート毎に分離したmidiファイル
```