function [ExampleKernel] = ExampleKernel()
%%%%% Example of a user defined kernel (normal distribution) %%%%%
% The following code construct the density function for the dynamical model
% x1(k+1) = x1(k)[0.5 x1(k) + 0.3 x2(k) + u(k)] + eta1(k),
% x2(k+1) = x1(k) + 0.2 x2(k) + 2 u(k) + eta2(k);
% where eta1 and eta2 are normally distributed with N(0,0.5).

dim = 4;   % Write here the dimension of the model
dim_u = 1;  % Write here the dimension of the input

%%%%%%%%%%% Creation of the symbolic variables %%%%%%%%%%
% The following lines create the symbolic variables.
% It is not necessary to change anything in these lines.
x='';
xbar='';
for i=1:dim
    eval(['syms',' ','x',num2str(i),' ','real']);
    eval(['syms',' ','x',num2str(i),'bar ','real']);
    x=[x,'x',num2str(i),' '];
    xbar=[xbar,'x',num2str(i),'bar '];
end
if x(end)==' '
    x=x(1:end-1);
end
if xbar(end)==' '
    xbar=xbar(1:end-1);
end

u='';
for i=1:dim_u
    eval(['syms',' ','u',num2str(i),' ','real'])
    u=[u,'u',num2str(i),' '];
end
if u(end)==' '
    u=u(1:end-1);
end

% Creation of the matrices of symbolic variables
% These are vectors of the variables x, xbar and u
x_vec = eval(['[',x,']','''']);
xbar_vec = eval(['[',xbar,']','''']);
u_vec = eval(['[',u,']','''']);

%%%%%%%%%%% Defining density function %%%%%%%%%%
A = [0.6682, 0.0, 0.02632, 0.0; 0.0, 0.6830, 0.0, 0.02096; 1.0005, 0.0,  -0.000499, 0.0; 0.0, 0.8004, 0.0, 0.1996];
B = [0.1320; 0.1402; 0.0; 0.0];
Sigma = 0.2*eye(dim);

% vectorized manipulation
E_xbar = A*x_vec + B*u_vec;

% element-wise manipulation
E_xbar(1) = E_xbar(1)*x1;
E_xbar(2) = E_xbar(2)*x2;
E_xbar(3) = E_xbar(3)*x3;
E_xbar(4) = E_xbar(4)*x4;

% Normal density function
mat=-0.5*(xbar_vec-E_xbar)'*Sigma^(-1)*(xbar_vec-E_xbar);
ExampleKernel=sqrt((2*pi)^dim*det(Sigma))^-1*exp(mat);

%%%%%%%%% Finalization of the kernel %%%%%%%%%%%%
% Finally the next line ensures the correct order of variables and makes
% it applicable to FAUST2.

ExampleKernel=eval(['matlabFunction(ExampleKernel,''vars'',[',x,' ',xbar,' ',u,'])']);

end % End of the function