function [ pathRows, pathCols ] = GreedyWalk( position, direction, array)
% GreedyWalk is the fourth function for the 2017 Matlab Project

% Author: Nisarag Bhatt

% GreedyWalk function finds the greedy path from a given arbitrary position
% heading in a specified direction (east or west) and continues until the
% end of the array is reached. It then tells you what rows and cols to go
% in exactly to get the best walk.

% Inputs: position = A 2 element 1D array representing the current position
%                    where the first element is row number and second
%                    element is the column number.
%         direction = An integer representing the direction to head in, to
%                     head east an input of +1 is required and to head west
%                     and input of -1 is required.
%         array = An arbritary mxn (m rows & n columns) array which shows
%                 the elevation data.
% Outputs: pathRows = a 1D array representing containing the row indices 
%                     of the path
%          pathCols = a 1D array representing the corresponding column 
%                     indices of the path

%Finds the size of the array 
%(x represents amount of rows and y represents amount of columns)
[x,y] = size(array);

%x1 represents the x coordinate of the position
x1 = position(1);

%y1 represents the y coordinate of the position
y1 = position(2);

%Preallocating and Initializing Arrays
pathRows = [x1];
pathCols = [y1];

% 2 Conditions - either heading east or west.

% Heading east , loop through all the columns and end at the second to last
% one because at the last column you are done. We call the GreedyPick
% function to give coordinates of the next position and then we accordingly
% append each coordinate accordingly.
if direction == 1
    for ii = y1 : 1 : y-1
        position = GreedyPick(position,direction,array);
        pathRows = [pathRows, position(1)];
        pathCols = [pathCols, position(2)];
    end
    % Heading West, same as before but the only difference is that
    % we stop at column 2 for any array because then you are done since 
    % there are no more positions to jump to after the second column.
elseif direction == -1
    for ii = y1 : -1 : 2
        position = GreedyPick(position,direction,array);
        pathRows = [pathRows, position(1)];
        pathCols = [pathCols, position(2)];
    end
end

end

