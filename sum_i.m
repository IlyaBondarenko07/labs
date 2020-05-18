function sum_i
    disp('first X');
    Newton(1,2);
    disp('second X');
    Newton(-1,-1);
function Newton(arg1,arg2)
    syms x y;
    f1 = x^2+y^2 - 3;
    f2 = exp(x*y)-y;
    df1y = diff(f1,y);
    df1x = diff(f1,x);
    df2y = diff(f2,y);
    df2x = diff(f2,x);
    X0=[arg1;arg2];
    XI=[0;0];
    eps = 0.0001;
    i = 1;
    f0=[subs(subs(f1,x,X0(1)),y,X0(2));subs(subs(f2,x,X0(1)),y,X0(2))];
    tdf1x = subs(subs(df1x,x,X0(1)),y,X0(2));
    tdf1y = subs(subs(df1y,x,X0(1)),y,X0(2));
    tdf2x = subs(subs(df2x,x,X0(1)),y,X0(2));
    tdf2y = subs(subs(df2y,x,X0(1)),y,X0(2));
    w = [tdf1x tdf1y; tdf2x tdf2y];  %матрица Якоби
    XI = X0 - inv(w) * f0; %решение после первой итерации 
    if det(w)~=0
        while ((abs(XI(1) - X0(1)) > eps)|| (abs(XI(2) - X0(2)) > eps)) %пока точность не будет достигнута 
            X0(1) = XI(1);
            X0(2) = XI(2);
            f0=[subs(subs(f1,x,X0(1)),y,X0(2));subs(subs(f2,x,X0(1)),y,X0(2))];
            tdf1x = subs(subs(df1x,x,X0(1)),y,X0(2));
            tdf1y = subs(subs(df1y,x,X0(1)),y,X0(2));
            tdf2x = subs(subs(df2x,x,X0(1)),y,X0(2));
            tdf2y = subs(subs(df2y,x,X0(1)),y,X0(2));
            w = [tdf1x tdf1y; tdf2x tdf2y]; %матрица Якоби
            XI = X0 - inv(w) * f0; % новое решение
            i = i + 1; 
            if (i > 100)
               break;
            end
        end
    end
    disp(double(XI));
    disp(i);
