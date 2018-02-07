clc
close all
clear all

A=[-1 1 -1 ; 1 -1 1 ; 1 1 1 ; 1 -1 1 ; 1 -1 1];
B=[1 1 1 ; 1 -1 1 ; 1 1 1 ; 1 -1 1 ; 1 1 1];
C=[-1 1 1 ; 1 -1 -1 ; 1 -1 -1 ; 1 -1 -1 ; -1 1 1];
D=[-1 1 -1 ; 1 -1 1 ; 1 -1 1 ; 1 -1 1 ; -1 1 -1];
E=[1 1 1 ; 1 -1 -1 ; 1 1 1 ; 1 -1 -1 ; 1 1 1];
F=[1 1 1 ; 1 -1 -1 ; 1 1 1 ; 1 -1 -1 ; 1 -1 -1];
G=[1 1 1 ; 1 -1 -1 ; 1 1 1 ; 1 -1 1 ; 1 1 1];
H=[1 -1 1 ; 1 -1 1 ; 1 1 1 ; 1 -1 1 ; 1 -1 1];
I=[1 1 1 ; -1 1 -1 ; -1 1 -1 ; -1 1 -1 ; 1 1 1];
J=[1 1 1 ; -1 1 -1 ; -1 1 -1 ; -1 1 -1 ; 1 1 -1];
K=[1 -1 1 ; 1 1 -1 ; 1 -1 -1 ; 1 1 -1 ; 1 -1 1];
L=[1 -1 -1 ; 1 -1 -1 ; 1 -1 -1 ; 1 -1 -1 ; 1 1 1];
M=[1 -1 1 ; 1 1 1 ; 1 1 1 ; 1 -1 -1 ; 1 -1 -1];
N=[1 -1 1 ; 1 -1 1 ; 1 1 1 ; 1 1 1 ; 1 -1 1];
O=[1 1 1 ; 1 -1 1 ; 1 -1 1 ; 1 -1 1 ; 1 1 1];
P=[1 1 1 ; 1 -1 1 ; 1 1 1 ; 1 -1 -1 ; 1 -1 -1];
Q=[-1 1 -1 ; 1 -1 1 ; 1 -1 1 ; 1 1 1 ; -1 1 -1];
R=[1 1 1 ; 1 -1 1 ; 1 1 1 ; 1 1 -1 ; 1 -1 1];
S=[-1 1 1 ; 1 -1 -1 ; -1 1 1 ; -1 -1 1 ; 1 1 -1];
T=[1 1 1 ; -1 1 -1 ; -1 1 -1 ; -1 1 -1 ; -1 1 -1];
U=[1 -1 1 ; 1 -1 1 ; 1 -1 1 ; 1 -1 1 ; 1 1 1];
V=[1 -1 1 ; 1 -1 1 ; 1 -1 1 ; 1 -1 1 ; -1 1 -1];
W=[1 -1 1 ; 1 -1 1 ; 1 -1 1 ; 1 1 1 ; 1 -1 1];
X=[1 -1 1 ; 1 -1 1 ; -1 1 -1 ; 1 -1 1 ; 1 -1 1];
Y=[1 -1 1 ; 1 -1 1 ; -1 1 -1 ; -1 1 -1 ; -1 1 -1];
Z=[1 1 1 ; -1 -1 1 ; -1 1 -1 ; 1 -1 -1 ; 1 1 1];

x=input('input first character : ')
w1=input('input the output of first character : ')
x1=reshape(x',[1,15])
y=input('input second character : ')
w2=input('input the output of second character : ')
y1=reshape(y',[1,15]);

t1=(0:1:1)
t2=(0:1:14)
subplot(4,1,1)
stem(t1,w1)
title('output weights of the first character')

subplot(4,1,2)
stem(t2,x1)
title('Character 1 ')

subplot(4,1,3)
stem(t1,w2)
title('output weights of the second character ')

subplot(4,1,4)
stem(t2,y1)
title('Character 2 ')

ch1=zeros(15,2)
ch2=zeros(15,2)

for i=1:15
    ch1(i,1)=w1(1)*x1(i);
    ch1(i,2)=w1(2)*x1(i);
    ch2(i,1)=w2(1)*y1(i);
    ch2(i,2)=w2(2)*y1(i);
end

ch1
ch2
w=ch1+ch2

figure (2)
stem(w)
title(' weight matrix')

input_pat1= x1*w
input_pat2= y1*w

for i=1:2
    if(input_pat1(i)>0)
        input_pat1(i)=1;
    else
        input_pat1(i)=-1;
    end
    
    if(input_pat2(i)>0)
        input_pat2(i)=1;
    else
        input_pat2(i)=-1;
    end
    
end

input_pat1
input_pat2

figure (3)
subplot(2,1,1)
stem(t1,input_pat1)
title('input pattern for character 1')

subplot(2,1,2)
stem(t1,input_pat2)
title('input pattern for character 2')


% To check the bidirectional nature of the net 

w_transpose=w'

rev1=w1*w_transpose
rev2=w2*w_transpose

for i=1:15
    if(rev1(i)>0)
        rev1(i)=1;
    else
        rev1(i)=-1;
    end
    
    if(rev2(i)>0)
        rev2(i)=1;
    else
        rev2(i)=-1;
    end
end

rev1   % the original input pattern of character 1
rev2   % the original input pattern of character 2

figure (4)
subplot(2,1,1)
stem(t2,rev1)
title(' input vector associated with character 1 ')

subplot(2,1,2)
stem(t2,rev2)
title(' input vector associated with character 2 ')
