clc
close all
clear all

e=input('enter inhibitory weight : ')
n=input('enter number of input neurons :')
for i=1:n
    x(i)=input('enter the input value : ');
end
count=0;
flag=0;

while(flag==0)

s=0;

for i=1:n
    s=s+x(i);
end
s
sum=zeros(1,n);
x_new=zeros(1,n);
count=0
for i=1:n
    sum(i)=s-x(i);
    x_new(i)=x(i)-(e*sum(i));
    if(x_new(i)<=0)
        x_new(i)=0;
    end
    if(x_new(i)~=0)
        count=count+1;
    end
end

if(count==1)
    flag=1
end
x_new
x=x_new
end