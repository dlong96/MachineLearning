%%% K-means clustering algorithm implementation

load mfeat-pix.txt -ascii;
%%% picked number
num = 2;

figure(3);
for i = 1:20
    pic = mfeat_pix(200 * num +i ,:);  
    picmatreverse = zeros(15,16);
    % the filling of (:) is done columnwise!
    picmatreverse(:)= - pic;
    picmat = zeros(15,16);
    for k = 1:15
        picmat(:,k)=picmatreverse(:,16-k);
    end
    subplot(1,20,i);
    pcolor(picmat');
    axis off;
    colormap(gray(10));
end

K = 2;
Set = zeros(K, 200 * 240 / K);
picVec = mfeat_pix(200 * num + 1 : 200 * num + 200, : );
for i = 1:200
    r = randi(K)
    
end


