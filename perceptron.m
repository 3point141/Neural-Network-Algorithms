clc
close all
clear all

alpha=1; %learning rate
w=[0 0]; %initial weights
b=0; %bias
theta=0.1;%threshold
%w=[w,b];

% AND GATE : binary input and bipolar output
% 1 1 -> 1
% 1 0 -> -1
% 0 1 -> -1
% 0 0 -> -1


s=[1 1;1 0; 0 1; 0 0]
t=[1; -1; -1; -1]
[r,c]=size(s)
l=length(t);
k=1;
t1=1;
sf=reshape(s,1,r*c);
flag=1;

    
while(k<=l)
    in(1,1)=s(k,1);
    in(1,2)=s(k,2);
    disp('input vector : ')
    in
    sum=0;
    for i=1:c
        sum=sum+in(i)*w(i);
    end
    
    net=b+sum
    if net>theta
        yin=1
    end
    if net>=-theta && net<=theta
        yin=0
    end
    if net<=-theta
        yin=-1
    end
    
    if yin==t(k)
        w=w;
        b=b;
        disp('no weights and bias updated... ')
    else
        flag=1;
        for i=1:c
            w(i)=w(i)+alpha*t(k)*in(i);
        end
        b=b+alpha*t(k);
        disp('weights and bias updated ')
        disp('new weights : ')
        w
        disp('new bias : ')
        b
    end
        
        
    k=k+1;
    
    if k==r
        if flag==1
            k=1;
            flag=0;
        end
    end
end
disp('final weights : ')
w
disp('final bias value : ')
b

