function [dcnn_dict] = get_dcnn_dict(list,target_indexs)
    % 画像パス一覧，使いたいインデックスを受け取って対応するDCNN特徴量の辞書を返却
    n_imgs = numel(target_indexs);
    n_features = 4096;
    dcnn_dict = zeros(n_imgs,n_features);
    net = alexnet;
    for j=1:n_imgs
        img = imread(list{target_indexs(j)} );
        reimg = imresize(img,net.Layers(1).InputSize(1:2)); 
        % activationsを利用して中間特徴量を取り出します．
        dcnnf = activations(net,reimg,'fc7');
        % squeeze関数で，ベクトル化
        dcnnf = squeeze(dcnnf);
        % 正規化
        dcnnf = dcnnf/norm(dcnnf);
        dcnn_dict(j,:) = dcnnf;
    end
end