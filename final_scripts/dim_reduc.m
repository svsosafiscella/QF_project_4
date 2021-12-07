function [X_reduc] = dim_reduc(images,P,n)

images2 = images - mean(images,2)*ones(1,size(images,2));
X_reduc = transpose(P(:,1:n))*images2;