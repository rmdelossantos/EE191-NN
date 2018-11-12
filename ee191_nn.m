format long g;

%initialize values
x = [.05;.1];
y = [.01,.99];
eta = .5;
w = [.15;.2;.25;.3;.35;.35;.4;.45;.5;.55;.6;.6];
ET = 10;
%bias = 1
counter = 1;
%NN Loop
while (ET) > 1e-6
    %feed forward
    EH1 = (x(1)*w(1))+(x(2)*w(3))+w(5);
    AH1 = 1/(1-exp(-EH1));
    EH2 = (x(1)*w(2))+(x(2)*w(4))+w(6);
    AH2 = 1/(1-exp(-EH2));
    EHO1 = (AH1*w(7))+(AH2*w(9))+w(11);
    AHO1 = 1/(1-exp(-EHO1));
    EHO2 = (AH1*w(8))+(AH2*w(10))+w(12);
    AHO2 = 1/(1-exp(-EHO2));
    ET = .5*((y(1)-AHO1)^2+(y(2)-AHO2)^2)
    
    if ET > 1e-6
    %back propagation
    else
        break;
    end


end





