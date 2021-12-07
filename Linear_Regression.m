function t_test = Linear_Regression(X_train,t_train,X_test,p)

% Classification with linear regression

n_train = length(t_train);         % Number of training samples
n_class = length(unique(t_train)); % Number of different classes
Y = zeros(n_class, n_train);

for i=1:n_train
    Y(t_train(i),i)=1;
end

% Basis expansion
X = poly_expand(X_train,p);
W = Y*X'*inv(X*X');

% Classification on test data
X_test = poly_expand(X_test,p);
Y_test = W*X_test;

n_test = size(X_test,2);           % Number of testint samples
t_test = zeros(1,n_test);          % Output labels
for i=1:n_test
    [c, idx] = max(Y_test(:,i));
    t_test(i) = idx;
end