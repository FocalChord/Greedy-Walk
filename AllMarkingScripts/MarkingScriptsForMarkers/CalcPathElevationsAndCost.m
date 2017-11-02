function [pathElevations,pathCost] = CalcPathElevationsAndCost(pathRow,pathCol,E)
% CalcPathElevationsAndCost takes a specified path and finds the
% associated elevations along the path and the total cost
% of traversing that path in terms of summing the elevation changes
% where an elevation change is treated as a positive value
% regardless of whether the elevation is a decrease or increase

pathCost = 0;
pathElevations(1) = E( pathRow(1),pathCol(1) );

for i = 2:length(pathRow)
    
    pathElevations(i) = E(pathRow(i),pathCol(i));
    pathCost = pathCost + abs(pathElevations(i)-pathElevations(i-1));
    
end

end
