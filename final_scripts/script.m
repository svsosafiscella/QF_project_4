% 1) Read the input data

disp('Reading data...')
[images,labels] = read_data(40,10);
disp('Data read!')

% 2) Perform dimensionality reduction by using PCA. Plot some PCAs and 
%    reconstructed images

disp('Performing PCA...')
[P,s,X_new,per] = pca_display(images,400);
disp('PCA finished!')

% 3) We use only the first 110 first principal components

X_reduc = X_new(1:110,:);

% 3) Separate the dataset into training and testing

[X_train, X_test, t_train, t_test] = train_test_split(X_reduc, labels);

% 4) Perform the classification using the output from PCA and a Linear
%    Regressor Classifier

disp('Performing LR Classification...')
[t_pred, accuracy] = Linear_Regression(X_train,t_train,X_test,t_test,2);
disp('Classification finished!')








