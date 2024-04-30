clear all;

%x = [-10:0.01:10];
%plot(x,f(x));
phi = (-1+sqrt(5))/2; % 1/phi = golden ratio

xL = 0.0;
xH = 6.0;
fL = f_gss(xL);
fH = f_gss(xH);
x1 = xL + phi*(xH-xL);
f1 = f_gss(x1);
x2 = xH - phi*(xH-xL);
f2 = f_gss(x2);
disp([xL x2 x1 xH])
disp([fL f2 f1 fH])
figure;
subplot(2,2,1);
xv = linspace(0,6,101);
fv = f_gss(xv);
plot(xv,fv,'LineWidth',2.0);
hold on;
plot([0,6],[0,0],'k-');
plot(xL,fL,'k*');
plot(xH,fH,'k*');
plot(x1,f1,'k*');
plot(x2,f2,'k*');
plot([xL,xL],[0,fL],'k:');
plot([xH,xH],[0,fH],'k:');
plot([x1,x1],[0,f1],'k:');
plot([x2,x2],[0,f2],'k:');
text(xL+0.15,0+0.1,"$x_L$","FontSize",12,"Interpreter","latex");
text(xH-0.60,0+0.1,"$x_H$","FontSize",12,"Interpreter","latex");
text(x1+0.015,0+0.1,"$x_1$","FontSize",12,"Interpreter","latex");
text(x2+0.015,0+0.1,"$x_2$","FontSize",12,"Interpreter","latex");
xlim([0,6]);
pause;

diff = 1e+4;
iter = 1;

%while (diff>1e-10)
for i = 1:3
    
    disp([iter xL x2 x1 xH fL fH]);
    
    if (f2>f1)
        xH = x1;
        fH = f1;
        x1 = x2;
        f1 = f2;
        x2 = xH - phi*(xH-xL);
        f2 = f_gss(x2);
    else
        xL = x2;
        fL = f2;
        x2 = x1;
        f2 = f1;
        x1 = xL + phi*(xH-xL);
        f1 = f_gss(x1);
    end

    subplot(2,2,iter+1);
    plot(xv,fv,'LineWidth',2.0);
    hold on;
    plot([0,6],[0,0],'k-');
    plot(xL,fL,'k*');
    plot(xH,fH,'k*');
    plot(x1,f1,'k*');
    plot(x2,f2,'k*');
    plot([xL,xL],[0,fL],'k:');
    plot([xH,xH],[0,fH],'k:');
    plot([x1,x1],[0,f1],'k:');
    plot([x2,x2],[0,f2],'k:');
    if (iter<3)
        text(xL+0.15,0+0.1,"$x_L$","FontSize",12,"Interpreter","latex");
        text(xH+0.015,0+0.1,"$x_H$","FontSize",12,"Interpreter","latex");
        text(x1+0.015,0+0.1,"$x_1$","FontSize",12,"Interpreter","latex");
        text(x2+0.015,0+0.1,"$x_2$","FontSize",12,"Interpreter","latex");
    else
        text(xL-0.6,0+0.1,"$x_L$","FontSize",12,"Interpreter","latex");
        text(xH+0.015,0+0.1,"$x_H$","FontSize",12,"Interpreter","latex");
        text(x1+0.015,0+0.1,"$x_1$","FontSize",12,"Interpreter","latex");
        text(x2-0.3,0+0.1,"$x_2$","FontSize",12,"Interpreter","latex");
    end
    diff = abs(xH-xL);
    iter = iter+1;
    
end

print -depsc2 Fig_B_7.eps;
