format long g;

%initialize values
counter = 1;
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
    EH1 = (x(1)*w(1))+(x(2)*w(3))+w(5); %error node 1
    AH1 = 1/(1-exp(-EH1)); %activation node 1
    EH2 = (x(1)*w(2))+(x(2)*w(4))+w(6); %error node 2
    AH2 = 1/(1-exp(-EH2)); %activation node 2
    EHO1 = (AH1*w(7))+(AH2*w(9))+w(11); %error output 1
    AHO1 = 1/(1-exp(-EHO1)); %activation output 1
    EHO2 = (AH1*w(8))+(AH2*w(10))+w(12); %error output 2
    AHO2 = 1/(1-exp(-EHO2)); %activation output 2
    ET = .5*((y(1)-AHO1)^2+(y(2)-AHO2)^2) %error total
    
    if ET > 1e-6
    %back propagation
    %partial derivatives with respect to weights
        counter = counter+1;
        dw1 = ;
        dw2 = ;
        dw3 = ;
        dw4 = ;
        dw5 = ;
        dw6 = ;
        dw7 = -(y(1)-AHO1)*AHO1*(1-AHO1)*AHO1;
        dw8 =  -(y(2)-AHO2)*AHO2*(1-AHO2)*AHO2;
        dw9 = -(y(1)-AHO1)*AHO1*(1-AHO1)*AHO2;
        dw10 = -(y(2)-AHO2)*AHO2*(1-AHO2)*AHO2;
        dw11 = -(y(1)-AHO1)*AHO1*(1-AHO1); %times b which is equal to 1
        dw12 = -(y(2)-AHO2)*AHO2*(1-AHO2); %times b which is equal to 1
    else
        break;
    end


end





