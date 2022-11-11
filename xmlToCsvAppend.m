function xmlToCsvAppend(data_struct,filename)

% convert to table
table_data = struct2table(data_struct);

% write the table to a .csv file
writetable(table_data,filename,'WriteMode','Append');

end
