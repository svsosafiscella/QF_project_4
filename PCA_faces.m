function [P, s, X_new, per] = PCA_faces(data, type)
    
%
% INPUT
%
% - data: data matrix with N samples of the vector x with p variables
% - option: 1 = eigen-decomposition, 2 = SVD
%
% OUTPUT
%
% - P: (transpose of the) change of basis matrix that transforms X to Y
%      The rows of P are the principal components of X.
% - Y: data matrix in the new basis
%

% 1) Substract the mean from each column of X.
%    This is important in order to re-center the new axes.

[feature_n, sample_n] = size(data);
data = data - mean(data,2)*ones(1,sample_n);

% 2) If option = 1, calculate the eigen-decomposition of data * data^T

if type==1

    % calculate the covariance matrix
    var_data = data*data'./(sample_n-1);
    
    % The eig function returns diagonal matrix D of eigenvalues and matrix V
    % whose columns are the corresponding right eigenvectors
    [U,D] = eig(var_data);
    s = diag(D);
    
    [s, idx] = sort(s,'descend');
    tv = sum(s);
    U = U(:,idx);
    
    for i=1:length(s)
        per(i) = s(i)/tv;
        tper(i) = sum(per(1:i));
    end
    
    P=U;
    plot(tper,'o');
    xlabel('PC Index'); 
    ylabel('Percentage of variance');
    
% 3) If option = 2, calculate the SVD of XX^T
    
elseif type==2
    % calculate pc's
    data_n = data/sqrt(sample_n-1);
    [U,S,V] = svd(data_n);
    
    s = diag(S);
    tv = sum(s.^2);
    
    for i=1:length(s)
        per(i) = s(i)^2/tv;
        tper(i) = sum(per(1:i));
        
    end
    
    P = U;
    plot(tper,'o')
    xlabel('PC Index'); 
    ylabel('Percentage of variance');
    pause;
       
end

X_new = transpose(P)*data;

end