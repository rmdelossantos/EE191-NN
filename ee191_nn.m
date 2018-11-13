format long g;
%Delos Santos, Russ M. 
%Matibag, Dexter Jed.
%initialize values
counter = 1;
x = [.05;.1];
y = [.01;.99];
eta = .5;
w = [.15;.2;.25;.3;.35;.35;.4;.45;.5;.55;.6;.6];
ET = 10;
%bias = .5
counter = 1;
array = [0,0];
%NN Loop
while ET > 1e-6
    %feed forward
    EH1 = (x(1)*w(1))+(x(2)*w(3))+w(5); %error node 1
    AH1 = 1/(1-exp(-EH1)); %activation node 1
    EH2 = (x(1)*w(2))+(x(2)*w(4))+w(6); %error node 2
    AH2 = 1/(1-exp(-EH2)); %activation node 2
    EO1 = (AH1*w(7))+(AH2*w(9))+w(11); %error output 1
    AO1 = 1/(1-exp(-EO1)); %activation output 1
    EO2 = (AH1*w(8))+(AH2*w(10))+w(12); %error output 2
    AO2 = 1/(1-exp(-EO2)); %activation output 2
    ET = .5*(((y(1)-AO1)^2)+((y(2)-AO2)^2)) %error total
    
    if ET > 1e-6
    %back propagation - update values
    %partial derivatives with respect to weights
        array(counter,1) = counter;
        array(counter,2) = ET;
        counter = counter+1;
        dw1 = (((-(y(1)-AO1))*AO1*(1-AO1)*w(7)) +(-(y(2)-AO2)*AO2*(1-AO2)*w(8)))*AH1*(1-AH1)*x(1);
        dw2 = (((-(y(1)-AO1))*AO1*(1-AO1)*w(9)) +(-(y(2)-AO2)*AO2*(1-AO2)*w(10)))*AH2*(1-AH2)*x(1);
        dw3 = (((-(y(1)-AO1))*AO1*(1-AO1)*w(7)) +(-(y(2)-AO2)*AO2*(1-AO2)*w(8)))*AH1*(1-AH1)*x(2);
        dw4 = (((-(y(1)-AO1))*AO1*(1-AO1)*w(9)) +(-(y(2)-AO2)*AO2*(1-AO2)*w(10)))*AH2*(1-AH2)*x(2);
        dw5 = (((-(y(1)-AO1))*AO1*(1-AO1)*w(7)) +(-(y(2)-AO2)*AO2*(1-AO2)*w(8)))*AH1*(1-AH1);
        dw6 = (((-(y(1)-AO1))*AO1*(1-AO1)*w(9)) +(-(y(2)-AO2)*AO2*(1-AO2)*w(10)))*AH2*(1-AH2);
        dw7 = -(y(1)-AO1)*AO1*(1-AO1)*AH1;
        dw8 =  -(y(2)-AO2)*AO2*(1-AO2)*AH1;
        dw9 = -(y(1)-AO1)*AO1*(1-AO1)*AH2;
        dw10 = -(y(2)-AO2)*AO2*(1-AO2)*AH2;
        dw11 = -(y(1)-AO1)*AO1*(1-AO1); %times b which is equal to .5
        dw12 = -(y(2)-AO2)*AO2*(1-AO2); %times b which is equal to .5
        %update values
        w(1) = w(1)-(eta*dw1);
        w(2) = w(2)-(eta*dw2);
        w(3) = w(3)-(eta*dw3);
        w(4) = w(4)-(eta*dw4);
        w(5) = w(5)-(eta*dw5);
        w(6) = w(6)-(eta*dw6);
        w(7) = w(7)-(eta*dw7);
        w(8) = w(8)-(eta*dw8);
        w(9) = w(9)-(eta*dw9);
        w(10) = w(10)-(eta*dw10);
        w(11) = w(11)-(eta*dw11);
        w(12) = w(12)-(eta*dw12);
    else
        break;
    end

end





