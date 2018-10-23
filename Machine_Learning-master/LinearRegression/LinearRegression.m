%%% MATLAB version: R2016a
%%%
%%% Authors: 
%%% Zihan Qi z.qi@jacobs-university.de
%%% Danni Long d.long@jacobs-university.de
%%%
%%% Last Modified Date: 15th, April, 2018

% called "mfeat_pix"
load mfeat-pix.txt -ascii;

% training data: first 100 for each digit
train_data = [];
for i = 0:9
    train_data_digit = mfeat_pix(1 + 200 * i : 100 + 200 * i, :);
    train_data = [train_data; train_data_digit];
end

% testing data: second 100 for each digit
test_data = [];
for i = 0:9
    test_data_digit = mfeat_pix(101 + 200 * i : 200 + 200 * i, :);
    test_data = [test_data; test_data_digit];
end

%%% PCA trim the input pattern dimension from 240 to K
% Compute centered patterns
% size of dataset
N = 1000;
train_data_t = train_data.';
test_data_t = test_data.';
mu = 1/N * sum(train_data).';
centered_patterns = zeros(size(train_data_t, 1), size(train_data_t, 2));
for i = 1:N
    centered_patterns(:, i) = (train_data_t(:, i) - mu);
end
C = 1/N * (centered_patterns * centered_patterns.');

% Compute the SVD
[U,S,V] = svd(C);

index_vec = [];
MSE_train_plot = [];
MSE_test_plot = [];
MISS_train_plot = [];
MISS_test_plot = [];
for index = 1:240
    % Compression
    f_percent = U(:, 1:index).' * train_data_t;

    %%% Linear Regression for training data
    Z = [];
    for i = 0:9
        for j = 1:100
            tmp = zeros(1, 10);
            if i == 0
                tmp(10) = 1;
            else
                tmp(i) = 1;
            end
            Z = [Z; tmp];
        end
    end

    Ones = ones(1, 1000);

    % padded with a trailing 1 as bias
    f_percent = [f_percent; Ones];

    phi = f_percent.';

    % Linear Regression Weight W_opt
    W_opt = ((phi.' * phi)^(-1) * phi.' * Z).';

    % Training error
    err_sum = 0;
    for i = 1:1000
        Z_t = Z.';
        train_err = norm(W_opt * f_percent(:, i) - Z_t(:, i))^2;
        err_sum = err_sum + train_err;
    end

    % Mean Square Training Error
    MSE_train = err_sum / 1000;

    % Training Misclassification Error
    MISS_train = 0;
    for i = 1:1000
        [MAX, Ind] = max(W_opt * f_percent(:, i));
        [row, col] = find(Z(i, :));
        if Ind ~= col
            MISS_train = MISS_train + 1;
        end
    end

    MISS_train = MISS_train / 1000;

    %%% Testing error
    % Compression
    f_percent_test = U(:, 1:index).' * test_data_t;

    %%% Linear Regression
    % padded with a trailing 1 as bias
    f_percent_test = [f_percent_test; Ones];

    phi_test = f_percent_test.';

    % Linear Regression Weight W_opt_test
    %W_opt_test = ((phi_test.' * phi_test)^(-1) * phi_test.' * Z).';

    err_sum_test = 0;
    for i = 1:1000
        Z_t = Z.';
        test_err = norm(W_opt * f_percent_test(:, i) - Z_t(:, i))^2;
        err_sum_test = err_sum_test + test_err;
    end

    % Mean Square Testing Error
    MSE_test = err_sum_test / 1000;

    % Testing Misclassification Error
    MISS_test = 0;
    for i = 1:1000
        [MAX, Ind] = max(W_opt * f_percent_test(:, i));
        [row, col] = find(Z(i, :));
        if Ind ~= col
            MISS_test = MISS_test + 1;
        end
    end

    MISS_test = MISS_test / 1000;
    index_vec = [index_vec, index];
    MSE_train_plot = [MSE_train_plot, MSE_train];
    MSE_test_plot = [MSE_test_plot, MSE_test];
    MISS_train_plot = [MISS_train_plot, MISS_train];
    MISS_test_plot = [MISS_test_plot, MISS_test];
end
figure(1)
plot(index_vec, MSE_train_plot, 'r', index_vec, MSE_test_plot, 'b', index_vec, MISS_train_plot, 'r--', index_vec, MISS_test_plot, 'b--')
figure(2) 
hold on
plot(log(MSE_train_plot), 'r')
plot(log(MSE_test_plot), 'b')
plot(log(MISS_train_plot), 'r--')
plot(log(MISS_test_plot), 'b--')