function [images,labels] = read_data(n_subjects, n_images)

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

images = zeros(n_subjects*n_images , 112*92);
labels = zeros(n_subjects*n_images , 1);

idx = 1;

for subject=1:n_subjects
    
    for img=1:n_images

        file = strcat('./att_faces/s',string(subject),'/',string(img),'.pgm');
        fid = imread(file,'pgm');

        images(idx,:) = reshape(fid,[1,112*92]);
        labels(idx) = subject;
        
        idx = idx + 1;
        
    end
    
end

images = images';
