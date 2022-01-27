function [] = save_highscore_images_ex2(filename, list, score, eval_index)
    % 画像一覧，スコア, eval_indexを受け取ってスコアでソートする
    % 上位100位の画像名とスコアを記録する
    image_list = list(eval_index);

    %上位score10このインデックス
    [score_sorted, top_index] = sort(score(:, 2), 'descend'); %あっていてスコア上位
    %100位までに絞る
    top_score_correct = score_sorted(1:100);
    top_index_correct = top_index(1:100);

    %トップスコアを持つ画像名を抽出
    top_score_images = image_list(top_index_correct);

    %スコアと画像の書き込み
    writecell(top_score_images, append(filename, '_top_image.txt'));
    writematrix(top_score_correct, append(filename, '_top_score.txt'));

    fprintf('saved')
end
