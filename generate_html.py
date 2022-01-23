#!/usr/bin/python3
# coding: utf-8

# import
import cgitb
import io
import sys

# エラー表示
cgitb.enable()

# 日本語用
sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

# TODO:: 画像読み込み
# 読み込み順はtxtで指定，scoreも同様

# 置換えデータ作成
data = ''
# 画像分ループさせる
data = data + '''
      <div class="item">
        <span class="rank">1</span>
        <img src="imgs/peach_10/000001.jpg" width="140" height="100">
        <span class="score">1.4224</span>
      </div>
      '''

# template.htmlの読み込み
with open('template.html', 'r') as file:
    html = file.read()
file.closed

# {% %}をpage_dataに置換え
html = html.replace('{% data %}', data)

# HTML出力（コマンドラインでパイプして使う）
print(html)
