function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


h = sigmoid(X*theta);
a = y.*log(h); 
b = (1 .- y).*log(1 .- h);
a = a.+b;

c = theta;
c(1,1) = 0;
d = c.^2;
d = sum(d)*lambda/(2*m);
J = -sum(a);
J = J/m;
J = J + d;

tmp = h - y;
tmp = X'*tmp;
c = lambda*c;
tmp = tmp + c;
grad = tmp ./ m;





% =============================================================

end
