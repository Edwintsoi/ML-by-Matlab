load('save_file1.mat');
load('save_file2.mat');

x1 = load_data(1);
x1=x1(131:end,:); %test data phonme1
x2 = load_data(2);
x2 = x2(131:end,:); %test data phonme2
[n,D] = size(x1);

k=3;
P13=0;

for i=1:k
      partsumP13 = (p1(i))/((2*pi)^(D/2))*(det(s1(:,:,i))^(-0.5));
      partexpP13=exp(-0.5*sum((x1'-repmat(mu1(:,i),1,n))'*inv(s1(:,:,i)).*(x1'-repmat(mu1(:,i),1,n))',2));  
      P13=P13 + partsumP13* partexpP13; 
end

  
  
P23=0;

for i=1:k
      partsumP23 = (p2(i))/((2*pi)^(D/2))*(det(s2(:,:,i))^(-0.5));
      partexpP23=exp(-0.5*sum((x1'-repmat(mu2(:,i),1,n))'*inv(s2(:,:,i)).*(x1'-repmat(mu2(:,i),1,n))',2));  
      P23=P23 + partsumP23* partexpP23; 
end


predicted_class = (P23>P13)+1; %classififation error
 sum(predicted_class==2)/size(predicted_class,1)

 %% Phonme=2
 P13=0;
[n,D] = size(x2);
for i=1:k
      partsumP13 = (p1(i))/((2*pi)^(D/2))*(det(s1(:,:,i))^(-0.5));
      partexpP13=exp(-0.5*sum((x2'-repmat(mu1(:,i),1,n))'*inv(s1(:,:,i)).*(x2'-repmat(mu1(:,i),1,n))',2));  
      P13=P13 + partsumP13* partexpP13; 
end

 
  
P23=0;

for i=1:k
      partsumP23 = (p2(i))/((2*pi)^(D/2))*(det(s2(:,:,i))^(-0.5));
      partexpP23=exp(-0.5*sum((x2'-repmat(mu2(:,i),1,n))'*inv(s2(:,:,i)).*(x2'-repmat(mu2(:,i),1,n))',2));  
      P23=P23 + partsumP23* partexpP23; 
end


predicted_class = (P23>P13)+1; %classififation error
 sum(predicted_class==1)/size(predicted_class,1)






