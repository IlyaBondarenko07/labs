function MSI
msi(1.8,0.5);
function msi(arg1,arg2)
eps = 0.0001; 
c1 = FindC();
c2 = 0.108;
x0 = arg1; 
y0 = arg2; 
x = x0 + c1*(x0^2+y0^2-3); 
y =c2*x0*exp(y0*x0);
i = 1; 

while or((abs(x - x0 ) > eps), (abs(y - y0) > eps)) 
    x0 = x;
    y0 = y;
    x = x0 + c1*(x0^2+y0^2-3); 
    y = c2*x0*exp(y0*x0);
    i = i + 1;
end
disp(x);
disp(y);
disp(i);
function out = FindC
syms xs ys;
f1 = -sqrt(3-ys^2);
df1 = diff(f1,ys);

c  = double(subs(df1,ys,-1.7));
c = 1/c;
out = c;
