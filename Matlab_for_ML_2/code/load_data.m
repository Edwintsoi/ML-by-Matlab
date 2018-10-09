function result=load_data(ph)
    a = load('PB_data.mat');
    f1 = a.f1;
    f2 = a.f2;
    phno=a.phno;
    x1=[f1(phno==ph),f2(phno==ph)];
    result=x1;
    
end
