function pca_display(images, P, X_new)

% Plot the mean

m = mean(images,2);
I = reshape(m,112,92);
imshow(I,[min(m),max(m)]);
title('mean')

pause;

% Display the first 5 eigenfaces

for i=1:5
    
    subplot(1,5,i);
    
    I = reshape(P(:,i),112,92);
    imshow(I,[min(P(:,i)),max(P(:,i))])

end

pause;

% Display reconstructed images, using different numbers of eigenfaces

k = 1;
for n=[10,55,110,325]

    y = P(:,1:n)*X_new(1:n,:) + m*ones(1,size(images,2));

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
    I = reshape(images(:,i),112,92);
    imshow(I,[min(images(:,i)),max(images(:,i))]);
    title('Original');

end

pause;

end
