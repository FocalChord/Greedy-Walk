% Mark the eight specified functions for the 2017 matlab project
% To use this script requires a small amount of setup (see below).
% Note there are also two separate timing scripts which this function
% calls that can also be run separately, TimeBestGreedyPath and
% TimeBestPath
% Author: Peter Bier
%
% Setup:
% You will need to add the MarkingScripts directory to the
% matlab path so that Matlab can find the test scripts and test data files
% To do this from within Matlab right click on the directory
% called MarkingScripts and choose add to path, "Selected folders and subfolders").
% Adding a directory to the Matlab path allows Matlab to locate anything
% in that directory.  This allows you to keep your test scripts separate
% from the directory your code is stored in.
% This script assumes that you will change into a working directory
% that contains the code you want to test.
% Once setup is complete you can test code by typing Mark7 from
% within your working directory.  You can also test individual functions
% using the appropriate marking script, e.g. calling MarkReverse will
% mark the Reverse function.
%
% Note that if someone mispells one or more function names you can still use
% scripts to mark them, just specify the function name they have actually
% used as an optional argument (e.g. if they called their Reverse
% function reverse with a lower case "r", you could mark it by typing:
% MarkReverse('reverse')

clear
clc
% set up list of functions to mark
functionsList = {'Reverse', 'FindSmallestElevationChange', 'GreedyPick', ...
    'GreedyWalk', 'FindPathElevationsAndCost', 'BestGreedyPathHeadingEast', ...
    'BestGreedyPath','BestPath'};


divider='=======================================================';
totalMark = 0;
% Call the marking function for each listed function, e.g. MarkSpectrumBar
for i=1:length(functionsList)
    mark(i) = feval(['Mark' functionsList{i}],functionsList{i});
    totalMark = totalMark + mark(i);
    input('Hit enter to continue');
    disp(divider);
end

disp(['Your total functionality mark for the 8 functions is ' num2str(totalMark) '/24'])

% Next call the timing scripts if all relevent tests passed.
timingMark = 0;

% Time BestGreedyPath if it passed all tests
if mark(7) == 3
    timingMark = timingMark + TimeBestGreedyPath();
end
input('Hit enter to continue');

% Time BestPath if it passed all tests
if mark(8) == 3
    timingMark = timingMark + TimeBestPath();
end

disp(['Your total timing mark is ' num2str(timingMark) '/4'])


