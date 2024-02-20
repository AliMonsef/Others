%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                %
%        This Program has been developed by "Ali Monsef"         % 
%           Master Student of Mechanical Engineering             %
%          Iran University of Science and Technology             %
%                                                                %
%               Contact: alimonsef1997@gmail.com                 %
%                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clearvars;

disp('This program solves a linear equation system Ax=b with Gauss Elimination method.');

A=[ 1  3 -2  4
    0  1 -1  5
    3  0  6  1
   -2  1 10 -5];

disp('A =');
disp(A);
disp(' ');

b=[17
   19
   25
   10];

disp('b =');
disp(b);
disp(' ');

n=size(A,1);

old_A=A;
old_b=b;

for i=1:n-1
    if A(i,i)==0
        [max_in_column k]=max(abs(A(i+1:end,i)));
        A(i,:)=A(i,:)+A(i+k,:);
        b(i)=b(i)+b(i+k);
    end
    
    for j=i+1:n
        c=A(j,i)/A(i,i);
        A(j,:)=A(j,:)-c*A(i,:);
        b(j)=b(j)-c*b(i);
    end
end

x=zeros(n,1);
for i=n:-1:1
    S=0;
    for j=i+1:n
        S=S+A(i,j)*x(j);
    end
    S=b(i)-S;
    x(i)=S/A(i,i);
end

disp(' ');
disp('Matrices before elimination are:');
disp([old_A old_b]);
disp(' ');
disp('Matrices after elimination are:');
disp([A b]);
disp(' ');
disp('And the solution of the system is:');
disp(['x = ' mat2str(x',4)]);
disp(' ');
