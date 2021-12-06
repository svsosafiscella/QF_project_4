function [P,s,X_new,per,m] = pca_display(images,num)

% Selection the portion of the data you want to use

img1 = images(:,1:num);

% Plot the mean

m = mean(img1,2);
I = reshape(m,112,92);
imshow(I,[min(m),max(m)]);
title('mean')

pause;

% Perform dimensionality reduction using PCA

[P, s, X_new, per] = PCA_faces(img1, 1);

% Display the first 5 eigenfaces

for i=1:5
    
    subplot(1,5,i);
    
    I = reshape(P(:,i),112,92);
    imshow(I,[min(P(:,i)),max(P(:,i))])

end

pause;

end

