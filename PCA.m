function [P,Y] = PCA(X,option)

%
% INPUT
%
% - X: data matrix with N samples of the vector x with p variables
% - option: 1 = eigen-decomposition, 2 = SVD
%
% OUTPUT
%
% - P: (transpose of the) change of basis matrix that transforms X to Y
%      The rows of P are the principal components of X.
% - Y: data matrix in the new basis
%

p = size(X,1); % number of rows of the data matrix
N = size(X,2); % number of columns of the data matrix

% 1) Obtain the mean

X_mean = 1/N * sum(X,2);

% 2) Substract the mean from each column of X

X_2 = X - repmat(X_mean,1,N);

% 3) If option = 1, calculate the eigen-decomposition of XX^T

if option == 1
% The eig function returns diagonal matrix D of eigenvalues and matrix V
% whose columns are the corresponding right eigenvectors

    [V, D] = eig(X_2*transpose(X_2));

    Y = V*X;
    P = transpose(V);
    
% 4) If option = 2, calculate the SVD of XX^T
    
elseif option == 2
    
% [U,S,V] = svd(A) performs a singular value decomposition of matrix A,
% such that A = U*S*V'. 

    [U, S, V] = svd(X);

    Y = U*X;
    P = transpose(U);
    
else
    
    disp("The option must be equal to 1 (eigendecomposition) or 2 (SVD)")      
    
end

%	subplot(2,2,1), imshow(transpose(reshape(X_mean,[28,28])),[])
%	title ('Mean Image')		
    
%    imageY = Y';
%	subplot(2,2,2), imshow(transpose(reshape(imageY(1,:),[28,28])),[])
%	title ('Y Image')
    
%    imageYP = Y'*P;
%	subplot(2,2,3), imshow(transpose(reshape(imageYP(1,:),[28,28])),[])
%	title ('YP Image')
    
%    imageYP2 = Y'*P';
%	subplot(2,2,4), imshow(transpose(reshape(imageYP2(1,:),[28,28])),[])
%	title ('YP2 Image')

    disp(size(P))
    
    subplot(1,5,1), imshow(transpose(reshape(P(1,:),[28,28])),[min(P(1,:)),max(P(2,:))]) % scale using the min and max of P
    subplot(1,5,2), imshow(transpose(reshape(P(2,:),[28,28])),[])
    subplot(1,5,3), imshow(transpose(reshape(P(3,:),[28,28])),[])
    subplot(1,5,4), imshow(transpose(reshape(P(4,:),[28,28])),[])
    subplot(1,5,5), imshow(transpose(reshape(P(5,:),[28,28])),[])
    
end

