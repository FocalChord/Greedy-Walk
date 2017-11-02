function [ bestRows,bestCols,bestElev ] = BestGreedyPath( array )
% BestGreedyPathHeadingEast is the sixth function for the 2017
% Matlab Project

% Author: Nisarag Bhatt

% BestGreedyPath function will find the best greedy path heading
% east or west from every single element.

% Input: array = The elevation data stored in a m x n 2D matrix.
% Output: bestRows = a 1D array representing the row indices of the best
%         path.
%         bestCols = a 1D array representing the column indices of the
%         best path.
%         bestElev = a 1D array containing the elevations for the
%                    corresponding row and column indices for the path

%Finding the size of the input array
[arrayRows,arrayCols] = size(array);

%Set the minimum cost to an arbitrary very large non-negative value.
minCost = Inf;

%Loop through each element of the array and check 3 conditions, if the
%element is in column 1 or if the element is in column n (where n is the
%maximum number of columns in a m x n matrix) and elsewhere.
for ii = 1:arrayRows
    for jj = 1:arrayCols
        %If the element is in the first column 1, then we want to travel
        %east.
        if jj == 1
            [ pathRows, pathCols ] = GreedyWalk( [ii,jj] , 1, array );
            %If the element is in the last column (n), then we want to 
            %travel west.
        elseif jj == arrayCols
            [ pathRows, pathCols ] = GreedyWalk( [ii,jj] , -1, array );
            %Reverse if you are starting from eastern edge.
            pathRows = Reverse(pathRows);
            pathCols = Reverse(pathCols);
            %If the element is anywhere else.
        else
            %We need to get two outputs from GreedyWalk
            %We need to consider both paths,east or west when we are
            %starting in the middle of the array.
            [ pathRowsEast, pathColsEast ] = GreedyWalk( [ii,jj] , 1 , ...
            array );
            [ pathRowsWest, pathColsWest ] = GreedyWalk( [ii,jj] , -1 ,...
            array );
            %Flip west rows/cols while keeping east the same.
            pathRows = [Reverse(pathRowsWest(2:end)) pathRowsEast];
            pathCols = [Reverse(pathColsWest(2:end)) pathColsEast];
        end
            %Call FindPathElevationsAndCost to get elevation and cost
            [elev,cost] = FindPathElevationsAndCost(pathRows,pathCols,...
            array);
            %Check if minCost is greater than cost
            if cost < minCost
                bestRows = [pathRows];
                bestCols = [pathCols];
                bestElev = [elev];
                minCost = cost;
    end

end

end

