function [ bestRows,bestCols,bestElev ] = BestGreedyPathHeadingEast(array)
% BestGreedyPathHeadingEast is the sixth function for the 
% 2017 Matlab Project

% Author: Nisarag Bhatt

% BestGreedyPathHeadingEast function will find the best greedy path heading
% east from a westerly edge (column 1).

% Input: array = The elevation data stored in a m x n 2D matrix.
% Output: bestRows = a 1D array representing the row indices of the best
%         path.
%         bestCols = a 1D array representing the column indices of the
%         best path.
%         bestElev = a 1D array containing the elevations for the
%                    corresponding row and column indices for the path

%Finding the size of the input array
[arrayRows,~] = size(array);

%Set the minimum cost to an arbitrary very large non-negative value.
minCost = Inf;

%Loop through all x values in the first column.
for ii = 1 : arrayRows
    %Call GreedyWalk function to find the pathRows and pathCols.
    %If you are heading east then you only start in the first column
    [ pathRows, pathCols ] = GreedyWalk( [ii,1] , 1, array );
    %Call FindPathEleavationsAndCost to find the elevation and cost.
    [elev,cost] = FindPathElevationsAndCost(pathRows,pathCols,array);
    %Updates the bestRows/bestCols/bestElev/minCost depending if the
    %miniumum cost is greater than the new cost. 
    %In the event of one or more paths tying for the lowest cost, the path
    %with the lowest row number will be returned. 
    if minCost > cost
        bestRows = [pathRows];
        bestCols = [pathCols];
        bestElev = [elev];
        minCost = cost;
    end
end

end

