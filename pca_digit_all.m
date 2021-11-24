function [P,s,X_new,per,m] = pca_digit_all(num)

[img, label] = read_hw;

img1 = img(:,1:num);

[P, s, X_new, per] = PCA(img1,1);

for i=1:5
    
    subplot(1,5,i);
    
    imshow((reshape(P(:,i),28,28))',[min(P(:,i)),max(P(:,i))]);
    
end

end