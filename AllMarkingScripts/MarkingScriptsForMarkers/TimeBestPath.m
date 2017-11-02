function [mark] = TimeBestPath(specifiedFunctionName)% Times the BestPath function
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% Time BestPath by running it on a 100x100 elevation array
% Timing standards are based on execution time when code is run on the
% university lab machines
% Timing will be done by calling the function three times and averaging the
% result
% Note you can only earn timing marks if your BestPath function
% earned full functionality marks, i.e. you need a working BestPath
% function to be eligible for the timing marks.
% If the average time is less than 10 seconds you get 2 marks
% If the average time is more than 10 but less than 20 seconds you get 1 mark
% if the average time is more than 20 seconds you do not earn a timing mark
% author: Peter Bier

% default the function name to BestGreedyPath, if no optional arg specified
if nargin == 0
    functionName = 'BestPath';
else
    functionName = specifiedFunctionName;
end

% call the TimeBestGreedPath function specifiying the BestPath name
mark = TimeBestGreedyPath(functionName);
