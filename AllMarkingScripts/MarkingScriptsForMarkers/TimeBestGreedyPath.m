function [mark] = TimeBestGreedyPath(specifiedFunctionName)
% Times the BestGreedyPath function
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
    functionName = 'BestGreedyPath';
else
    functionName = specifiedFunctionName;
end



% Set up an array using the peaks function to generate elevation data

P = peaks(50);
E =[P P; P P];

try
    fprintf('Begininning timing of three iterations for %s ...\n', functionName)
    for i=1:3
        tic % start the clock
        [PathRows,PathCols, PathElev] = feval(functionName,E);
        time(i) = toc; % stop the clock
        fprintf('Time for iteration %i was %.4f\n',i,time(i));
    end
    
    averageTime = mean(time);
    fprintf('Summary for %s: ',functionName);
    if averageTime <10
        fprintf('Average time below 10 seconds\n Award 2 marks\n');
        mark = 2;
    elseif averageTime <20   
        fprintf('Average time above 10 seconds but below 20 seconds\n Award 1 mark\n');      
        mark = 1;
    else
        fprintf('Average time above 20 seconds\n  Award 0 marks\n');        
        mark = 0;
    end
    
catch ex
    disp([m 'FAILED test']);
    ProcessMarkingException(ex, functionName)
    mark = 0;
end
