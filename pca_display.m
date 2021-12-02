function [P,s,X_new,per] = pca_display(num)

disp('Reading data...')
[images,labels] = read_data(40,10);
disp('Data read!')

img1 = images(:,1:num);

m = mean(img1,2);
I = reshape(m,112,92);
imshow(I,[min(m),max(m)]);
title('mean')

pause;

disp('Applying PCA...')
[P, s, X_new, per] = PCA_faces(img1, 2);
disp('PCA finished!')

% Display the first 5 eigenfaces

for i=1:5
    
    subplot(1,5,i);
    
    I = reshape(P(:,i),112,92);
    imshow(I,[min(P(:,i)),max(P(:,i))])

end

% Display reconstructed images, using different numbers of eigenfaces

k = 1;
for n=[10,55,110,325]

    y = P(:,1:n)*X_new(1:n,:) + m*ones(1,size(img1,2));

    for i=1:10:41

        subplot(5,5,k);
        k = k + 1;
        I = reshape(y(:,i),112,92);
        imshow(I,[min(y(:,i)),max(y(:,i))]);
        title(strcat(string(n), ' PCs'))

    end

end

for i=1:10:41
    
    subplot(5,5,k);
    k = k + 1;
    I = reshape(img1(:,i),112,92);
    imshow(I,[min(img1(:,i)),max(img1(:,i))]);
    title('Original');
    
end

pause;

end