function result=calculate_hypothesis(X,theta,i)
    %hypothesis = 0.0;
    
    %%%%%%%%%%%%%%%%%%%%%%%%
    %Calculate the hypothesis for the i-th training example in X.

     
     hypothesis = X(i,:)*theta';
    %%%%%%%%%%%%%%%%%%%%%%%%
    result=sigmoid(hypothesis);

%END OF FUNCTION
    

