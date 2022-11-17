function [csv_out] = ReformatTable(csv_url,csv_data)
% ReformatTable function by Jordan Beason for FathomXML

% INPUT 1 -> URL Table with order: .jpg,url
% INPUT 2 -> Data Table with order: filename,class,x,y,width,height,location
% OUTPUT  -> Data CSV with order: class,url,x,y,width,height,location

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
csv_data_height = height(csv_data);
array_swapped = char.empty(0,csv_data_height); % Pre-allocate array for url swap

Class = string(csv_data{:,2}); % Extract other data from CSV
X = table2array(csv_data(:,3));
Y = table2array(csv_data(:,4));
Width = table2array(csv_data(:,5));
Height = table2array(csv_data(:,6));
Location = string(csv_data{:,7});


k = string(csv_url{:,1});  % Dictionary using csv_url to swap strings
v = string(csv_url{:,2});
d = dictionary(k,v);

for i = 1:csv_data_height % create array swapping .jpg with url
    array_swapped{i,1}=d(string(csv_data{i,1}));
end

URL = array_swapped; % Rename for output

% Rewrite CSV in correct order
csv_out = table(Class,URL,X,Y,Width,Height,Location);
writetable(csv_out,'csv_out.csv')
end