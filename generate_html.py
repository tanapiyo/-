#!/usr/bin/python3
# coding: utf-8

# import
import cgitb
import io
import sys


def main(kind, exnum):
    # エラー表示
    cgitb.enable()

    # 日本語用
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

    # 画像読み込み
    f = open('result/' + exnum + '/images/' + kind + '_top_image.txt')
    top_images = f.read().split(",")
    f.close()
    f = open('result/' + exnum + '/images/' + kind + '_worst_image.txt')
    worst_images = f.read().split(",")
    f.close()
    f = open('result/' + exnum + '/scores/' + kind + '_top_score.txt')
    top_scores = f.read().split()
    f.close()
    f = open('result/' + exnum + '/scores/' + kind + '_worst_score.txt')
    worst_scores = f.read().split()
    f.close()

    # スコアは小数点以下を丸める
    top_scores = [round(float(s), 3) for s in top_scores]
    worst_scores = [round(float(s), 3) for s in worst_scores]

    # 置換えデータ作成
    top_data = ''
    worst_data = ''

    for i in range(len(top_images)):
        # 画像分ループさせる
        top_data = top_data + '''
          <div class="item">
            <span class="rank">{rank}</span>
            <img src="../../imgs{img_path}" width="140" height="100">
            <span class="score">{score}</span>
          </div>
          '''.format(rank=i, img_path=top_images[i][1:], score=str(top_scores[i]))

    if(len(worst_scores) != 0):
        for i in range(len(worst_images)):
            # 画像分ループさせる
            worst_data = worst_data + '''
            <div class="item">
              <span class="rank">{rank}</span>
              <img src="../../imgs{img_path}" width="140" height="100">
              <span class="score">{score}</span>
            </div>
            '''.format(rank=i, img_path=worst_images[i][1:], score=str(worst_scores[i]))

    # template.htmlの読み込み
    with open('template.html', 'r') as file:
        html = file.read()
    file.closed

    # {% %}をpage_dataに置換え
    html = html.replace('{% top_data %}', top_data)
    html = html.replace('{% worst_data %}', worst_data)

    # HTML出力（コマンドラインでパイプして使う）
    print(html)


# コマンドラインで使う　引数に「bof」や「color」などを指定するのと，　どの実験を出力するかを指定
# kindはbof, color, dcnn_linear, dcnn_nonlinear, dcnn_vgg16
# exnumはex1-1, ex1-2, ex2
if __name__ == '__main__':
    args = sys.argv
    kind = args[1]  # 特徴量の種類
    exnum = args[2]
    main(kind, exnum)
