regionPath = '';
regionFiles = dir([regionPath,'*.bmp']);

originPath = '';
originFiles = dir([originPath,'*.bmp']);

savePath = '';

for i = 1:length(regionFiles)
    
	imgR = imread(strcat(regionPath,regionFiles(i).name));
    thresh = graythresh(imgR);
    imgR2 = im2bw(imgR,thresh);
    [m,n]=find(imgR2==0); 
    num = size(m,1);
	
	imgO = imread(strcat(originPath,originFiles(i).name));
	for ii = 1: num
	    imgO(m(ii),n(ii)) = 255;
	end
    imwrite(imgO,strcat(SavePath,originFiles(i).name));
end
