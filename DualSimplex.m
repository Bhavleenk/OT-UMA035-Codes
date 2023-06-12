clear all
clc


a = [-1 -3;-1 -1];
b = [-3;-2];
c = [-3 -5 0 0 0];
m = size(a,1);
n = size(a,2);
id = eye(2);
A = [a,id];
As = [A b];
bv = n+1 : n+m;
abc = 1;
while(abc == 1)
bv_cost = c(bv);
zj = bv_cost*As;
zjcj = zj-c;
b1 = As(:,end);
if any(b1<0)
    [minb,lr] = min(b1);
    pr = As(lr,:);
    for i = 1:size(As,2)-1
        if pr(i)<0
            ratio(i) = zjcj(i)/pr(i);
        else 
            ratio(i) = -inf;
        end
        [mir,ec] = max(ratio);
        bv(lr) = ec;
    end
    pe = As(lr,ec);
    As(lr,:) = As(lr,:)/pe;
    for i=1:size(As,1)
        if i~=lr
            As(i,:) = As(i,:)-As(lr,:)*As(i,ec);
        end
    end
    zjcj(1,:) = zjcj(1,:)-As(lr,:)*zjcj(1,ec)
else
    abc = 2;
    disp('optimal solution');
    break
end
end