function [] = create_bof_dict_all(list, posindexs, negindexs, n_img)
    %画像パス一覧, positive, negativeの開始位置とそれぞれの画像枚数n_imgを受け取る
    %コードブックの作成とBoFベクトルの作成を行う
    %%%% コードブックの作成 %%%%
    %positive, negative画像のindexを用いてコードブックを作成する（実験1，実験2でそれぞれ作成）
     PosList=list(posindexs+1:posindexs+n_img);
     NegList=list(negindexs+1:negindexs+n_img);
     Training={PosList{:} NegList{:}};%100個ずつポジティブとネガティブを作る
     Features=[];%特徴を１つの行列にまとめる
     for i=1:n_img*2
       target = Training(i)
       I=rgb2gray(imread(target{:}));
       p=createRandomPoints(I, 1000);%1画像あたり特徴点は1000点抽出
       [f,p2]=extractFeatures(I,p);
       Features=[Features; f];
     end
%     %3万個選ぶ
     Features=Features(randperm(size(Features,1),30000),:);
%     %k-meansで代表ベクトルを500個選ぶ
     k=500;
     [idx,CODEBOOK]=kmeans(Features,k);
     save('codebook.mat','CODEBOOK');
    %load('codebook.mat');
    
    %%%% BoFベクトルの作成 %%%%
    n1=2000;%1画像あたり何点の特長を抽出するか
    bof = zeros(n_img*2 ,n1);%200*2000
    for j=1:n_img*2
        target_img = rgb2gray(imread(Training{j}));
        points1 = createRandomPoints(target_img, n1);
        [features,~] = extractFeatures(target_img,points1);
        for i=1:size(points1,1)  % 各特徴点についての for-loop
            %一番近いcodebook中のベクトルを探してindexを求める．
            vv=repmat(features(i,:),500,1);%k=500
            b=(CODEBOOK-vv).^2;
            cc=sqrt(sum(b'));
            [m, index]=min(cc);
            %bofヒストグラム行列のj番目の画像のindexに投票
            bof(j,index)=bof(j,index)+1;
        end
    end
    %正規化
    bof = bof ./ sum(bof,2); 
    save('bof.mat','bof');
end