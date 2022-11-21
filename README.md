# FathomXML
converting xml image labels to csv format to upload to MBARI's FathomNet

Link to FathomNet: https://www.mbari.org/fathomnet/

## Background
Researcher Alexa Runyan manually labeled 1000's of underwater images. Using a Classification ML algorithm, she identified six different species of urchin. MBARI's FathomNet was debuted in 2021 and has required formats for contributing to their 'database' of labeled images. There is great interest in making Runyan's datasets available to FathomNet to further ocean science.

## Problem
FathomNet's required format for uploads differs from the format used by Runyan. Thus, there is a need to automate the process of converting between formats.

## Approach
Runyan's labeled data is in .xml format. FathomNet requires a .csv file. The code used in this repository convert labeled .xml files into a .csv file that matches FathomNet's format. 

## Generalizing
This code is not in a 'general' format than can be used for any research project. However, the methods will be similar and other users can take advantage of this approach. Everything was programmed in MATLAB for fast develop.

## Results
In total, there were 4904 photos. 3063 urchins were present amidst the images. It took MATLAB 7.5 minutes to go through each xml and write a new line in the csv for each urchin.

## Acknowledgements
Researchers that contributed to this codebase include: Alexa Runyan, Jake Bonney, Shawn Chambers, Jordan Beason and Phil Parisi.
A special thank you goes to Wouter Falkena for their xml2struct() function, available here: https://www.mathworks.com/matlabcentral/fileexchange/28518-xml2struct
