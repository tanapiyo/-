function [bof_dict] = get_bof_dict(bof,target_indexs, n,n_all,pos_start, neg_start )
%bof, target_index, ポジティブとネガティブの画像数n, ポジティブ画像のインデックス補正値，ネガティブ画像のインデックス補正値をうけとって
%該当のbofベクトルを返却する
%bofは事前に作ったものとインデックスが違うので計算しなおす
bof_dict = [];
%negative分の修正
neg_adj = n_all/2;
for i=1:n
    bof_dict(i,:) = bof(target_indexs(i)-pos_start,:);
    bof_dict(i+n,:) = bof(target_indexs(i+n)-neg_start+neg_adj,:);
end
end