% Name : Anusha Guruprasad
% Contact Email : ag84104n@pace.edu
% Assignment Number : 1


function main
% question 1 

A = imread('peppers.bmp');
figure(1);
imshow(A);
title('RGB Original Image');

disp('-----Finish Solving Problem 1-----');

pause;

% Question 2 

B = rgb2gray(A);

% THe median function in MATLAB is performed on double images only, hence
% converted the image to double as in the below code:

double_B = double(B);

TB = B';
figure(2);

subplot(1,2,1);
imshow(B);
title('GrayScale Image of B');

subplot(1,2,2);
imshow(TB);
title('Transpose Image of B as TB');

max_Intensity = max(B(:));
min_Intensity = min(B(:));
mean_Intensity = mean(B(:));
median_Intensity = median(double_B(:));

fprintf('Maximum intensity of B is : %d\n', max_Intensity);
fprintf('Minimum intensity of B is : %d\n', min_Intensity);
fprintf('Mean intensity of B is : %.2f\n', mean_Intensity);
fprintf('Median intensity of B when converted to double is : %d\n', median_Intensity);

disp('-----Finish Solving Problem 2-----');

pause;

% Question 3

% Converted the image B into double already for solving the median error encountered  

C = double_B / double(max_Intensity);
figure(3);
imshow(C);
title('Normalized Grayscale Image');

disp('-----Finish Solving Problem 3-----');
pause;

% Question 4 

D1 = C.^0.25;
D2 = C.^1.25;


figure(4);
subplot(2, 1, 1);
imshow(D1);
title('D1 with the Power of 0.25');


subplot(2, 1, 2);
imshow(D2);
title('D2 with the Power of 1.25');


% Describe the effects of image transformations
disp('Image Transformation Effects:');
disp('----------------------------------------');

disp('D1 (Power of 0.25):');
disp('When each pixel is raised to the power of 0.25:');
disp('- It enhances lower-intensity details and brightens dark areas.');
disp('- The overall image contrast is reduced, leading to a smoother appearance.');

disp('----------------------------------------');

disp('D2 (Power of 1.25):');
disp('When each pixel is raised to the power of 1.25:');
disp('- It amplifies higher-intensity details and darkens bright areas.');
disp('- The overall image contrast is increased, making edges and features more pronounced.');

disp('----------------------------------------');



imwrite(D2, 'Anusha_D2.jpg', 'jpg');

disp('-----Finish Solving Problem 4-----');
pause;

% Question 5


threshold = 0.3;


bw1 = zeros(size(C));  
bw1(C >= threshold) = 1;  


bw2 = im2bw(C, threshold);

if all(bw1(:) == bw2(:))
    disp('My method worked');
else
    disp('My method did not work');
end


figure(5);

subplot(1, 2, 1);
imshow(bw1);
title('My Method');

subplot(1, 2, 2);
imshow(bw2);
title('MATLAB Method');

disp('-----Finish Solving Problem 5-----');
pause;

% Question 6 

close all;
clear;

disp('-----Finish Solving Problem 6-----');
pause;

% Question 7

a = imread('peppers.bmp');

inputImage = rgb2gray(a);

% Calling the ReduceGrayScale function to reduce the grayscale levels
outputImage = ReduceGrayScale(inputImage);

% Displaying the original vs reduced images
figure;
subplot(1, 2, 1);
imshow(inputImage);
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(outputImage);
title('Reduced Grayscale Image (1/4)');

disp('-----Finish Solving Problem 7-----');

end


function output_Image = ReduceGrayScale(input_Image)
    % Check if the input image is grayscale
    if size(input_Image, 3) == 3
        error('Input image must be grayscale');
    end

    % Reduce the grayscale levels to 1/4
    output_Image = floor(input_Image / 4);

    % Ensure values are in the range [0, 255]
    output_Image(output_Image < 0) = 0;
    output_Image(output_Image > 255) = 255;

end