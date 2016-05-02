function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

m = size(X,1);

% You need to return the following variables correctly.
idx = ones(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
tmp = zeros(size(X,1), 1);

for i = 1 : K;
  dif = zeros(size(X ,1), size(X,2));
  for j = 1 : m;
    for k = 1 : size(X,2)
      dif(j,k) = X(j,k) - centroids(i,k);
    end;
  end;
  %disp(dif);
  dif = dif .^2;
  dif = sum(dif, 2);
  if i == 1;  
    tmp = dif;
  else
    for j = 1 : m;
      if tmp(j) > dif(j);
        tmp(j) = dif(j);
        idx(j) = i;
      end;
    end;  
  end;  
end;






% =============================================================

end

