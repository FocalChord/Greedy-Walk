function [r] = Reverse(Array)
% Reverse is the first function for the 2017 Matlab Project

% Author: Nisarag Bhatt

% Reverse function takes a single 2d array(1xn), and returns another 2d 
% array but with the input one reversed.


% Input: Array = Single 2D Array
% Output: r = Input Array Reversed

%The flip function in matlab takes an arbitary array in the form (1xn) 
%(where n is the number of columns) and returns the array with the same 
%size but with the order of elements reversed.

r = flip(Array);  

end

