function [P,s,X_new,per,m] = pca_display(num)

[images,labels] = read_data(40,10);

img1 = images(:,1:num);

[P, s, X_new, per] = PCA_faces(img1, 1);

