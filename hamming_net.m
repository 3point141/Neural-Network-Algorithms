clc
close all
clear all

e1=input('enter exemplar vector 1 : ')
e2=input('enter exemplar vector 2 : ')
ch=0;    

while (ch==0)
x=input('enter the input vector : ')
n=length(x);

for i=1:n
    w(i,1)=e1(i)/2;
    w(i,2)=e2(i)/2;
    if(i<3)
        b(i)=n/2;
    end
end
s1=0;
s2=0;

for i=1:n
    s1=s1+(x(i)*w(i,1));
    s2=s2+(x(i)*w(i,2));
end

yin1=b(1)+s1;
yin2=b(2)+s2;

if (yin1>yin2)
    disp('Maxnet will find that unit Y1 has the best match exemplar for input x')
else
    disp('Maxnet will find that unit Y2 has the best match exemplar for input x')
end

ch=input('enter 0 to try with other input vector else press 1 to exit : ')

end
