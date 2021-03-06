% 1) Read the input data

disp('Reading data...')
[images,labels] = read_data(40,10);
[images_nonface,labels_nonface] = read_data_nonface(30);
disp('Data read!')

% 2) Perform principal component analysis.

disp('Performing PCA...')
[P,s,X_new,per] = PCA_faces(images, 2);
[P2,s2,X_new2,per2] = PCA_faces(images_nonface, 2);
disp('PCA finished!')

%  Plot some PCAs and reconstructed images

pca_display(images, P, X_new);

% 3)  Perform dimensionality reduction. We use only the first
%     110 first principal components

[X_reduc] = dim_reduc(images,P,110);
[X_reduc_nonface] = dim_reduc(images_nonface,P2,110);

% 4) Separate the dataset into training and testing

% For face identification, we will use 8 images from each of the 40
% subjects for training, and the remaining 2 images for testing.

[X_train_id, X_test_id, t_train_id, t_test_id] = train_test_split_identification(X_reduc, labels);

% For face recognition, we will use 8 images from the first 35 subjects for
% training, and for testing we will use the remaining 2 images of those 35
% subects, and the 10 images of the remaining 5 subjects.

[X_train, X_test, t_train, t_test] = train_test_split(X_reduc, labels,35,8);

% We will also use some non-face images for training and testing

[X_train_nonface, X_test_nonface, t_train_nonface, t_test_nonface] = train_test_split_nonface(X_reduc_nonface, labels_nonface);

% 4) Perform the classification using the output from PCA and a Linear
%    Regressor Classifier

X_train2 = [X_train X_train_nonface];
X_test2 = [X_test X_test_nonface];
t_train2 = [ones(280,1);ones(20,1)*2];
t_test2 = [ones(120,1);ones(10,1)*2];

disp('Performing LR Classification Identification...')
[t_pred, accuracy] = Linear_Regression(X_train_id,t_train_id,X_test_id,t_test_id,1);
disp("LR Classification Identification Accuracy: " + accuracy);
disp('Classification Identification Finished!')

disp('Performing LR Classification Recognition...')
[t_pred2, accuracy2] = Linear_Regression(X_train2,t_train2,X_test2,t_test2,2);
disp("LR Classification Recognition Accuracy: " + accuracy2);
disp('Classification Recognition Finished!')

disp('Performing DT Classification Identification...')
[t_pred3, accuracy3] = Decision_Tree(X_train_id,t_train_id,X_test_id,t_test_id);
disp("DT Classification Identification Accuracy: " + accuracy3);
disp('Classification Identification Finished!')

disp('Performing DT Classification Recognition...')
[t_pred4, accuracy4] = Decision_Tree(X_train2,t_train2,X_test2,t_test2);
disp("DT Classification Recognition Accuracy: " + accuracy4);
disp('Classification Recognition Finished!')



