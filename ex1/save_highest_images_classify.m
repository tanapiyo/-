function [] = save_highest_images_classify(filename, list, score, predict_labels, eval_labels, eval_index)
    % 画像一覧，スコア, predictとevalのlabel, eval_indexを受け取って正解と不正解の上位，下位10位について
    % 画像名とスコアを記録する

    %predict=evalとそれ以外でインデックスをわける
    correct_index = find(predict_labels == eval_labels); %正しいインデックスのみ
    wrong_index = find(predict_labels ~= eval_labels);
    %scoreもわける，2番目（正例のスコア）を用いる
    correct_score = score(correct_index, 2);
    wrong_score = score(wrong_index, 2);
    %scoreはプラスもマイナスもあるので絶対値をとる
    correct_score = abs(correct_score);
    wrong_score = abs(wrong_score);
    %listもわける
    correct_list = list(eval_index(correct_index));
    wrong_list = list(eval_index(wrong_index));

    limit = 10;
    %間違いが少なすぎる場合（DCNN特徴量とか）はwrongの数だけ
    if (numel(wrong_index)) < 10
        limit = numel(wrong_index);
    end

    %上位score10このインデックス
    [top_score_correct, top_index_correct] = sort(correct_score, 'descend'); %あっていてスコア上位
    [worst_score_wrong, worst_index_wrong] = sort(wrong_score, 'ascend'); %間違っていてスコアも低い
    %10位までに絞る
    top_score_correct = top_score_correct(1:10);
    top_index_correct = top_index_correct(1:10);
    worst_score_wrong = worst_score_wrong(1:limit);
    worst_index_wrong = worst_index_wrong(1:limit);
    %トップスコアを持つ画像名を抽出
    top_score_image_correct = correct_list(top_index_correct);
    worst_score_image_wrong = wrong_list(worst_index_wrong);
    %スコアと画像の書き込み
    writecell(top_score_image_correct, append(filename, '_top_image.txt'));
    writecell(worst_score_image_wrong, append(filename, '_worst_image.txt'));
    writematrix(top_score_correct, append(filename, '_top_score.txt'));
    writematrix(worst_score_wrong, append(filename, '_worst_score.txt'));
end
