function [pr]=prime(m,n)
%% primes function by Weston Johnson
    %Yields a vector of all the prime numbers between two positive
    %integers. Will fail if m is greater than n or if either argument is a
    %non-integer.
A=[m:n];
if m > n
    fprintf('The value of n must be larger than the value of m. \n')
elseif m < 0 || n < 0
    fprintf('The input argument must be a positive integer. \n')
elseif mod(m,1) > 0 || mod(n,1) > 0
    fprintf('The input argument must be a positive integer. \n')
else
    c=1;
    for c=1:length(A)
     Fac=factor(A(c));
     if length(Fac) == 1
     pr(c)=Fac;
     else
     pr(c)=0;
     end
    end
    pr=unique(pr);
    pr=pr(2:length(pr))
end