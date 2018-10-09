function hypothesis = calculate_hypothesis(X, theta,i)
    %CALCULATE_HYPOTHESIS This calculates the hypothesis for a given X,
    %theta and specified training example

    %hypothesis = 0.0;
   
    hypothesis = X(i,:)*theta';

end
