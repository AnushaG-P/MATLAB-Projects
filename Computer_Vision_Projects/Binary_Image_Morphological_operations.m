
% Name : Anusha Guruprsad
% Email ID : ag84104n@pace.edu
% Assignment : 2

function main()
% Problem 1

% Part a

img = imread("Food.jpg");
NewMin = 0;
NewMax = 255;

ScaledFood = imadjust(img, [min(img(:))/255, max(img(:))/255], [NewMin/255, NewMax/255]);

figure(1);
subplot(1,2,1);
imshow(img);
title("Original Image");

subplot(1,2,2);
imshow(ScaledFood);
title("Scaled Image");
imwrite(ScaledFood, "ScaledFood.jpg");
disp("-----Finished Solving Problem 1 part a ----");
pause;

% Part b
num_bins_start = 128;
num_bins_end = 512;
num_bins_step_size = 124;

% Create a new figure
figure(2);

% Loop through num_bins with the specified step size
for num_bins = num_bins_start:num_bins_step_size:num_bins_end
    
    % Compute the histogram
    hist_img = imhist(img, num_bins);

    % Normalized histogram 
    normalised_hist = hist_img / sum(hist_img);

    % Create a subplot within the current figure

    subplot(length(num_bins_start:num_bins_step_size:num_bins_end), 2, (num_bins - num_bins_start) / num_bins_step_size * 2 + 1);
    bar(hist_img);
    title(['Histogram (num_bins = ' num2str(num_bins) ')']);

    % Create another subplot for the normalized histogram
    subplot(length(num_bins_start:num_bins_step_size:num_bins_end), 2, (num_bins - num_bins_start) / num_bins_step_size * 2 + 2);
    bar(normalised_hist);
    title(['Normalized Histogram (num_bins = ' num2str(num_bins) ')']);
end



disp("-----Finished Solving Problem 1 part b ----");
pause;

% Part-c
equalised_img = histeq(img);

figure(3);
subplot(1,3,1);
imshow(img);
title("Original Image:");

subplot(1,3,2);
imshow(ScaledFood);
title("Scaled Food Image:");

subplot(1,3,3);
imshow(equalised_img);
title("Equalised Image:");

% saving equalized image:

imwrite(equalised_img, "EqualizedFood.jpg");

disp("-----Finished Solving Problem 1 part c ----");
pause;

% Part - d : close and clear :

close all;
clear;

disp("-----Finished Solving Problem 1 part d ----");
pause;
disp("---- Finished Solving Problem 1 -----");

% Problem 2 : 

shapes = imread('Shapes.tiff');

struct_ele = strel("square",21);
   
openedImage = imopen(shapes, struct_ele);      % Opening
closedImage = imclose(shapes, struct_ele);      % Closing
close_of_opened = imclose(openedImage, struct_ele);      % Closing

%displaying the image now : 
figure(4);

subplot(2,2,1);
imshow(shapes);
title("Original Image");

% displaying 2nd figure

%displaying the image now : 
subplot(2,2,2);
imshow(openedImage);
title("The Desired Image 1:");

%displaying the 3rd image now : 
subplot(2,2,3);
imshow(closedImage);
title("The Desired Image 2:");

%displaying the 4th image now : 
subplot(2,2,4);
imshow(close_of_opened);
title("The Desired Image 3:");

disp("-----Finished Solving Problem 2 ----");
pause;

% Problem 3 : 
wirebond = imread("Wirebond.tiff");

% img 1
struct_ele = strel("disk", 10);

eroded_img_1 = imerode(wirebond, struct_ele);


% img 2
struct_ele = strel("disk", 6);

eroded_img_2 = imerode(wirebond, struct_ele);

% img 3
struct_ele = strel("disk", 18);

eroded_img_3 = imerode(wirebond, struct_ele);

figure(4)
subplot(1,4,1);
imshow(wirebond);
title("Original Image");

subplot(1,4,2);
imshow(eroded_img_1);
title("The desired image 1");

subplot(1,4,3);
imshow(eroded_img_2);
title("The desired image 2");

subplot(1,4,4);
imshow(eroded_img_3);
title("The desired image 3");

disp("-----Finished Solving Problem 3 ----");
pause;

% Problem 4 :

city_img = imread("City.jpg");

struct_ele = strel('square', 3);

% dilation
dilated_img = imdilate(city_img, struct_ele);
%erode
eroded_img = imerode(city_img, struct_ele);

%calulating resultant image
resultant_img_c = dilated_img - eroded_img;

%saving images
imwrite(dilated_img, "A.jpg");
imwrite(eroded_img, "B.jpg");

figure;
imshow(resultant_img_c);
title("Resultant City Image");


disp("By performing dilation, white regions of the image are getting enhanced and enlarged. Erosion is eroding away the white regions and shrinks them.")
disp("-----Finished Solving Problem 4 ----");

%closing and clearing the tabs again
close all;
clear;
disp("Closed the tabs again");
end 


