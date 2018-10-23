%%%This file specificly take K = 2
%load the pixel data, resulting in a matlab matrix of dim 2000 x 240
% called "mfeat_pix"
load mfeat-pix.txt -ascii;
%pick one digit
%traindata = zeros(200,240);
traindata=mfeat_pix(1:200,:);
K=2;
S1=traindata(1:200/K,:);
S2=traindata((200/K)+1:200,:);
%number of rows: number of total vectors
length=size(S1,1);
length2=size(S1,1);
sum=zeros(1,240);
sum2=zeros(1,240);
for i=1:200/K
    sum=sum+traindata(i,:);
    sum2=sum2+traindata(i+200/K,:)
end
mu1=sum/(length);
mu2=sum2/(length2);
newS1=zeros(1,240);
newS2=zeros(1,240);

for i=1:200
    if norm(traindata(i,:)-mu1)>norm(traindata(i,:)-mu2)
        newS2=[newS2;traindata(i,:)];
    else
        newS1=[newS1;traindata(i,:)];
    end
end  
newS1=newS1([2:end],:)  %first row are zeros I initally set
newS2=newS2([2:end],:)
figure(1);
   for j = 1:size(newS1,1)
       pic = newS1(j ,:);  
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
   for j = 1:size(newS2,1)
       pic = newS2(j ,:);  
       picmatreverse = zeros(15,16);
        % the filling of (:) is done columnwise!
       picmatreverse(:)= - pic;
       picmat = zeros(15,16);
       for k = 1:15
           picmat(:,k)=picmatreverse(:,16-k);
       end
       subplot(10,20,j); %since dont know how many image, set larger space
       pcolor(picmat');
       axis off;
       colormap(gray(10));
   end
