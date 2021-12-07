% 1) Read the input data

disp('Reading data...')
[images,labels] = read_data(40,10);
[images_nonface,labels_nonface] = read_data_nonface(30);
disp('Data read!')

% 2) Perform dimensionality reduction by using PCA. Plot some PCAs and 
%    reconstructed images

disp('Performing PCA...')
[P,s,X_new,per,m] = pca_display(images,400);
[P2,s2,X_new2,per2,m2] = pca_display(images_nonface,30);
disp('PCA finished!')

% 3) We use only the first 110 first principal components

%X_reduc = X_new(1:110,:);

%Y = P(:,1:110)*X_new(1:110,:) + m*ones(1,size(images,2));

% 3) Separate the dataset into training and testing

[X_train, X_test, t_train, t_test] = train_test_split(X_new, labels);
[X_train_nonface, X_test_nonface, t_train_nonface, t_test_nonface] = train_test_split_nonface(X_new2, labels_nonface);
% 4) Perform the classification using the output from PCA and a Linear
%    Regressor Classifier

X_train2 = [X_train X_train_nonface];
X_test2 = [X_test X_test_nonface];
t_train2 = [ones(280,1);ones(20,1)*2];
t_test2 = [ones(120,1);ones(10,1)*2];

disp('Performing LR Classification Identification...')
for p=1:20
    [t_pred, accuracy] = Linear_Regression(X_train,t_train,X_test,t_test,p);
    disp(accuracy);
end
disp('Classification Identification Finished!')

disp('Performing LR Classification Recognition...')
[t_pred2, accuracy2] = Linear_Regression_Recognition(X_train2,t_train2,X_test2,t_test2,2);
disp(accuracy2);
disp('Classification Recognition Finished!')





