function [I] = Simpson(x,y)
%% Simpson's 1/3 Rule Algorithm by Weston P Johnson, 22:04 4/14/2019
% -----------------------------------------------------------------------------------------------------
%     Returns the numerical integral of a given set of discrete data points,
%     where x and y are both vectors of the same length where x functions as 
%     independent variable and y as the corresponding values.
%     
%     Inputs:
%         *[x]; the independent variable of a given dataset, must be equally spaced
%         *[y]; the dependent variable of a given dataset, varies with x
%     Outputs:
%         *I; the scalar approximation of the definite integral between the first and last [x] values
%     Potential Bugs:
%         *[x] and [y] must have the same length and be in vector form, that
%         is with only one dimension with a length greater than one
%         *If [x] is not linearly spaced, the algorithm will fail, use cumtrapz instead
%         *If [x] or [y] is a scalar, division by zero will occur in the final step
%  ----------------------------------------------------------------------------------------------------    
%%        
I=0;
dime=length(x);
labrat=(linspace(x(1),x(dime),dime) == x);
if dime ~= length(y)
    error('Inputs must have same length')
elseif dime == 1
    error('Values must be in vector form')
elseif sum(sum(labrat)) ~= length(x)    %sum twice to give the function the capability to handle both types of vectors, without need for an extra check
    error('X values must be linearly spaced')
elseif round(dime/2) == (dime/2)
    fprintf('***Answer uses one application of the trapezoidal\na rule to complete the requested interval***');
    I=((x(length(x))-x(1))/(length(x)-1))*.5*(y(dime)+y(dime-1));
    x=x(1:(dime-1));    %snip snip
    y=y(1:(dime-1));
end

h=x(length(x))-x(1);
n=length(x)-1; %Number of bins

fours=ones(1,n/2);  %Preallocation for time saving on larger inputs
twos=ones(1,n/2); 
%%Interesting debate in research: faster or not to preallocate? 
%%Slower for dime<7, defaulting to doing it because Matlab
%%told me to and I am but a sheep before the Great Shepherd

for i=1:(n/2)   %Vectorize for efficiency i guess
    fours(i)=y(2*i);
    twos(i)=y(2*i+1);
end
twos=twos(1:(length(twos)-1)); %Combine like terms in array for easy summing
one=[y(1),y(length(y))];

I=I+h/(3*n)*(sum(one)+4*sum(fours)+2*sum(twos)); 