function hypothesis = calculate_hypothesis(X, theta, training_example)
    hypothesis = X(training_example,:) * transpose(theta);
end
    
