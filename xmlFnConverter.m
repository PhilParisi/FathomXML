%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% xmlFnConverter(xml_filename,csv_filename)
%
% Developer : Jbuns
%
% For Usage in Formatting Data to Send to Fathomnet.
%
% This function takes an xml annotation file and a CSV filename as inputs. 
% The output appends a struct to a CSV file with the annotation information 
% in Fathomnet format.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function xmlFnConverter(xml_filename,csv_filename)

y = xml2struct(xml_filename); % create nested struct from XML file

if isfield(y.annotation, 'object') % check for field 'object' in struct
    disp('Houston, we have an urchin!')
    
    loc = findLocation(xml_filename); % find Hawaii location from filename
    
    [FILEPATH,NAME,EXT] = fileparts(xml_filename); % change ext to .jpg
    jpg_filename = append(NAME, ".jpg")
    
    for i = 1:length(y.annotation.object) % iterate for each object in xml
        
        % parse annotation data from struct, check if greater than 1 object
        % because struct indexing changes (i hate matlab).
        if length(y.annotation.object) <= 1
            name = y.annotation.object.name.Text;
            xmin = str2num(y.annotation.object.bndbox.xmin.Text);
            ymin = str2num(y.annotation.object.bndbox.ymin.Text);
            xmax = str2num(y.annotation.object.bndbox.xmax.Text);
            ymax = str2num(y.annotation.object.bndbox.ymax.Text);
        else
            name = y.annotation.object{1,i}.name.Text;
            xmin = str2num(y.annotation.object{i}.bndbox.xmin.Text);
            ymin = str2num(y.annotation.object{i}.bndbox.ymin.Text);
            xmax = str2num(y.annotation.object{i}.bndbox.xmax.Text);
            ymax = str2num(y.annotation.object{i}.bndbox.ymax.Text);
        end
        
        % create struct of class object
        object.filename = jpg_filename;
        object.class = name;
        object.x = xmin;
        object.y = ymin;
        object.width = xmax - xmin;
        object.height = ymax - ymin;
        object.location = loc;
        
        xmlToCsvAppend(object, csv_filename); % append object to CSV file
    end
    
else 
    disp('Sorry, no urchins :(')
end
