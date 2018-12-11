%===================================================================
%Program reads in image and performes 1D and 2D FFT
%
%===================================================================
clear;       % Clear variables
close all;   % Close figures
clc;         % Clear command window


%% Load in image 1 and FFT
fig1  = imread('./image1.jpg');   % Read in immage
fig1  = rgb2gray(fig1);           % Convert image to grayscale
[a,b] = size(fig1);               % Define number of points for 2Dfft
F1    = fft2(fig1);               % Execute 2D-fft
Fc1   = fftshift(F1);             % Convert Matlab fft to common convention (f(0,0) at center)

figure(1)
subplot(1,3,1)
imshow(fig1,[])
title('Image 1','fontsize',18)

subplot(1,3,2)
imshow(log10(abs(F1.^2)),[])
title({'Fourier Spectrum:', 'Matlab'},'fontsize',18)
xlabel('q_x','fontsize',16)
ylabel('q_y','fontsize',16)

subplot(1,3,3)
imshow(log10(abs(Fc1.^2)),[])
title({'Fourier Spectrum:', 'fftshift'},'fontsize',18)
xlabel('q_x','fontsize',16)
ylabel('q_y','fontsize',16)

%% Load image 2

fig2 = imread('./image2.png');  % Read in immage
fig2 = rgb2gray(fig2);
[a,b] = size(fig2);
F2  = fft2(fig2);
Fc2 = fftshift(F2);

fig2b = [fig2;fig2;fig2;fig2];
[a,b] = size(fig2);
F2b   = fft2(fig2b,a,b);
Fc2b  = fftshift(F2b);

figure(2)
subplot(2,2,1)
imshow(fig2,[])
title('Image 2A','fontsize',18)

subplot(2,2,3)
imshow(log10(abs(Fc2.^2)),[])
title('Fourier Spectrum A','fontsize',18)
xlabel('q_x','fontsize',16)
ylabel('q_y','fontsize',16)

subplot(2,2,2)
imshow(fig2b,[])
title('Image 2B','fontsize',18)

subplot(2,2,4)
imshow(log10(abs(Fc2b.^2)),[])
title('Fourier Spectrum B','fontsize',18)
xlabel('q_x','fontsize',16)
ylabel('q_y','fontsize',16)

%% Load image 3

fig3 = imread('./image3.png');  % Read in immage
fig3 = rgb2gray(fig3);
[a,b] = size(fig3);
F3  = fft2(fig3);
Fc3 = fftshift(F3);

figure(3)
subplot(2,2,1)
imshow(fig2,[])
title('Image 3A','fontsize',18)
subplot(2,2,3)
imshow(log10(abs(Fc2.^2)),[])
title('Fourier Spectrum A','fontsize',18)
xlabel('q_x','fontsize',16)
ylabel('q_y','fontsize',16)

subplot(2,2,2)
imshow(fig3,[])
title('Image 3B','fontsize',18)

subplot(2,2,4)
imshow(log10(abs(Fc3.^2)),[])
title('Fourier Spectrum B','fontsize',18)
xlabel('q_x','fontsize',16)
ylabel('q_y','fontsize',16)

%% Load image 4
fig4  = imread('./image4.jpg');  % Read in immage
fig4  = rgb2gray(fig4);
fig4b = fig4(1:250,21:250);
[a,b] = size(fig4);
F4    = fft2(fig4,a,b);
[a2,b2]= size(fig4b);
F4b   = fft2(fig4b,a2,b2);
Fc4   = fftshift(F4);
Fc4b  = fftshift(F4b);

figure(4)
subplot(2,2,1)
imshow(fig4,[])
title('Image 4A','fontsize',18)


subplot(2,2,2)
imshow(fig4b,[])
title('Image 4B','fontsize',18)

subplot(2,2,3)
imshow(log10(abs(Fc4.^2)),[])
title('Fourier Spectrum A','fontsize',18)
xlabel('q_x','fontsize',16)
ylabel('q_y','fontsize',16)

subplot(2,2,4)
imshow(log10(abs(Fc4b.^2)),[])
title('Fourier Spectrum B','fontsize',18)
xlabel('q_x','fontsize',16)
ylabel('q_y','fontsize',16)



