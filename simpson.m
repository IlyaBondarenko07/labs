function simpson
syms x y;
N = 2;
a = 0.1;
b = 1.7;
eps = 0.001;
f = sin(0.02*N +1.5*x)/(1.4+cos(1.2*N-0.3*x));
df = diff(f,x);
df = diff(df,x);
x1 = fminbnd(@fout,a,0.6);
max = double(subs(df,x,x1));
h = sqrt(-eps*12/((b-a)*max));
n = round((b-a)/h);
disp(n);
h = (b-a)/n;
exact = double(int(f,a,b));
current = (double(subs(f,x,a))+double(subs(f,x,b)))/2;
for i = 1:n-1
   current =current + double(subs(f,x,a+h*i));
end
current = current*h; 
disp(current);
disp(exact);

 function out=fout(x) 
     out= -((9*sin((3*x)/10 - 12/5)^2*sin((3*x)/2 + 1/25))/(50*(cos((3*x)/10 - 12/5) + 7/5)^3) - (9*sin((3*x)/2 + 1/25))/(4*(cos((3*x)/10 - 12/5) + 7/5)) + (9*cos((3*x)/10 - 12/5)*sin((3*x)/2 + 1/25))/(100*(cos((3*x)/10 - 12/5) + 7/5)^2) + (9*cos((3*x)/2 + 1/25)*sin((3*x)/10 - 12/5))/(10*(cos((3*x)/10 - 12/5) + 7/5)^2));
