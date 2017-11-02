function  [pathRow,pathCol,pathElev]=BestPath(inputArray)
% BestPath is the eight function for the 2017 
% Matlab Project

% Author: Nisarag Bhatt

% BestPath will find the best possible path across the map. 
% (Further explanation below)

% Input: inputArray = The elevation data stored in a m x n 2D matrix.
% Output: bestRows = a 1D array representing the row indices of the best
%         path.
%         bestCols = a 1D array representing the column indices of the
%         best path.
%         bestElev = a 1D array containing the elevations for the
%                    corresponding row and column indices for the path

% This function was inspired by the dijkstra algorithm found here: 
% https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm. 

% The algorithm that has been implemented here is not exactly dijkstra 
% algorithm but a variation of it, because dijkstra works on graphs 
% however in our case we need to find the best path for an array and that 
% is different so the algorithm was slighly adjusted in order to use it. 

% The main idea of this algorithm is to go through each row in each column
% and check if the weighting (or cost) of moving from the current element
% to the adjacent element, if that weighting is less than the weighting of 
% the adjacent element then the function dynamically replaces that
% weighting with the current weighting and then sums it up with the
% previous lowest weighting. By the end of this loop, the weightingMatrix
% should be full, where the last column will contain the weights of each
% bestPath however the actual bestPath will be the one with the lowest
% weighting. While doing the weightingMatrix we keep track of the
% nodes/elements that we have travelled to by using a trackingMatrix.
% The trackingMatrix essentially keeps track of the path for the
% lowestWeightPath. By doing this, we can easily get the path of the
% lowestWeight by using this matrix and reverse engineering from the lowest
% Weight. 

%Finds the size of the input array
[arrayRows,arrayCols] = size(inputArray);
%We need a weight matrix, which tells us the weight (or cost) between each
%element and dynamically updates them if one is less than the other.
%Initially we want our weightMatrix to have all elements equal to infinity
weightMatrix = inf(arrayRows,arrayCols);
%We require our weightMatrix's first columns to equal zero because the
%weight of moving from an element to it self is zero.
weightMatrix(:,1) = zeros;
%We need to use a backTrackMatrix to retrace the path of the lowest weight
%for the weightMatrix.
trackMatrix = inf(arrayRows,arrayCols);

%We have a triple for loop, where firstly we have to check the first column
%then all of the rows and then move to the next column and check the rest
%of the rows.
for ii = 1:arrayCols-1
    for jj = 1:arrayRows
        %The temporary weight is the value of the element of the
        %weightMatrix
        tempWeight = weightMatrix(jj,ii);
        %3 Conditions, either you are in the first row, or last row or else
        %where. 
        if(jj==1)
            %If you are in the first row, you can only move to 2 adjacent
            %elements.
            rowArray = [jj jj+1];
        elseif(jj==arrayRows)
            %If you are in the last row, you can only move to 2 adjacent
            %elements 
            rowArray = [jj-1 jj];
        else
            %If you are elsewhere, you have 3 elements you can move to.
            rowArray = [jj-1:jj+1];
        end
        
        %This 3rd for loop finds the weighting between each element and its
        %adjacent element and checks the weight between each other and if
        %the weight in the adjacent element is greater than the weight
        %calculated then that weight is replaced.
        for kk=1:length(rowArray)
            %Goes through each row element.
            row = rowArray(kk);
            %Finds the weight comparison
            weightAdj = abs(inputArray(jj,ii)-inputArray(row,ii+1));
            %This is the new weighting of the element (the sum of the
            %other)
            newWeight = weightAdj+tempWeight;
            %Check if the adjacent element has a greater weighting than the
            %current weight
            if newWeight < weightMatrix( (row) , (ii+1) )
                %If it is greater, we want to replace it with the lower
                %one.
                weightMatrix(row,ii+1) = newWeight;
                %We want to keep track of the path to reach the lowest cost
                %so we set the element equal to the row number. 
                trackMatrix(row,ii+1)=jj;
            end
        end
    end
end

%The final bestWeight will always be in the last column so we get this
%column.
lastColumn = weightMatrix(:, arrayCols);
%Finds the position of this bestWeight (ie lowestWeight)
bestWeightIndice = find(lastColumn == min(lastColumn), 1 ); 
%The rowPath will always be big as the column matrix. (also pre allocating
%to increase efficiency).
pathRow = zeros(1,arrayCols); 
%This is the first element of rowPath
pathRow(arrayCols) = bestWeightIndice; 
%Setting the row we want to read to in the backTrackMatrix.
pathRowElement = bestWeightIndice; 

%This loop, loops through the backTrackmatrix and retrieves the bestWeight
%path.
for ii=arrayCols:-1:2
    %Goes to the next element of row.
    pathRow(ii-1) = trackMatrix(pathRowElement, ii); 
    %Sets the next element of rowPath to the previous one.
    pathRowElement = trackMatrix(pathRowElement, ii); 
end

%The column path will always be from 1 to the size of the array cols.
pathCol = 1:arrayCols;

%This is to track the pathElevationData for our bestWeight path.
%Preallocating because the pathElev is as big as the pathRow (or cols).
pathElev = zeros(1,length(pathRow));
%Loops through the length of pathRow and finds the corresponding elevation
%from the starting array.
for ii = 1:length(pathRow)
    %Finds the corresponding element from the input array.
    pathElev(ii) = inputArray(pathRow(ii),pathCol(ii));
end