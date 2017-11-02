function [ pick ] = GreedyPick(position,direction,array)
% GreedyPick is the third function for the 2017 Matlab Project

% Author: Nisarag Bhatt

% GreedyPick function chooses which array element to go next based on which
% adjacent element results in the minimum change in elevation.

% Inputs: position = A 2 element 1D array representing the current position
%                    where the first element is row number and second
%                    element is the column number.
%         direction = An integer representing the direction to head in, to
%                     head east an input of +1 is required and to head west
%                     and input of -1 is required.
%         array = An arbritary mxn (m rows & n columns) array which shows
%                 the elevation data.
% Outputs: pick = A 1D Array consisting of 2 elements (in order): the row
%                 number and column number of the new position
%                 that has been picked


%Finds the size of the array (lastRowNumber 
%represents amount of rows and y represents amount of columns)
[lastRowNumber,y] = size(array);

%x1 represents the x coordinate of the position
x1 = position(1);

%y1 represents the y coordinate of the position
y1 = position(2);

%3 Situations to consider therefore we use if/elseif/else.


%First situation is if the x coordinate of position is in the first row
if x1 == 1
    
    %If the x coordinate of position = 1 then there are only 2 adjacent
    %elements to choose from so we take this into account.
    pick = FindSmallestElevationChange( array(x1,y1) , ...
    [array( x1:x1+1, y1+direction)]);
    
    %Second situation is if the x coordinate of position is in the last row
elseif x1 == lastRowNumber
    
    %If the x coordinate of position = the m'th row (where m represents 
    %the last row) then there are only 2 adjacent elements to choose from 
    %so we take this into account.
    pick = FindSmallestElevationChange( array(x1,y1) , ...
    [array( x1-1:x1, y1+direction)]);
    
    %After testing, it was found when your x coordinate of position is not 
    %in the first row then you have to add your x coordinate of position 
    %and then subtract 2.
    pick = pick + x1 - 2;
    
    %Third situation is if the x coordinate of position is anywhere other 
    %than the first two.
else
    
    %Anywhere else other than the first 2 situations there are 3 adjacent
    %elements.
    pick = FindSmallestElevationChange( array(x1,y1) , ...
    [array( x1-1:x1+1, y1+direction)]);
    
    %After testing, it was found when your x coordinate of position is not 
    %in the first row then you have to add your x coordinate of position 
    %and then subtract 2.
    pick = pick + x1 - 2;
    
end

%Because pick can return 2 or more numbers, we would want
%the northenmost number which is the minimum out of the two so we have to
%take this into account.
pick = [pick(1),y1+direction];

end