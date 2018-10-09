function theta = gradient_descent(X, y, theta, l, alpha, iterations, do_plot)
    %GRADIENT_DESCENT do Gradient Descent for a given X, y, theta, alpha
    %for a specified number of iterations

    %if less than 6 arguments was given, then set do_plot to be false
    if nargin < 6
        do_plot = false;
    end
    if(do_plot)
        plot_hypothesis(X, y, theta);
        drawnow; pause(0.1); 
    end

    m = size(X, 1); %number of training examples
    num_col_theta = size(theta,2); %number of coefficients
    cost_vector = []; %will store the results of our cost function
    
    for it = 1:iterations
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % gradient descent
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        theta_temp = theta;
    
        for t = 1:num_col_theta
            
        sigma = 0.0;
        
        for i = 1:m
            hypothesis = calculate_hypothesis(X, theta, i);
            output = y(i);
            sigma = sigma + (hypothesis - output) * X(i, t);
        end
        
        %new cost function (regularized) 
        if t == 1 
            theta_temp(t) = theta_temp(t) - ((alpha * 1.0) / m) * sigma;
        else
            theta_temp(t) = theta_temp(t) - ((alpha * 1.0) / m) * sigma - theta_temp(t)*((alpha * l)/m);
        end
        
        end
        
        %update theta
        theta = theta_temp;
        
        %update cost_vector
        cost_vector = [cost_vector; compute_cost_regularised(X, y, theta, l)];
        
        if do_plot
            plot_hypothesis(X, y, theta);
            drawnow; pause(0.1); 
        end
    end

    disp 'Gradient descent is finished.'
        
    if do_plot
        disp 'Press enter!'
        pause;
    end

    plot_cost(cost_vector);
        
    disp 'Press enter!';
    pause;
end