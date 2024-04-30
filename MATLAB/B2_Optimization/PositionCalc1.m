function [Xpos, Ypos] = PositionCalc1(AxesPos,Left,Bottom,Width,Height,x,y)

% if Numfig == 1
%     AxesPos = [0.1300 0.1100 0.7750 0.8150];
% elseif Numfig == 2
%     if Orderfig == 1
%         AxesPos = [0.1300 0.5838 0.7750 0.3412];
%     else
%         AxesPos = [0.1300 0.1100 0.7750 0.3412];
%     end
% end

X_Ratio = (x-Left) / Width * AxesPos(3);
Y_Ratio = (y-Bottom) / Height * AxesPos(4);

Xpos = X_Ratio + AxesPos(1);
Ypos = Y_Ratio + AxesPos(2);

end