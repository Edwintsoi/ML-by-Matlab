function hypothesis = calculate_hypothesis(X, theta,i)
    %CALCULATE_HYPOTHESIS This calculates the hypothesis for a given X,
    %theta and specified training example

    %hypothesis = 0.0;
   
    hypothesis = X(i,1)*theta(1)+X(i,2)*theta(2)+X(i,3)*theta(3);

end
