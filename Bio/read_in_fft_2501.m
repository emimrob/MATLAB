%===================================================================
% Problem 3
%
%===================================================================
clear;       % Clear variables
close all;   % Close figures
clc;         % Clear command window


%% Load data
load('./fft_of_image_problem3.mat');
Fc1   = fftshift(F1);
[a,b] = size(F1);

nFig = ifft2(F1,a,b);
figure(1)
subplot(1,2,1)
imshow(log10(abs(Fc1.^2)),[])
title('2D Fourier Spectrum','fontsize',20)

subplot(1,2,2)
imshow(nFig,[])
title('Image','fontsize',20)
