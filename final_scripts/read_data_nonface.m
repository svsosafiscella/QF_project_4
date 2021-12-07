function [images_nonface,labels] = read_data_nonface(n_images)
%
% output: 
%
% images: n_subjects*n_images x 112*92 matrix
%  - each column is an image
%
% You can recover the image in column i as:
%
%   img_i = reshape(images(:,i),[112,92])
%
% labels: Nx1 vector, label for the digit for each image
%
images_nonface = zeros(n_images , 112*92);
labels = zeros(n_images , 1);
idx = 1;
    
for img=1:n_images
    file = strcat('./otherimages/',string(img),'.pgm');
    fid = imread(file,'pgm');
    images_nonface(idx,:) = reshape(fid,[1,112*92]);
    labels(idx) = 0;
        
    idx = idx + 1;
        
end
    
images_nonface = images_nonface';
for i=1:8
    
    subplot(2,4,i);
    
    I = reshape(images_nonface(:,i),112,92);
    imshow(I,[min(images_nonface(:,i)),max(images_nonface(:,i))])
end
pause;
end