clc
close all
clear all

m=input('enter the number of clusters : ')
alpha=input('enter the initial learning rate : ')

w=input('enter initial weight matrix : ')
ch=0;
while(ch==0)

x=input('enter the vector to be clustered : ')
[r,c]=size(w);

d=zeros(1,c);
k=1;
for i=1:c
    for j=1:r
        d(i)=d(i)+((w(j,k)-x(j))^2)
    end
    k=k+1;
end
m=d(1);
J=1;
for i=1:c
    if(d(i)<m)
        J=i;
    end
end

J

for i=1:r
    w(i,J)=w(i,J)+(alpha*(x(i)-w(i,J)));
end

w
%alpha=0.5*alpha;
ch=input('enter 0 to test on more clusters, 1 to exit')
end
