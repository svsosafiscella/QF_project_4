function [X_train, X_test, t_train, t_test] = train_test_split_nonface(data, labels)

n_feature = size(data,1);

n_images = 30;

n_train_images = 20;

X_train = zeros(n_train_images , n_feature);
t_train = zeros(n_train_images , 1);

X_test = zeros(n_images - n_train_images, n_feature);
t_test = zeros(n_images - n_train_images, 1);

idx = 1;
idx_train = 1;
idx_test = 1;

for image=1:n_images

    if image <= n_train_images

        X_train(idx_train,:) = data(:,idx);
        t_train(idx_train) = labels(2);
        idx = idx + 1;
        idx_train = idx_train + 1;

    else

        X_test(idx_test,:) = data(:,idx);
        t_test(idx_test) = labels(2);
        idx = idx + 1;
        idx_test = idx_test + 1;

    end

end
    
X_test = X_test';
X_train = X_train';

end
            
