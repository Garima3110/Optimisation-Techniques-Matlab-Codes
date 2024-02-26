format short
clc
clear all
A=[-1 3;1 1;1 -1;1 0;0 1];
B=[10;6;2;0;0];
C=[1 5];
x1=0:max(B);
for i=1:size(A,1)
    x(i,:)=(B(i)-A(i,1)*x1)/A(i,2);
    x(i,:)=max(0,x(i,:))
end
plot(x1,x(1,:),'r',x1,x(2,:),'g',x1,x(3,:),'b');
title('x1 Vs x2');
grid on;
xlabel('x1');
ylabel('x2');
legend('-x1+3x2=10','x1+x2=6','x1-x2=2');
sol=[];
for i=1:size(A,1)
    a1=A(i,:);
    b1=B(i);
    for j=i+1:size(A,1)
        a2=A(j,:);
        b2=B(j);
        a3=[a1;a2];
        b3=[b1;b2];
        x=a3\b3;
        sol=[sol x];
    end
end
sol=sol';
for i=1:3
    h=find(A(i,1)*sol(:,1)+A(i,2)*sol(:,2)>B(i));
    sol(h,:)=[];
end
for i=4:5
    h=find(A(i,1)*sol(:,1)+A(i,2)*sol(:,2)<B(i));
    sol(h,:)=[];
end
sol
an=[];
for i=1:size(sol,1)
  an=[an sum(sol(i,:).*C)];
    an
end
an
max(an)
fprintf('Maximum value %d',max(an));
[ANS ,index]=max(an)
sol(index,:)