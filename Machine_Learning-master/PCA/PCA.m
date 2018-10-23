
%%% MATLAB version: R2016a
%%%
%%% Authors: 
%%% Zihan Qi z.qi@jacobs-university.de
%%% Danni Long d.long@jacobs-university.de
%%% Xuchong Du x.du@jacobs-university.de
%%%
%%% Last Modified Date: 21st, March, 2018


% called "mfeat_pix"
load mfeat-pix.txt -ascii;
% picked digit "3"
digit = 3;
% size of the dataset
N = 200;
% initialize train_data vector from dataset
train_data=mfeat_pix(1 + N * digit : N + N * digit, :).';

%%% Step 1: Compute centered patterns

mu = 1/N * sum(train_data.').';
centered_patterns = zeros(size(train_data, 1), size(train_data, 2));
for i = 1:N
    centered_patterns(:, i) = (train_data(:, i) - mu);
end
C = 1/N * (centered_patterns * centered_patterns.');

%%% Step 2: Compute the SVD

% percentages of variances
percent_of_variance_1 = 1.0 - 0.5;
percent_of_variance_2 = 1.0 - 0.8;
percent_of_variance_3 = 1.0 - 0.95;
percent_of_variance_4 = 1.0 - 0.99;
percent_of_variance_5 = 0.0;

[U,S,V] = svd(C);

% denominator for Equation(15)
sum_den = 0;
for k = 1:size(S, 1)
    sum_den = sum_den + S(k, k);
end


for k = 1:size(S, 1)
    sum_nom = 0;
    for i = k:size(S, 1)
        sum_nom = sum_nom + S(i, i);
    end
    if sum_nom / sum_den <= percent_of_variance_1
        m1 = k - 1;
        break
    end
end

for k = 1:size(S, 1)
    sum_nom = 0;
    for i = k:size(S, 1)
        sum_nom = sum_nom + S(i, i);
    end
    if sum_nom / sum_den <= percent_of_variance_2
        m2 = k - 1;
        break
    end
end

for k = 1:size(S, 1)
    sum_nom = 0;
    for i = k:size(S, 1)
        sum_nom = sum_nom + S(i, i);
    end
    if sum_nom / sum_den <= percent_of_variance_3
        m3 = k - 1;
        break
    end
end

for k = 1:size(S, 1)
    sum_nom = 0;
    for i = k:size(S, 1)
        sum_nom = sum_nom + S(i, i);
    end
    if sum_nom / sum_den <= percent_of_variance_4
        m4 = k - 1;
        break
    end
end

for k = 1:size(S, 1)
    sum_nom = 0;
    for i = k:size(S, 1)
        sum_nom = sum_nom + S(i, i);
    end
    if sum_nom / sum_den <= percent_of_variance_5
        m5 = k - 1;
        break
    else
        m5 = k;
    end
end

%%% Compression
f_percent_1 = U(:, 1:m1).' * train_data(:, 1:5);
f_percent_2 = U(:, 1:m2).' * train_data(:, 1:5);
f_percent_3 = U(:, 1:m3).' * train_data(:, 1:5);
f_percent_4 = U(:, 1:m4).' * train_data(:, 1:5);
f_percent_5 = U(:, 1:m5).' * train_data(:, 1:5);

%%% Uncompression
x_restore_1 = [mu,mu,mu,mu,mu] + U(:, 1:m1) * f_percent_1(:, 1:5);
x_restore_2 = [mu,mu,mu,mu,mu] + U(:, 1:m2) * f_percent_2(:, 1:5);
x_restore_3 = [mu,mu,mu,mu,mu] + U(:, 1:m3) * f_percent_3(:, 1:5);
x_restore_4 = [mu,mu,mu,mu,mu] + U(:, 1:m4) * f_percent_4(:, 1:5);
x_restore_5 = [mu,mu,mu,mu,mu] + U(:, 1:m5) * f_percent_5(:, 1:5);

% Display
figure(1);
for i = 1:5
    pic = x_restore_1(:, i);
    picmatreverse = zeros(15,16);
    picmatreverse(:)= - pic;
    picmat = zeros(15,16);
    for k = 1:15
        picmat(:,k)=picmatreverse(:,16-k);
    end
    subplot(3,5,i);
    pcolor(picmat');
    axis off;
    colormap(gray(10));
end

figure(2);
for i = 1:5
    pic = x_restore_2(:, i);
    picmatreverse = zeros(15,16);
    picmatreverse(:)= - pic;
    picmat = zeros(15,16);
    for k = 1:15
        picmat(:,k)=picmatreverse(:,16-k);
    end
    subplot(3,5,i);
    pcolor(picmat');
    axis off;
    colormap(gray(10));
end

figure(3);
for i = 1:5
    pic = x_restore_3(:, i);
    picmatreverse = zeros(15,16);
    picmatreverse(:)= - pic;
    picmat = zeros(15,16);
    for k = 1:15
        picmat(:,k)=picmatreverse(:,16-k);
    end
    subplot(3,5,i);
    pcolor(picmat');
    axis off;
    colormap(gray(10));
end

figure(4);
for i = 1:5
    pic = x_restore_4(:, i);
    picmatreverse = zeros(15,16);
    picmatreverse(:)= - pic;
    picmat = zeros(15,16);
    for k = 1:15
        picmat(:,k)=picmatreverse(:,16-k);
    end
    subplot(3,5,i);
    pcolor(picmat');
    axis off;
    colormap(gray(10));
end

figure(5);
for i = 1:5
    pic = x_restore_5(:, i);
    picmatreverse = zeros(15,16);
    picmatreverse(:)= - pic;
    picmat = zeros(15,16);
    for k = 1:15
        picmat(:,k)=picmatreverse(:,16-k);
    end
    subplot(3,5,i);
    pcolor(picmat');
    axis off;
    colormap(gray(10));
end

% original dataset
figure(6);
for i = 1:5
    pic = train_data(:,i);
    picmatreverse = zeros(15,16);
    picmatreverse(:)= - pic;
    picmat = zeros(15,16);
    for k = 1:15
        picmat(:,k)=picmatreverse(:,16-k);
    end
    subplot(3,5,i);
    pcolor(picmat');
    axis off;
    colormap(gray(10));
end
