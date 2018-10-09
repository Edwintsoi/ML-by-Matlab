function result=task1(ph)
    a = load('PB_data.mat');
    f1 = a.f1;
    f2 = a.f2;
    phno=a.phno;
    x1=[f1(phno==ph),f2(phno==ph)];
    x2=[f1(phno==2),f2(phno==2)];
    result=x1;
    scatter(f1,f2,'filled');
end



