%author : aman
%for the XOR implementation, bipolar input and bipolar output 
% x1=[1 1 -1 -1]
% x2=[1 -1 1 -1]
% t=[-1 1 1 -1]
% w1=[0.05 0.2]
% b1=0.3
% w2[0.1 0.2]
% b2=0.15
% w3=[0.5 0.5]
% b3=0.5
% alpha=0.5
% epoch=1

clc
close all
clear all

x1=input('enter the first input matrix : ');
x2=input('enter the second input martix : ');
t=input('enter the target of these matrix : ');

w1=input('enter the weights into z1 ( w11,w21,w31,w41...) : ');
b1=input('enter the first bias (b1) : ');
w2=input('enter the weights into z2 ( w12,w22,w32,w42...) : ');
b2=input('enter the second bias (b2) : ');
w3=input('enter the weights into z3 ( v1,v2,v3,v4...) : ');
b3=input('enter the third bias (b3) : ');
alpha=input('enter the learning rate : ')
epoch=input('enter the number of epoch : ')
l=length(x1);
pp=1;
while pp<=epoch
    for i=1:l

        sum1=0;
        sum2=0;
        k=1;
        sum1=x1(i)*w1(k) + x2(i)*w1(k+1);
        sum2=x1(i)*w2(k) + x2(i)*w2(k+1);
        x=[x1(i) x2(i)]
        zin1=b1+sum1;
        zin2=b2+sum2;
        xx=zin1;
        yy=zin2;

        if zin1>=0
            zin1=1
        else
            zin1=-1
        end

        if zin2>=0
            zin2=1
        else
            zin2=-1
        end

        yin=(x1(i)*w3(k)+x2(i)*w3(k+1))+b3

        if yin>=0
            yin=1
        else
            yin=-1
        end

        res=t(i)-yin
        if res==0
            disp('no weights will be updated ')
            continue;
        else
            disp('going to update weights ... ')
            if t(i)==1
                if abs(xx)>abs(yy)
                    closest=yy;
                    b2=b2+alpha*(1-yy);
                    disp('t==1 , b2 updated... ')
                    b2
                    le=length(w2);
                    for j=1:le
                        w2(j)=w2(j)+alpha*(1-yy)*x(j);
                    end
                    disp('t==1, w2 updated... ')
                    w2
                else
                    closest=xx;
                    b1=b1+alpha*(1-xx);
                    disp('t==1, b1 updated... ')
                    b1
                    le=length(w1);
                    for j=1:le
                        w1(j)=w1(j)+alpha*(1-xx)*x(j);
                    end
                    disp('t==1, w1 updated : ')
                    w1
                end

            else
                if t(i)==-1
                    if xx>0
                        b1=b1+alpha*(-1-xx);
                        disp('t==-1, b1 updated... ')
                        b1
                        le2=length(w1);
                        for j=1:le2
                            w1(j)=w1(j)+alpha*(-1-xx)*x(j);
                        end
                        disp('t==-1, w1 updated : ')
                        w1
                    end

                    if yy>0
                        b2=b2+alpha*(-1-yy);
                        disp('t==-1, b2 updated.. ')
                        b2
                        le2=length(w2);
                        for j=1:le2
                            w2(j)=w2(j)+alpha*(-1-yy)*x(j);
                        end
                        disp('w2 updated :')
                        w2
                    end

                end

            end

        end
    end
pp=pp+1;
disp('new epoch started ........................................... ')
end

w1
w2
b1
b2
                
            
            


