 

function [F,xf,W] = ftr(xt,t,T)

    F= linspace(-(2*T),(2*T),1000);

    W = 1/(2*T);

    xf=zeros(size(F));

    dt= t(2) -t(1);

    for k = 1:length(F)
        
        xf(k)= sum(xt.*exp(-1j*2*pi*F(k)*t))*dt;
    end
end