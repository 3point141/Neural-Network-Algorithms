function [  C ] = net( A,B )
[m,n]=size(A);
[k,l]=size(B);
if(n~=k)
    C=[];
    disp('matrix multiplication not possible');
    return
end
C=zeros(m,1);
       for i=1:m;
        for j=1:l;
            for p=1:n;
                flag=1;
                C(i,j)=C(i,j)+ A(i,p)*B(p,j);
            end            
        end
    end
end