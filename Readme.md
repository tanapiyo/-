# Readme

物体認識論のレポートのソースコード. 画像や結果のテキストファイルは gitignore で省いている.

## 構成

- htmls/：結果の HTML ファイル（git 管理していない）
- result/：結果の txt ファイル（git 管理していない）
- imgs/：使用する画像ファイル
- ex1/：実験 1 で使用した m ファイル群
- ex2/：実験 2 で使用した m ファイル群
- crawling.ipynb：画像のクローリングに使用した jupyter ファイル
- generate_html.py：結果表示用 HTML 生成ツール
  - template.html から読み込んで文字を置換する
- ex1_1html.sh，ex1_2.html.sh：HTML 生成スクリプト

## 使い方

### crawling.ipynb

Jupyter ファイルなのでこのまま使用. 最後にある関数呼び出し部を書き換えれば他のキーワード，枚数で画像の収集ができる．
現状はお好み焼き，たこやき，虎，ひょうについての画像を収集する．

### crop_images.py

ただコマンドラインから叩くだけ．現状フォルダ名などベタ書きしているが，220px の正方形を画像中心から切り取って imgs フォルダの内部に保存する．

### generate_html.py

template.html を元に画像とスコアの乗った HTML を生成する．結果は result フォルダに images/と scores/に matlab online で出力したものを保存（テキストファイル）.

```
python generate_html.py color > htmls/exなんとか/color.html
```

のようにしてコマンドラインから呼び出して使う．arg として取れるものは実験 1 で用いた以下．

- bof
- color
- dcnn_linear
- dcnn_nonlinear
- dcnn_vgg16_linear
