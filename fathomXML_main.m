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
DirInfo = dir('*.xml'); %        % set to grab all .tiff images
imgNames = {DirInfo.name}; %names
%imgPaths = {DirInfo.folder}; %long path to folder
imgNames = string(imgNames);

% Generate Full File Names
for i = 1:length(imgNames) % loop over each xml file
    
    % Construct full xml file path
    %temp_file_path = strcat(imgPaths(i),"\",imgNames(i));
    temp_file_path = imgNames(i);

    % Parse xml into a structure 
    xmlFnConverter(temp_file_path, output_csv_name);
    
    % Check if objects exist
    %for j = 1:length(3) % loop over each object
       
        
            
        
        % Write Struct to csv
     %   xmlToCsvAppend(struct, output_csv);
        
    %end
    
    % Construct for each object
    
    
end



