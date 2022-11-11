%%%%%%%%%% FathomXML main script
% Runyan, Bonney, Chambers, Beason, and Parisi

% GOAL: convert xml image labels to FathomNet's format
% INPUTS:   1) a .csv with links for every .jpg image
%           2) massive list of .jpg and .xml files in same folder as this main script
% OUTPUTS:  1) a single .csv with columns headers and links per FathomNet's requirements

clc, clearvars

%%%%%%%%%% INPUT PARAMETERS
output_csv_name = strcat("FathomData_",string(datetime),".csv");


%%%%%%%%%% CREATE MAPPINGS FOR JPG LINKS
jpg_raw = readtable("listing of folder HAW-4240.xlsx");
jpg_raw = table2array(jpg_raw);

% Extract only jpg file types (probably a better way to do this...)
j = 1;
for i = 1:length(jpg_raw)
    if contains(jpg_raw(i), "jpg")
        jpg_links(j,1) = jpg_raw(i,1);
        jpg_links(j,2) = jpg_raw(i,2);
        j = j + 1;
    end
end

jpg_links = string(jpg_links);



%% UNDER CONSTRUCTION - CODE DOES NOT RUN


% Gather xml File Data
DirInfo = dir('*.xml'); %        % set to grab all .tiff images
imgNames = {DirInfo.name}; %names
imgPaths = {DirInfo.folder}; %long path to folder
imgNames = string(imgNames);

% Generate Full File Names
for i = 1:length(imgNames) % loop over each xml file
    
    % Construct full xml file path
    temp_file_path = strcat(imgPaths(i),"\",imgNames(i));
    
    % Parse xml into a structure 
    temp_struct = xml2struct(temp_file_path);
    
    % Check if objects exist
    %for j = 1:length(3) % loop over each object
       
        
            
        
        % Write Struct to csv
     %   xmlToCsvAppend(struct, output_csv);
        
    %end
    
    % Construct for each object
    
    
end



