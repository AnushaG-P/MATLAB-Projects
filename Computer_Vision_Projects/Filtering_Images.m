% Name : Anusha Guruprsad
% Email ID : ag84104n@pace.edu
% Assignment : 3

function main()
% Problem - 1 
org_image = imread("Circuit.jpg");
originalImage = double(org_image);

% displaying of the Circuit image
figure(1);
subplot(1,3,1);
imshow(uint8(originalImage));
title("Original Circuit Image");
% process the noisy image
filterImage3x3 = MeanFilter(originalImage, 3);
filterImage5x5 = MeanFilter(originalImage, 5);

% part a : Mean filter function
%display filtered images
subplot(1,3,2);
imshow(uint8(filterImage3x3));
title("3x3 Image Filtered");

subplot(1,3,3);
imshow(uint8(filterImage3x3));
title("5x5 Image Filtered");

% Pause to view the results
disp('-----Finish Solving Part a-----');
pause;

% Part - b: fspecial & filter2 for mean filtering

filter3x3 = fspecial('average',[3,3]);
filter5x5 = fspecial('average',[5,5]);

filtered_fspecial_3x3 = filter2(filter3x3, originalImage);
filtered_fspecial_5x5 = filter2(filter5x5, originalImage);

%comparision

equal3x3 = isequal(uint8(filtered_fspecial_3x3), uint8(filterImage3x3));
equal5x5 = isequal(uint8(filtered_fspecial_5x5), uint8(filterImage5x5));

fprintf('Images are similar in case of 3x3 : %d \n',equal3x3);
fprintf('Images are similar in case of 5x5 : %d \n',equal5x5);

% Pause to view the results
disp('-----Finish Solving Part b-----');
pause;

% Part - c : MedianFilter

%process noisy image 
filteredMedian3x3 = MedianFilter(uint8(originalImage), [1 2 2; 1 1 1; 2 1 1]);
filteredMedian5x5 = MedianFilter(uint8(originalImage), 5);

%display
figure(2);
subplot(1,3,1);
imshow(uint8(originalImage));
title("Original Image: ");

subplot(1,3,2);
imshow(uint8(filteredMedian3x3));
title('Median Filtered for 3x3 :');

subplot(1,3,3);
imshow(uint8(filteredMedian5x5));
title('Median Filtered for 5x5 :');

%pause the result
disp('----Finished Solving Part c ----');
pause;

% part d : medfilter2 for median filtering

medfilter3x3 = medfilt2(uint8(originalImage), [3,3]);
medfilter5x5 = medfilt2(uint8(originalImage), [5,5]);

%comapre with the results
equalMed3x3 = isequal(medfilter3x3, filteredMedian3x3);
equalMed5x5 = isequal(medfilter5x5, filteredMedian5x5);

fprintf('3x3 median filters are equal : %d \n', equalMed3x3);
fprintf('5x5 median filters are equal : %d \n', equalMed5x5);

%pause the result
disp('----Finished Solving Part d ----');
pause;

% part - e : Laplacian mask:
originalMoon = imread('Moon.jpg');
originalMoon2 = double(originalMoon);
laplacianMask = [0 -1 0; -1 4 -1; 0 -1 0];
filteredMoon = imfilter(originalMoon2, laplacianMask, 'replicate');
enhancedMoon = originalMoon2 - filteredMoon;

% displaying the moon
figure(3);
subplot(2,2,1);
imshow(originalMoon);
title('Original Moon Image');

subplot(2,2,2);
imshow(uint8(filteredMoon), []);
title('Filtered Moon (Laplacian) :');

%scaling the figure
scaledMoon = filteredMoon + abs(min(filteredMoon(:)));
scaledMoon = scaledMoon / max(scaledMoon(:));

subplot(2,2,3);
imshow((scaledMoon), []);
title('Scaled Filtered Image');

subplot(2,2,4);
imshow(uint8(enhancedMoon));
title("Enhanced Moon Image");

%pause the result
disp('----Finished Solving Part e ----');
pause;

% part - f : close all and clear
close all;
clear;
disp('----Finished Solving Part f ----');
end 



function filteredImage = MedianFilter(inputImage, maskSize)
    [rows, columns] = size(inputImage);
    border = floor(maskSize / 2);
    filteredImage = uint8(zeros(size(inputImage)));

    for i = 1 + border : rows - border
        for j = 1 + border : columns - border
            neighbor = inputImage(i-border:i+border, j-border:j+border);
            filteredImage(i,j) = median(neighbor(:));
        end
    end
end

function filterImage = MeanFilter( inputImg, maskSize)
    [rows,columns] = size(inputImg);
    mask = ones(maskSize)/ (maskSize^2);
    border = floor(maskSize / 2);
    filterImage = zeros(size(inputImg));

    for i = 1 + border : rows- border
        for j = 1+ border : columns - border
            neighbor = inputImg(i-border:i+border, j-border:j+border);
            filterImage(i, j) = sum(neighbor(:) .* mask(:));
        end
    end
end