function [t_pred, accuracy] = Decision_Tree(X_train,t_train,X_test,t_test)

Mdl = fitctree(X_train',t_train);
t_pred = predict(Mdl,X_test');

sum = 0;

for i=1:length(t_test)
    if t_pred(i) == t_test(i)
        sum = sum+1;
    end
end

t_pred = t_pred';
accuracy = sum/length(t_test);