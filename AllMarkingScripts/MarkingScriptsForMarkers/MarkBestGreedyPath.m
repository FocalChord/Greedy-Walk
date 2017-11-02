function [mark] = MarkBestGreedyPath(specifiedFunctionName)
% Marks the BestGreedyPath function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% BestGreedyPath takes a single input, the elevation data stored in a
% 2D m x n matrix
%
% It should return three outputs in the following order:
% 1)	a 1D array representing containing the row indices of the path
% 2)	a 1D array representing the corresponding column indices of the path
% 3)	a 1D array containing the elevations for the corresponding row and
% column indices for the path
%
% author: Peter Bier

% default the function name to BestGreedyPath, if no optional arg specified
if nargin == 0
    functionName = 'BestGreedyPath';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load MarkingDataBestGreedyPath

input1 = BestGreedyPathInput1;

expectedOutput1 = BestGreedyPathExpectedOutput1;
expectedOutput2 = BestGreedyPathExpectedOutput2;
expectedOutput3 = BestGreedyPathExpectedOutput3;


purpose = BestGreedyPathTestPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        [output1{i} output2{i} output3{i}] = feval(functionName,input1{i});
        % check if result returned closely matches the expected result
        
        % check what order columns are in
        
        if isequal(expectedOutput2{i},output2{i})
            % columns increasing
            if isequal(expectedOutput1{i},output1{i})  ...
                    && isequal(expectedOutput3{i},output3{i})
                totalPassed = totalPassed + 1;
                disp([m 'Passed test']);
            else
                disp([m 'FAILED test']);
            end
        elseif isequal(expectedOutput2{i},fliplr(output2{i}))
            % columns decreasing
            if isequal(expectedOutput1{i},fliplr(output1{i}))  ...
                    && isequal(expectedOutput3{i},output3{i})
                totalPassed = totalPassed + 1;
                disp([m 'Passed test']);
            else
                disp([m 'FAILED test']);
            end
        else
            disp([m 'FAILED test']);
        end
        
        
        %         if isequal(expectedOutput1{i},output1{i}) && isequal(expectedOutput2{i},output2{i}) ...
        %                 && isequal(expectedOutput3{i},output3{i})
        %             totalPassed = totalPassed + 1;
        %             disp([m 'Passed test']);
        %         else
        %             disp([m 'FAILED test']);
        %         end
        
    catch ex
        disp([m 'FAILED test']);
        ProcessMarkingException(ex, functionName)
    end
    
end

% display marks summary
allocatedMarks = 3;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);

