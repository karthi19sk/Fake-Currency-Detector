clear all;
close all;

%Read the image
I = imread('sam1.jpg'); 

%Pre-analysis
hsvImage = rgb2hsv(I);
figure;
imshow([hsvImage(:,:,1) hsvImage(:,:,2) hsvImage(:,:,3)]);
title('TEST1');

%Initial segmentation
croppedImage = hsvImage(:,103:108,:);
satThresh = 0.4;
valThresh = 0.3;
BWImage = (croppedImage(:,:,2) > satThresh & croppedImage(:,:,3) < valThresh);
figure;
subplot(1,2,1);
imshow(BWImage);
title('TEST2');


%Post-process
se = strel('line', 6, 90);
BWImageClose = imclose(BWImage, se);
figure;
subplot(1,2,1);
imshow(BWImageClose);
title('TEST3');
subplot(1,2,2);

%%//Area open the image
figure;
areaopen = bwareaopen(BWImageClose, 15);
subplot(1,2,1);
imshow(areaopen);
title('TEST4');

%%//Count how many objects there are
[~,count] = bwlabel(areaopen);
black_lines= num2str(count);
disp(['The total number of black lines for the note is: ' black_lines]);

if (isequal(black_lines,1))
   disp('The note is REAL ');
else 
   disp('The note is FAKE ');
end   
