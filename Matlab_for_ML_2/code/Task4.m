load('save_file1.mat');
load('save_file2.mat');

x1 = load_data(1);
x2 = load_data(2);

X=[x1;x2];

max_X=max(X);
min_X=min(X);

LenghtX=min_X(1):max_X(1);
LenghtY=min_X(2):max_X(2);
for o=1:size(LenghtX,2)
    xp=LenghtX(o)*ones(size(LenghtY,2),1);
    xp2=[xp,LenghtY'];
    
    
    x1=xp2;
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
    predicted_class = (P23>P13)+1;
    
    M(o,:)=predicted_class;
    imagesc(M);
end


