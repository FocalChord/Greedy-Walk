function [ smallestPosition ] = FindSmallestElevationChange...
(currentElevation, elevations)

% FindSmallestElevationChange is the second function for the 2017 
% Matlab Project

% Author: Nisarag Bhatt

% FindSmallestElevationChange function finds the position in an array
% of elevation of the element or elements that correspond to the smallest
% change in elevation, given the current elevation.

% Inputs: currentElevation = A number representing the current elevation
%         elevations = A 1D Array of new elevations to choose from
% Outputs: smallestPosition = A 1D Array with the indices of the array
% element(s) that correspond to the smallest change in elevation.

%Find's the absolute difference between currentelevation and elevations
%for each element and stores the value in an array.
changeInElevations = abs(elevations - currentElevation);

%Finds the index number(s) of the absolute difference.
smallestPosition = find(changeInElevations==min(changeInElevations));

%Also note that the find function (inbuilt in Matlab)
%returns a vector containing the indices of a certain condition
%(in our case we want to find the indices of array which gives 
%the smallest difference)

end