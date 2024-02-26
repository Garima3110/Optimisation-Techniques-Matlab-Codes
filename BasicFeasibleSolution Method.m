format long
clc 
clear all
A=[2 3 -1 4; 1 2 6 -7];
B=[8;-3];
C=[2 3 4 7];
n=size(A,2);
m=size(A,1);
if(n>m)
    nCm=nchoosek(n,m);
    p=nchoosek(1:n,m)
    solution=[];
    for i=1:nCm
        y=zeros(1,n)
        A1=A(:,p(i,:))
        sol=A1\B
        if all(sol>0)
            y(:,p(i,:))=sol
            solution=[solution;y]
        end
    end
    an=[];
    for i=1:size(solution,1)
        an=[an sum(solution(i,:).*C)]
    end
    [ANS ind]=max(an)
    solution(ind,:)
else
    error('Error');
end
