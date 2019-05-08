function[L,U,P]=luFactor(A)
%% luFactor by Weston Johnson 22:01 4/1/2019
%   Function returns the LU factorization of an input square matrix,
%   with important implications in linear system solution finding.
%   Notably, P*A=L*U, where A is a coefficient matrix of a linear system.
%   
%   Inputs-
%   *[A]; square matrix of scalar values with dimensions nxn
%   
%   Outputs-
%   *[L]; square matrix (nxn) of multipliers used in elimination, lower
%   triangular
%   *[U]; square matrix (nxn) created from elimination, upper triangular
%   *[P]; square matrix (nxn) manipulated from the identity matrix to keep
%   track of row switching involved in elimination

%% Error Testing
dime=size(A);
if nargin == 0 || nargin > 1
    error('Incorrect number of arguments. Enter one coefficient matrix.')
elseif dime(1) ~= dime(2)
    error('Matrix must be square.')
end
%% Elimination
U=A;
P=eye(dime(1));

for i=1:dime(1)
    tonic=U(i,i);
    tonicRow=U(i,:);
    eyetonicRow=P(i,:);
    [newtonic,newtonicSpot]=max(abs(U(i:dime(1),i)));
    newtonicSpot=newtonicSpot+i-1;
    U(i,:)=U(newtonicSpot,:);
    U(newtonicSpot,:)=tonicRow;
    P(i,:)=P(newtonicSpot,:);
    P(newtonicSpot,:)=eyetonicRow;
    for j=(1+i):dime(1)
        M=U(j,i)/U(i,i);
        U(j,i:dime(1))=-U(i,i:dime(1)).*M+U(j,i:dime(1));
        U(j,i)=M;
    end
end
%% Final Values
L=tril(U,-1);
for n=1:dime(1)
    L(n,n)=1;
end
U=triu(U);




        