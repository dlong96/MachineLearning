
%%%K=200

load mfeat-pix.txt -ascii;
traindata=mfeat_pix(1:200,:);
K=3;
%%% initialize K sets
for i=1:K
   S(i) = []
end
%%% randomly store in set
for i = 1:200
   r = randi(K)
   S(r)=[S(r);traindata(i,:)]
end

for i = 1:K
    l=size(S(i), 1)
    length=[length,l]
    sum=sum(S(i))
    mu(i) = sum(i)/length(i)
    newS(i) = []
end

minum=[];

for i=1:200
    for j=1:K
        minum=[minum,norm(traindata(i,:)-(sum(i)/length(i)))]
    end    
     [index,min]=min(minum)
     newS(index)=[newS(index);traindata(i,:)]
end  

figure(1);

for j = 1:size(newS(1),1)
   pic = newS(1)(j ,:);  
   picmatreverse = zeros(15,16);
    % the filling of (:) is done columnwise!
   picmatreverse(:)= - pic;
   picmat = zeros(15,16);
   for k = 1:15
       picmat(:,k)=picmatreverse(:,16-k);
   end
   subplot(10,20,j);
   pcolor(picmat');
   axis off;
   colormap(gray(10));
end

figure(2);

for j = 1:size(newS(2),1)
   pic = newS(2)(j ,:);  
   picmatreverse = zeros(15,16);
    % the filling of (:) is done columnwise!
   picmatreverse(:)= - pic;
   picmat = zeros(15,16);
   for k = 1:15
       picmat(:,k)=picmatreverse(:,16-k);
   end
   subplot(10,20,j);
   pcolor(picmat');
   axis off;
   colormap(gray(10));
end


figure(3);

for j = 1:size(newS(3),1)
   pic = newS(3)(j ,:);  
   picmatreverse = zeros(15,16);
    % the filling of (:) is done columnwise!
   picmatreverse(:)= - pic;
   picmat = zeros(15,16);
   for k = 1:15
       picmat(:,k)=picmatreverse(:,16-k);
   end
   subplot(10,20,j);
   pcolor(picmat');
   axis off;
   colormap(gray(10));
end


figure(4);

for j = 1:size(newS(4),1)
   pic = newS(4)(j ,:);  
   picmatreverse = zeros(15,16);
    % the filling of (:) is done columnwise!
   picmatreverse(:)= - pic;
   picmat = zeros(15,16);
   for k = 1:15
       picmat(:,k)=picmatreverse(:,16-k);
   end
   subplot(10,20,j);
   pcolor(picmat');
   axis off;
   colormap(gray(10));
end
