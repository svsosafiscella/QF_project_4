function accuracy = Kmeans_Recognition(X_train, X_test)

[idx, C] = kmeans(X_train', 2);

[~,idx_test] = pdist2(C, X_test', 'euclidean' , 'Smallest' ,1);

flagSum = 0;

for i=1:length(idx)
   if idx(i) == 1
       flagSum = flagSum + 1;
   end
end

if flagSum > length(idx)/2
    flag = 1;
else
    flag = 2;
end

sum = 0;

for i=1:length(idx_test)
   if idx_test(i) == flag
       sum = sum + 1;
   end
end

accuracy = sum / length(idx_test);
disp(accuracy);