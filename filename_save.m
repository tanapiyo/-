function [] = filename_save()
  %第二回のコードを参考に実験1，2で使う全ての画像パスをlistにする
  %classlistにインデックスごとにどのクラスかを入れる
  n=0; list={}; classlist={};
  LIST={'leopard_200' 'okonomiyaki_200' 'tiger_200' 'takoyaki_50' 'takoyaki_300'};
  DIR0='./';
  for i=1:length(LIST)
    DIR=strcat(DIR0,LIST(i),'/');
    W=dir(DIR{:});
    for j=1:size(W)
      if (strfind(W(j).name,'.jpg'))
        fn=strcat(DIR{:},W(j).name);
        %クラス名_数字のクラス名だけ取り出す
        concatcl=strsplit(LIST{i},'_');
        cl=concatcl{1};
	    n=n+1;
        fprintf('[%d] %s\n',n,fn);
	    list={list{:} fn};
        classlist={classlist{:} cl};
      end
    end
  end
  %あとで使えるように保存する
  save('list.mat', 'list');
  save('classlist.mat','classlist');
end