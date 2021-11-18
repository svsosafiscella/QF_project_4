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
X_2 = X - repmat(X_mean,1,2);

% 3) If option = 1, calculate the eigen-decomposition of XX^T

if option == 1
% The eig function returns diagonal matrix D of eigenvalues and matrix V
% whose columns are the corresponding right eigenvectors

    [V,D] = eig(X*transpose(X));

    Y = V*X;
    P = transpose(V);
    
end

end

