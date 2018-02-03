clc
close all
clear all
syms a b

x1=input('enter matrix x1')
x2=input('enter martrix x2')
x3=input('enter matrix x3')
w1=input('enter the weight w1')
c=input('enter learning constant')
theta=0;
x=[x1;x2;x3]                    %combining to form a 2D matrix
figure (1)
subplot(4,1,1)
stem(x1)
title('X1')

subplot(4,1,2)
stem(x2)
title('X2')

subplot(4,1,3)
stem(x3)
title('X3')

subplot(4,1,4)
stem(w1)
title('initial weights')
ch=1;
rep=1;
while rep==1
    x(ch,:)
    net1=net(x(ch,:),w1')       %matrix multiplication
    if net1>0
        fnet=1
    else
        fnet=-1
    end
    
    w1=w1+c*fnet*x(ch,:)        %update weight after each iteration
    
    figure (ch+1)
    subplot(4,1,1)
    stem(x(ch,:))
    title('input X')
    
    subplot(4,1,2)
    stem(w1)
    title('updated weights')
    
    subplot(4,1,3)
    stem(net1)
    title('updated net')
    
    subplot(4,1,4)
    stem(fnet)
    title('fnet value')
    ch=ch+1;
    rep=input('input 1 to continue updating weights')
end