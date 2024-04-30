clear all;

x0 = 1.75;
diff = 1e+4;
iter = 1;

figure;
xv = linspace(0,2.0,101);
fv = f(xv);
plot(xv,fv,'LineWidth',2.0);
hold on;
plot([0,2],[0,0],'k-');
plot(x0,0,'k*');
txt = sprintf("$x_{%d}$",0);
text(x0+0.015,0-0.25,txt,"FontSize",12,"Interpreter","latex");
%axis square;

%while (diff>1e-10)
for i = 1:3
    
    disp([iter x0]);

    [f0,df0] = f(x0);
    x1 = x0 - f0/df0;
    plot([x0,x0],[0,f0],'k:');
    plot(x1,0,'k*');
    txt = sprintf("$x_{%d}$",i);
    text(x1+0.015,0-0.25,txt,"FontSize",12,"Interpreter","latex");
    fv = (0-f0)/(x1-x0)*(xv-x0) + f0;
    plot(xv,fv,'r-');
    ylim([-1,12]);
    diff = abs(x1-x0);
    iter = iter+1;
    x0 = x1;
    
end

print -depsc2 Fig_B_4.eps;
