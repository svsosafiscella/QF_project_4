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

images2 = images - mean(images,2)*ones(1,size(images,2));
X_reduc = transpose(P(:,1:110))*images2;

images_nonface2 = images_nonface - mean(images,2)*ones(1,size(images_nonface,2));
X_reduc_nonface = transpose(P2(:,1:110))*images_nonface2;

% 4) Separate the dataset into training and testing

[X_train, X_test, t_train, t_test] = train_test_split(X_reduc, labels);
[X_train_nonface, X_test_nonface, t_train_nonface, t_test_nonface] = train_test_split_nonface(X_reduc_nonface, labels_nonface);

% 4) Perform the classification using the output from PCA and a Linear
%    Regressor Classifier

X_train2 = [X_train X_train_nonface];
X_test2 = [X_test X_test_nonface];
t_train2 = [ones(280,1);ones(20,1)*2];
t_test2 = [ones(120,1);ones(10,1)*2];

disp('Performing LR Classification Identification...')
[t_pred, accuracy] = Linear_Regression(X_train,t_train,X_test,t_test,9);
disp('Classification Identification Finished!')

disp('Performing LR Classification Recognition...')
[t_pred2, accuracy2] = Linear_Regression(X_train2,t_train2,X_test2,t_test2,2);
disp(accuracy2);
disp('Classification Recognition Finished!')

disp('Performing DT Classification Identification...')
[t_pred3, accuracy3] = Decision_Tree(X_train,t_train,X_test,t_test);
disp(accuracy3);
disp('Classification Recognition Finished!')

disp('Performing DT Classification Recognition...')
[t_pred4, accuracy4] = Decision_Tree(X_train2,t_train2,X_test2,t_test2);
disp(accuracy4);
disp('Classification Recognition Finished!')



