%% Machine Learning Online Class - Exercise 3 | Part 1: One-vs-all

%  Info
%  ------------
% 
%  This file contains code that will generate and display example hex
%  boards

%% Initialization
clear ; close all; clc

%% Setup the parameters
m_hex = 8;              %hex board rows
n_hex = 8;              %hex board cols
m = 1000;               %number of example boards
fill = 2;    %how "filled" the hex board is
%% =========== Part 1: Create Hex Board =============


% Create hex boards
fprintf('Creating hex board ...\n')

player1 =2;
player2 =1;

% b = zeros(m,n);
% b = reshape(b,1,m*n);
X = zeros(m,m_hex*n_hex);
y_player1 = zeros(m,1);
y_player2 = zeros(m,1);
%generate hex boards
for i = 1:10
    X(i,:) = generate(X(i,:),fill);
    y_player1(i) = f_connected2(reshape(X(i,:),m_hex,n_hex),1,1,player1);
    y_player2(i) = f_connected2(reshape(X(i,:),m_hex,n_hex),1,1,player2);
end

%
% m = size(X, 1);
% 
% % Randomly select 100 data points to display
% rand_indices = randperm(m);
% sel = X(rand_indices(1:100), :);



for i = 1:100
    displayData(X(i,:),8);
    hold on
    horzcat('player 1 : ',num2str(y_player1(i)),' || player 2 : ',num2str(y_player2(i)))
%     horzcat('player 2 : ',num2str(y_player2(i)))
%      title = horzcat('player1 :',num2str(y_player1(i)))
%     p1 = horzcat('player2 ',int2str(y_player2(i)));
%     xlabel = horzcat(num2str(148), 'c');
%     ylabel = horzcat('player1 ',int2str(y_player1(i)));
%     
%   
    
%     fprintf('Program paused. Press enter to continue.\n');
    pause;
end

% pause;

%% =========== Part 2: Vectorize Logistic Regression ============
%  In this part of the exercise, you will reuse your logistic regression
%  code from the last exercise. You task here is to make sure that your
%  regularized logistic regression implementation is vectorized. After
%  that, you will implement one-vs-all classification for the handwritten
%  digit dataset.
%

% fprintf('\nTraining One-vs-All Logistic Regression...\n')
% 
% lambda = 0.1;
% [all_theta] = oneVsAll(X, y, num_labels, lambda);
% 
% fprintf('Program paused. Press enter to continue.\n');
% pause;
% 
% 
% %% ================ Part 3: Predict for One-Vs-All ================
% %  After ...
% pred = predictOneVsAll(all_theta, X);
% 
% fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

