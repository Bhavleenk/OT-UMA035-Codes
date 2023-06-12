M=1000
A=[1 3;1 1]
a=[1 3 -1 0 1 0; 1 1 0 -1 0 1]
C=-([3 5 0 0 M M 0])
cc=a
b=[3 2]'
a=[a b]
n=size(A,2)
m=size(A,1)
bv=[5 6]
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