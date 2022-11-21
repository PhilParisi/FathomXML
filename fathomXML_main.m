%%%%%%%%%% FathomXML main script
% Runyan, Bonney, Chambers, Beason, and Parisi

% GOAL: convert xml image labels to FathomNet's format
% INPUTS:   1) a .csv with links for every .jpg image
%           2) massive list of .jpg and .xml files in same folder as this main script
% OUTPUTS:  1) a single .csv with columns headers and links per FathomNet's requirements

clc, clearvars


%%%%%%%%%% INPUT PARAMETERS
output_csv_name = strcat("FathomData_",string(datetime),".xlsx");

% Gather xml File Data
DirInfo = dir('*.xml');         % set to grab all .tiff images
imgNames = {DirInfo.name};      % img file names
imgNames = string(imgNames);    % convert to strings

tic
%%%%%%%%%% GENERATE CSV

% Loop of Images and Convert XMLs to CSV
for i = 1:length(imgNames) % loop over each xml file
    
    % print counter
    disp(strcat("Photo ",string(i)))

    % Pull file path
    temp_file_path = imgNames(i);

    % Parse xml into a structure, append to CSV 
    xmlFnConverter(temp_file_path, output_csv_name);
    
end

%%%%%%%%%% PROGRAM OUTPUTS
run_time = toc;

disp(strcat("Finished! Data stored here --> ", output_csv_name))
disp(strcat("Runtime was ", string(run_time),"secs"))
