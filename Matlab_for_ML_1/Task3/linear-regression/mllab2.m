%% This loads our data
[X, y] = load_data_ex2();

%% Normalise and initialize.
[X, mean_vec, std_vec] = normalise_features(X);

%after normalising we add the bias
X = [ones(size(X, 1), 1), X];

%initialise theta
theta = [0, 0, 0];
alpha = 0.05;
iterations = 100;
l=0;
%% 
t = gradient_descent(X, y, theta, l, alpha, iterations, true);
result1 = t(1) + t(2)*1650 + t(3)*3 
%disp 'Press enter to exit!';
%pause;
