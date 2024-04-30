clear all;

xL = 0.0;
xH = 1.0;
fL = f(xL);
fH = f(xH);
diff = 1e+4;
iter = 1;

figure;
xv = linspace(0,1.0,101);
fv = f(xv);
plot(xv,fv,'LineWidth',2.0);
%axis square;
hold on;
plot([0,1],[0,0],'k-');
[x1,y1] = PositionCalc(1,1,0,-1,1,3,xL,0-0.1);
[x2,y2] = PositionCalc(1,1,0,-1,1,3,xH,0-0.1);
annotation('doublearrow',[x1,x2],[y1,y2],"Color","g");
text(xL+0.015,0+0.1,"$x_L$","FontSize",12,"Interpreter","latex");
plot([xL,xL],[0-0.1,0],"k:")
text(xH-0.05,0+0.1,"$x_H$","FontSize",12,"Interpreter","latex");
text((xH+xL)/2-0.1,0+0.1,"$x_1=\frac{x_H+x_L}{2}$","FontSize",12,"Interpreter","latex");
plot([(xH+xL)/2,(xH+xL)/2],[0-0.1*2,0],"k:")
%pause;
%plot([xL,xH],[0-0.05,0-0.05],'g-');

%while (diff>1e-10)
for i = 1:2
    
    disp([iter xL xH fL fH]);
    
    x0 = (xL+xH)/2;
    f0 = f(x0);
    
    if (fL*f0<0)
        xH = x0;
        fH = f0;
    else % fH*f0<0
        xL = x0;
        fL = f0;
    end

    [x1,y1] = PositionCalc(1,1,0,-1,1,3,xL,0-0.1*(iter+1));
    [x2,y2] = PositionCalc(1,1,0,-1,1,3,xH,0-0.1*(iter+1));
    annotation('doublearrow',[x1,x2],[y1,y2],"Color","g");
    plot([xH,xH],[0-0.1*(iter+1),0],"k:")
    if (iter==2); text(xH-0.05,0+0.1,"$x_2$","FontSize",12,"Interpreter","latex"); end;
%    plot([xL,xH],[0-0.05*(iter+1),0-0.05*(iter+1)],'g-');

    diff = abs(xH-xL);
    iter = iter+1;
    
end

%axis square;
print -depsc2 Fig_B_5.eps;
