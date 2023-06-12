%%          D1  D2  D3  Supply
%% S1       2   4   5   4
%% S2       4   3   3   8
%% S3       5   1   7   5
%% S4       1   4   6   12
%% Demand   6   8   10

%Balanced Problem
cost = [2 4 5; 4 3 3; 5 1 7; 1 4 6];
supply = [4 8 5 12];
demand = [6 8 15];
[m,n] = size(cost);
if sum(supply)==sum(demand)
    disp('balanced problem'                                                                                                                                                                   )
elseif sum(supply)<sum(demand)
    cost = [cost;zeros(1,n)];
    supply = [supply (sum(demand)-sum(supply))];
elseif sum(supply)>sum(demand)
    cost = [cost zeros(m,1)];
    demand = [demand (sum(supply)-sum(demand))];
end
a_cost=cost
[m,n]=size(cost)
allo_m=zeros(m,n)
while any(supply>0) 
min_c = min(min(cost));
[row,col] = find(cost==min_c);
z = min(supply(row), demand(col));
[allo, index] = max(z);
supply(row(index)) = supply(row(index))-allo;
demand(col(index)) = demand(col(index))-allo;
cost(row(index),col(index))=inf
allo_m(row(index),col(index))=allo
end 
cost_mat=a_cost.*allo_m
total_cost=sum(sum(cost_mat))