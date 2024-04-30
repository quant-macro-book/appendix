clear all;

%x = [-10:0.01:10];
%plot(x,f(x));
phi = (-1+sqrt(5))/2; % 1/phi = golden ratio

xL = 0.0;
xH = 2.2918;
fL = f_gss(xL);
fH = f_gss(xH);
x1 = xL + phi*(xH-xL);
f1 = f_gss(x1);
x2 = xH - phi*(xH-xL);
f2 = f_gss(x2);
disp([xL x2 x1 xH])
disp([fL f2 f1 fH])

AxesPos = [0.1300 0.584 0.7750 0.3412];

figure;
% t = tiledlayout(1,1,'Padding','tight');
% t.Units = 'inches';
% t.OuterPosition = [0.25 0.25 3 3];
% nexttile;
subplot(2,1,1);
xv = linspace(0,2.2918,101);
fv = f_gss(xv);
plot(xv,fv,'LineWidth',2.0);
hold on;
plot([0,3],[0,0],'k-');
plot(xL,fL,'k*');
plot(xH,fH,'k*');
plot(x1,f1,'k*');
plot(x2,f2,'k*');
plot([xL,xL],[0,fL],'k:');
plot([xH,xH],[0,fH],'k:');
plot([x1,x1],[0,f1],'k:');
plot([x2,x2],[0,f2],'k:');
text(xL+0.05,0-0.05,"$x_L$","FontSize",12,"Interpreter","latex");
text(xH-0.15,0-0.05,"$x_H$","FontSize",12,"Interpreter","latex");
text(x1+0.015,0-0.05,"$x_1$","FontSize",12,"Interpreter","latex");
text(x2+0.015,0-0.05,"$x_2$","FontSize",12,"Interpreter","latex");
xlim([0,2.2918]);
ylim([-0.4,1]);
[xx1,yy1] = PositionCalc1(AxesPos,0,-0.4,2.2918,1.4,xL,0-0.2);
[xx2,yy2] = PositionCalc1(AxesPos,0,-0.4,2.2918,1.4,xH,0-0.2);
annotation('doublearrow',[xx1,xx2],[yy1,yy2],"Color","g");
text((xL+xH)/2,0-0.15,"$a+b$","FontSize",12,"Interpreter","latex");
[xx1,yy1] = PositionCalc1(AxesPos,0,-0.4,2.2918,1.4,x2,0-0.3);
[xx2,yy2] = PositionCalc1(AxesPos,0,-0.4,2.2918,1.4,xH,0-0.3);
annotation('doublearrow',[xx1,xx2],[yy1,yy2],"Color","g");
text((x2+xH)/2,0-0.25,"$a$","FontSize",12,"Interpreter","latex");

%exportgraphics(t,'Fig_B_6a.eps','Resolution',300);
%print -depsc2 Fig_B_6a.eps;
%set(gcf,'PaperPositionMode','auto')
%print('Fig_B_6a.eps','-depsc2','-r0')

diff = 1e+4;
iter = 1;

%while (diff>1e-10)
for i = 1:1
    
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

%    figure;
    % t = tiledlayout(1,1,'Padding','tight');
    % t.Units = 'inches';
    % t.OuterPosition = [0.25 0.25 3 3];
    % nexttile;
    AxesPos = [0.1300 0.1100 0.7750 0.3412];
    subplot(2,1,2);
    xv = linspace(0,2.2918,101);
    fv = f_gss(xv);
    plot(xv,fv,'LineWidth',2.0);
    hold on;
    plot([0,3],[0,0],'k-');
    plot(xL,fL,'k*');
    plot(xH,fH,'k*');
    plot(x1,f1,'k*');
    plot(x2,f2,'k*');
    plot([xL,xL],[0,fL],'k:');
    plot([xH,xH],[0,fH],'k:');
    plot([x1,x1],[0,f1],'k:');
    plot([x2,x2],[0,f2],'k:');
    text(xL+0.05,0-0.05,"$x'_L$","FontSize",12,"Interpreter","latex");
    text(xH-0.15,0-0.05,"$x'_H$","FontSize",12,"Interpreter","latex");
    text(x1+0.015,0-0.05,"$x'_1$","FontSize",12,"Interpreter","latex");
    text(x2+0.015,0-0.05,"$x'_2$","FontSize",12,"Interpreter","latex");
    xlim([0,2.2918]);
    ylim([-0.4,1]);
    [xx1,yy1] = PositionCalc1(AxesPos,0,-0.4,2.2918,1.4,xL,0-0.2);
    [xx2,yy2] = PositionCalc1(AxesPos,0,-0.4,2.2918,1.4,xH,0-0.2);
    annotation('doublearrow',[xx1,xx2],[yy1,yy2],"Color","g");
    text((xL+xH)/2,0-0.15,"$a$","FontSize",12,"Interpreter","latex");
    [xx1,yy1] = PositionCalc1(AxesPos,0,-0.4,2.2918,1.4,x2,0-0.3);
    [xx2,yy2] = PositionCalc1(AxesPos,0,-0.4,2.2918,1.4,xH,0-0.3);
    annotation('doublearrow',[xx1,xx2],[yy1,yy2],"Color","g");
    text((x2+xH)/2,0-0.25,"$b$","FontSize",12,"Interpreter","latex");
%    exportgraphics(t,'Fig_B_6b.eps','Resolution',300);
%    print -depsc2 Fig_B_6b.eps;
    % set(gcf,'PaperPositionMode','auto')
    % print('Fig_B_6b.eps','-depsc2','-r0')

    diff = abs(xH-xL);
    iter = iter+1;
    
end

print -depsc2 Fig_B_6.eps;