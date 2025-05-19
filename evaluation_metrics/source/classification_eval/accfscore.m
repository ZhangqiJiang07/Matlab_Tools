function [acc,F1] = accfscore(Ycalculate,Ytest)
%����ǩ�ľ�׼��
%�˴���ʾ��ϸ˵��
k=0;
for i=1:size(Ycalculate,1)
    if Ycalculate(i)==Ytest(i)
        k=k+1;
    end
end
acc=k/size(Ycalculate,1);
N=size(Ytest,1);
class = max(Ytest);
for i=1:class
    %�Լ����F-score ����
    %P׼ȷ��  R�ٻ���
    t1=0;t2=0;t3=0;
    for n=1:N
        if Ycalculate(n)==i
            t1=t1+1;
            if Ytest(n)==i
                t2=t2+1;
            end
        else
            if Ytest(n)==i
                t3=t3+1;
            end
        end
    end
    P(i)=t2/max(t1,1e-5);R(i)=t2/(t2+t3);%����NAN
    F(i)=2*P(i)*R(i)/max(P(i)+R(i),1e-5);
end
F1=mean(F);
end
