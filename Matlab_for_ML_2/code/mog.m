% Simple script to do EM for a mixture of Gaussians.
% -------------------------------------------------
%  based on code from  Rasmu2ssen and Ghahramani
% (http://www.gatsby.ucl.ac.uk/~zoubin/course02/)

% Initialise parameters
x1 = load_data(1);
x2 = load_data(2);
 x1=x1(1:130,:);  %training data for phonme 1
 x2=x2(1:130,:);  %training data for phonme 2
[n D] = size(x1);                    % number of observations (n) and dimension (D)
k = 3;                              % number of components
p1 = [ones(1,k)/k]';                % mixing proportions
mu1 = x1(ceil(n.*rand(1,k)),:)';      % means picked rqandomly from data
s1 = zeros(D,D,k);                  % covariance matrices
niter=100;                          % number of iterations

% initialize covariances 

for i=1:k
  s1(:,:,i) = cov(x1)./k;      % initially set to fraction of data covariance
end

set(gcf,'Renderer','zbuffer');

clear Z;
try

  % run EM for niter iterations
  
  for t=1:niter,
    fprintf('t=%d\r',t);
    % Do the E-step:
  
    for i=1:k
      Z(:,i) = p1(i)*det(s1(:,:,i))^(-0.5)*exp(-0.5*sum((x1'-repmat(mu1(:,i),1,n))'*inv(s1(:,:,i)).*(x1'-repmat(mu1(:,i),1,n))',2));
    end
    Z = Z./repmat(sum(Z,2),1,k);
    
    % Do the M-step:
    
    for i=1:k
      mu1(:,i) = (x1'*Z(:,i))./sum(Z(:,i));
      
      % We will fit Gaussians with diagonal covariances:
      
      s1(:,:,i) = diag((x1'-repmat(mu1(:,i),1,n)).^2*Z(:,i)./sum(Z(:,i))); 
      
      % To fit general Gaussians use the line:
       %s2(:,:,i) =(x'-repmat(mu2(:,i),1,n))*(repmat(Z(:,i),1,D).*(x'-repmat(mu2(:,i),1,n))')./sum(Z(:,i));
      
      p1(i) = (mean(Z(:,i)))
    end
    
    clf
    hold on
    plot(x1(:,1),x1(:,2),'.');
    for i=1:k
      plot_gaussian(2*s1(:,:,i),mu1(:,i),i,11);
    end
    drawnow;
  end
save('save_file2','mu1','p1','s1')
catch
  disp('Numerical Error in Loop - Possibly Singular Matrix');
  
end
%% p2
[n D] = size(x2);                    % number of observations (n) and dimension (D)
                             % number of components
p2 = [ones(1,k)/k]';                % mixing proportions
mu2 = x2(ceil(n.*rand(1,k)),:)';      % means picked rqandomly from data
s2 = zeros(D,D,k);                  % covariance matrices
niter=100;                          % number of iterations

% initialize covariances 

for i=1:k
  s2(:,:,i) = cov(x2)./k;      % initially set to fraction of data covariance
end

set(gcf,'Renderer','zbuffer');

clear Z;
try

  % run EM for niter iterations
  
  for t=1:niter,
    fprintf('t=%d\r',t);
    % Do the E-step:
  
    for i=1:k
      Z(:,i) = p2(i)*det(s2(:,:,i))^(-0.5)*exp(-0.5*sum((x2'-repmat(mu2(:,i),1,n))'*inv(s2(:,:,i)).*(x2'-repmat(mu2(:,i),1,n))',2));
    end
    Z = Z./repmat(sum(Z,2),1,k);
    
    % Do the M-step:
    
    for i=1:k
      mu2(:,i) = (x2'*Z(:,i))./sum(Z(:,i));
      
      % We will fit Gaussians with diagonal covariances:
      
      s2(:,:,i) = diag((x2'-repmat(mu2(:,i),1,n)).^2*Z(:,i)./sum(Z(:,i))); 
      
      % To fit general Gaussians use the line:
       %s2(:,:,i) =(x'-repmat(mu2(:,i),1,n))*(repmat(Z(:,i),1,D).*(x'-repmat(mu2(:,i),1,n))')./sum(Z(:,i));
      
      p2(i) = (mean(Z(:,i)))
    end
    
    clf
    hold on
    plot(x2(:,1),x2(:,2),'.');
    for i=1:k
      plot_gaussian(2*s2(:,:,i),mu2(:,i),i,11);
    end
    drawnow;
  end
  save('save_file1','mu2','p2','s2')
catch
  disp('Numerical Error in Loop - Possibly Singular Matrix');
  
end