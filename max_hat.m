clc
close all
clear all

r1=input('enter radius of region of positive reinforcement : ')
r2=input('enter radius of region of inter connections : ')
c1=input('enter constant c1 : ')
c2=input('enter constant c2 : ')

n=input('enter the length of external signal : ')

for i=1:n
    x(i)=input('enter neuron value : ');
end

x_old=x;
k=1;
s1=0;
s2=0;
s3=0;
ch=0;

while(ch==0)
while(k<=n)
    
    s1=0;
s2=0;s3=0;

for i=-r1 : r1
    if(k+i>0 && i+k<=n)
        s1=s1+x_old(i+k);
    end
end

for i=-r2:(-r1-1)
    if(k+i>0 && i+k<=n)
        s2=s2+x_old(i+k);
    end
end

for i=(r1+1):r2
    if(i+k>0 && i+k<=n)
        s3=s3+x_old(i+k);
    end
end

y(k)=(c1*s1 )+ (c2*s2)+(c2*s3);
if(y(k)<0)
    y(k)=0;
end
k=k+1;
end
ch=input('press 0 to continue or 1 to stop');
if(ch==0)
    x_old=y;
    k=1;
end
end

y
