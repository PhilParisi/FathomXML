function xmlToCsvAppend(data_struct,filename)

table_data = struct2table(data_struct);

writetable(table_data,filename,'WriteMode','Append','FileType', 'spreadsheet');