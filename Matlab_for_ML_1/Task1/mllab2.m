%% This loads our data
[X, y] = load_data_ex2();

%% Normalise and initialize.
[X, mean_vec, std_vec] = normalise_features(X);

%after normalising we add the bias
X = [ones(size(X, 1), 1), X];

%initialise theta
theta = [0.0, 0.0, 0.0];
X(i,1)= 1650;
X(i,2)= 3;
alpha = 0.01;
iterations = 100;

%% 
t = gradient_descent(X, y, theta, alpha, iterations);

pause;