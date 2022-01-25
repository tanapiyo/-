function [color_hists] = get_color_hist_dict(list,target_indexs)
    % 画像パス一覧と使うインデックス をうけとってカラーヒストグラムを返す
    n_imgs = numel(target_indexs);
    color_hists = zeros(n_imgs,64);
    for j=1:n_imgs
        %RGBにわけて64色に減色する
        I = imread(list{target_indexs(j)} );
        RED  =I(:,:,1);
        GREEN=I(:,:,2);
        BLUE =I(:,:,3);
        X64= floor(double(RED)/64) *4*4 +  floor(double(GREEN)/64) *4 +  floor(double(BLUE)/64);
        X64_vec=reshape(X64,1,numel(X64));
        %ヒストグラムの横ベクトルを生成する
        hist=histc(X64_vec,[0:63]);
        %正規化
        hist_norm = hist / sum(hist); 
        color_hists(j,:) = hist_norm;
        
    end
end