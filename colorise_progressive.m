clear all; close all;clc;

%% External commands
% convert -density 300 file.pdf in.png
% convert out.png out.pdf

%% Params
color=[	85 107 47];

%%
img = imread('in.png');

img = rgb2gray(img);

w1 = double(img) / double(max(img(:)));
w2 = 1 - w1;

out = uint8(zeros(size(img)));

out(:,:,1) = (w1 * 255) + (w2 * color(1));
out(:,:,2) = (w1 * 255) + (w2 * color(2));
out(:,:,3) = (w1 * 255) + (w2 * color(3));

imwrite(out,'out.png');
