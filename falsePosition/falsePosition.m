function [root,fx,ea,iter]=falsePosition(func,xl,xu,es,maxiter)
%% Rootfinding function by Weston Johnson
%Utilizes the false position method to approximate a root to an entered 
%anonymous function. Requires bracketing of a root.
%Inputs: 
%   func-anonymous function
%   xl-lower bound
%   xu-upper bound
%   es-stopping criterion, approximate error percentage
%   maxiter-maximum number of iterations to allow
%Outputs:
%   root-approximate value of one of the function's roots between the brackets
%   fx-functional value at the approximate root
%   ea-approximate error associated with the root location
%   iter-number of false position iterations required to return this root
%Troubleshooting:
%   *An error will occur if the provided bounds do not bracket a root
%   *High curvature in the function will lead to slow convergence,
%   increasing the number of iterations required to achieve accuracy
%   *Input function must be entered as an anonymous function handle in the
%   form @(variable)=function of said variable; entering a string or any
%   other form of function will cause falsePosition to fail
%   *The fourth and fifth inputs default to .0001 percent and 200 iterations, respectively, if
%   no value is entered
%   *Stopping criterion is entered as a percentage
%   *To recieve outputs beyond the root, create a vector in which those
%   values can be assigned variables when calling the function
%%
%Error messages for required inputs

switch nargin
    case 1
        error('Bounds required.')
    case 2
        error('Upper bound required.')
    case 3
        es=.0001;
        maxiter=200;
    case 4
        maxiter=200;
end

f=func;
false
%Error message for proper bracketing
if (f(xl)*f(xu)) > 0
    error('Bounds must bracket a root.')
end

%Initialize required iteration variables
rootold=0;
iter=0;
ea=100;

%Logic of false position
while (ea > es) && (iter < maxiter)
    root=xu-f(xu)*(xl-xu)/(f(xl)-f(xu));
    root=double(root);
    if f(root)*f(xu) > 0
        xu=root;
    elseif f(root)*f(xu) < 0
        xl=root;
    elseif f(root) == 0
        rootold=root;
    end
    ea=100*(root-rootold)/root;
    iter=iter+1;
    rootold=root;
end

root=rootold;
fx=f(root);
ea=ea;
iter=iter;
