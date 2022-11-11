%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Developer : Shawn Chambers
%
% For Usage in Formatting Data to Send to Fathomnet
%
% This function takes in a filename that starts with the island name and 
% has other information afterwards. It then matches the first 3 characters
% with the corresponding island's full name and assigns the name to that
% location variable.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function location = findLocation(filename)

char_name = char(filename);
short_location = char_name(1:3);

if contains(short_location, 'HAW')
    location = "Hawaii, HI, USA";
elseif contains(short_location,'MAI')
    location = "Maui, HI, USA";
elseif contains(short_location,'KAU')
    location = "Kauai, HI, USA";
elseif contains(short_location, 'OAH')
    location = 'Oahu, HI, USA';
else
    location = NaN;
    disp('Invalid Location Name')
end