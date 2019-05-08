function [nd]=days(mo,da,leap)
% Returns the number of days that have occured in a year\n
%Inputs: 
%'mo'-current month
%'da'-current day
%optional: 'leap'-value of 1 for a leap year, 0 for a non-leap year.
%Default zero

if (1 > mo || mo > 12) || (1 > da || da > 31) || (0 > leap || leap > 1)
    error('Invalid Input: Values Negative or Exceed Maximum');
end

% if nargin == 0
%     error('Current Day and Month Required');
% elseif nargin == 1
%     error('Current Day of Month Required');
% elseif nargin == 2 || mo <= 2
%     leap=0;
% end
    
daysper=[31 28 31 30 31 30 31 31 30 31 30 31];
nd=sum(daysper(1:(mo-1)))+da+leap;
