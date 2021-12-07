function [P,s,Y,per] = PCA(X,option)

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

X = X - repmat(X_mean,1,N);

% 3) If option = 1, calculate the eigen-decomposition of XX^T

if option == 1
% The eig function returns diagonal matrix D of eigenvalues and matrix V
% whose columns are the corresponding right eigenvectors

    cov_matrix = X*X'./(N-1);
    [V, D] = eig(cov_matrix);
    
    [s, index] = sort(diag(D),'descend');
    tv = sum(s);
    V = V(:,index);
    
    for i=1:length(s)
        per(i) = s(i)/tv;
        tper(i) = sum(per(1:i));
    end
    
    Y = V*X;
    P = V;
    plot(tper,'o');
    pause;
    
% 4) If option = 2, calculate the SVD of XX^T
    
elseif option == 2
    
% [U,S,V] = svd(A) performs a singular value decomposition of matrix A,
% such that A = U*S*V'. 
    
    [U,S,V] = svd(X/sqrt(N-1));
    
    s = diag(S);
    tv = sum(s.^2);
    
    for i=length(s)
        per(i) = s(i)^2/tv;
        tper(i) = sum(per(1,i));
    end
    
    P = U;
    plot(tper,'o')
    pause;
    
    Y = U*X;
    
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

imshow((reshape(X_mean,28,28))',[min(X_mean),max(X_mean)])
pause;

end

