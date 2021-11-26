function [P,s,X_new,per,m] = pca_digit(idx)

[img, label] = read_hw;

n = 1;
for i=1:size(label)
    
    if label(i) == idx
        
        img1(:,n) = img(:,i);
        n = n + 1;
     
    end
    
end

disp('Number of images')
disp(size(img1,2))

[P, s, X_new, per] = pca_class(img1,2);
m = mean(img1,2);

I = reshape(m,28,28);
I = I';
imshow(I,[min(m),max(m)]);

pause;

for i=1:5
    
    subplot(1,5,i);
    
    I = reshape(P(:,i),28,28);
    I = I';
    imshow(I,[min(P(:,i)),max(P(:,i))]);
end

pause;

y = P(:,1:100)*X_new(1:100,:) + m*ones(1,size(img1,2));

for i=1:5
    
    subplot(2,5,i);
    
    I = reshape(y(:,i),28,28);
    I = I';
    imshow(I);%,[min(P(i,:)),max(P(i,:))]);
    
    subplot(2,5,i+5);
    I = reshape(img1(:,i),28,28);
    I = I';
    imshow(I);
end

pause;

y = P(:,1:500)*X_new(1:500,:) + m*ones(1,size(img1,2));

for i=1:5
    
    subplot(2,5,i);
    
    I = reshape(y(:,i),28,28);
    I = I';
    imshow(I);
    
end

end
    