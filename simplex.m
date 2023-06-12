clc
clear all
format short
%max = 3x1+9x2
%2x1+4x2<=5
%3x1+7x2<=8
%4x1+3x2<=9
A=[2 4 ; 3 7 ; 4 3 ]
a=[2 4 1 0 0 5; 3 7 0 1 0 8; 4 3 0 0 1 9]
C=[3 9 0 0 0 0] %Three 0 for s and one for b
b=[5 8 9]
n=size(A,2)
m=size(A,1)
bv=n+1:n+m
abc=1
while(abc==1)
    bv_cost=C(bv)
    zj=bv_cost*a
    zj_cj=zj-C
    ZC=zj_cj(1,1:end-1)
    if any(ZC<0)
        [mi,ec]=min(ZC) % mi for minimum val and ec for entering column
        pc=a(:,ec) %pc is for pivot column
        b1=a(:,end)
        ratio=b1./pc %./ is for elementary division
        ratio(find(pc<0))=nan %can be either nan or inf
        [mi2, lr]=min(ratio) %lr is for leaving row
        bv(lr)=ec
        pe=a(lr,ec) %pe is for pivot element
        a(lr,:)=a(lr,:)/pe
        for i=1:size(a,1)
            if i~=lr %not equal to
                a(i,:)=a(i,:)-a(lr,:)*a(i,ec)
                zj_cj(1,:)=zj_cj(1,:)-a(lr,:)-a(i,ec)
            end
        end
    else
        disp('opt')
   
    abc=2
    end
end