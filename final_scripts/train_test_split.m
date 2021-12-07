function [X_train, X_test, t_train, t_test] = train_test_split(data, labels, n_train_subjects, n_train_images)

% Function for separating the dataset of face images into training and
% testing
%
% INPUT
%  - data : pxn matrix with the face images
%  - labels : nx1 array with the labels
%  - n_train_subjects : how many of the subjects will be used for training
%  - n_train_images : how many of the images of the train subject will be
%                     used for training
%

n_feature = size(data,1);
n_subjects = 40;
n_images = 10;

X_train = zeros(n_train_subjects*n_train_images , n_feature);
t_train = zeros(n_train_subjects*n_train_images , 1);

k = (n_subjects - n_train_subjects) * n_images + n_train_subjects * (n_images - n_train_images);
X_test = zeros(k, n_feature);
t_test = zeros(k, 1);

idx = 1;
idx_train = 1;
idx_test = 1;

for subject=1:n_subjects
    
    for image=1:n_images
        
        if subject <= n_train_subjects && image <= n_train_images
            
            X_train(idx_train,:) = data(:,idx);
            t_train(idx_train) = labels(idx);
            idx = idx + 1;
            idx_train = idx_train + 1;
            
        else
            
            X_test(idx_test,:) = data(:,idx);
            t_test(idx_test) = labels(idx);
            idx = idx + 1;
            idx_test = idx_test + 1;
            
        end
        
    end
    
end

X_test = X_test';
X_train = X_train';

end
            
