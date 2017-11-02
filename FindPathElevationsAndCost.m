function [elev,cost] = FindPathElevationsAndCost(rows,cols,array)
% FindPathElevationsAndCost is the fifth function for the 2017 
% Matlab Project

% Author: Nisarag Bhatt

% FindPathElevationsAndCost function takes a specific path and finds the
% elevations and the total cost of travelling that certain path.

% Input: rows = A 1D array consisting of the row indices of the path.
%        cols = A 1D array consisting of the column indices of the path.
%        array = The elevation data stored in a m x n 2D matrix.
% Output: elev = A 1D array consisting the elevations for the corresponding
%                row and column indices for the path.
%         cost = The total cost to travel the path.

%Find the size of the input array
[~,arrayCols] = size(array);

%Preallocating to save time (the maximum size the array can be is the
%maximux columns)
elev = zeros(1,length(cols));

%Initializing cost
cost = 0;

%This for loop, loops through the columns of the matrix and then stores the
%elevation data into the array.
for ii = 1 : length(cols)
    %Find the elevation value from the corresponding row and column number.
    elevationValue = array(rows(ii), cols(ii));
    %Store this value inside of the elev array.
    elev(ii) = elevationValue;
end

%This for loop, loops through the elev array and then finds the difference
%between the starting element and the one next to it and so forth. It then
%adds the cost to the one before it.
for jj = 1 : (length(elev)-1)
    %Updating the value of cost as it goes through each element.
    cost = cost + abs(elev(jj)-elev(jj+1));
end

