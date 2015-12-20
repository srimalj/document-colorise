clear all; close all;clc;

%% External commands
% convert -density 300 file.pdf in.png
% convert out.png out.pdf

%% Params
color=[0.5 0.2 0.2];
threshold=0.2;

%%
img = imread('in.png');

img = rgb2gray(img);

layer = double(img) / double(max(img(:)));

mask = layer < threshold;

out = uint8(zeros(size(mask)));

for r=1:size(mask,1)
    for c = 1:size(mask,2)
        
        if mask(r,c)
            out(r,c,1) = color(1)*255;
            out(r,c,2) = color(2)*255;
            out(r,c,3) = color(3)*255;
        else
            out(r,c,1) = 255;
            out(r,c,2) = 255;
            out(r,c,3) = 255;
        end
        
    end
end

imwrite(out,'out.png');
