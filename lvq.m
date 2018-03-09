clc
close all
clear all

alpha=input('enter the learning rate alpha : ')
c_len=input('enter the number of classes : ')
t=1;
vector=input('enter all vectors in matrix form seperated by semicolon(;) ' )
c=input('enter the target class they belong to respectively : ')

[r cc]=size(vector)
check=c(1);
k=1;
for i=1:length(c)
    if check~=c(i)
        ind(k)=i;
        break;
    end
end

ind
for i=1:cc
    w(1,i)=vector(1,i);
    w(2,i)=vector(ind,i);
end
k=1;

for i=2:length(c)
    if(i~=ind)
        rem(k)=i;
        k=k+1;
    end
end
ch=0;
while(ch==0)

for i=1:cc
    x(i)=vector(rem(t),i);
end

k=1;
[w_row,w_col]=size(w)
d=zeros(1,w_row);
for i=1:w_row
    for j=1:w_col
        d(i)=d(i)+((w(k,j)-x(j))^2)
    end
    k=k+1;
end

T=c(rem(t));

m=1;
j=d(1);
J=1;
for i=1:w_row
    if(d(i)<j)
        J=i;
    end
end
J
if (T==J)
    for i=1:w_col
        w(J,i)=w(J,i)+(alpha*(x(i)-w(J,i)));
    end
else
    for i=1:w_col
        w(J,i)=w(J,i)-(alpha*(x(i)-w(J,i)));
    end
end

w
t=t+1;
ch=input('enter 0 to continue, 1 to exit : ')
end

