% Define the problem
A = [1 1; 1 3; 1 -1];
b = [2; 3 ;1];
c = [3 ;2];

% Convert the problem to standard form
[m, n] = size(A);
c = [c; zeros(m, 1)];
A = [A eye(m)];
B = n+1:n+m;

% Phase 1
c_ = [zeros(n,1); ones(m,1)];
x = linprog(c_,[],[],A,b,zeros(n+m,1));
if any(abs(A*x-b) > 1e-6)
    error('Infeasible problem');
end

% Phase 2
c_ = c;
x = linprog(c_,[],[],A,b,zeros(n+m,1),[],[],optimoptions('linprog','Display','none'));
x_opt = x(1:n);
