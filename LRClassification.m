function testlabel = LRClassification(traindata,trainlabel,testdata,p)

% Linear regression for indicator matrix
% Y indicator matrix: k by N

ntrain = length(trainlabel);
nclass = length(unique(trainlabel));
Y = zeros(nclass, ntrain);
for i=1:ntrain
    Y(trainlabel(i),i)=1;
end

% basis expansion
X = poly_expand(traindata,p);
W = Y*X'*inv(X*X')

% classification on testdata
Xtest = poly_expand(testdata,p);
Ytest = W*Xtest;

ntest = size(testdata,2);
testlabel = zeros(1,ntest);
for i=1:ntest
    [c, idx] = max(Ytest(:,i));
    testlabel(i) = idx;
end