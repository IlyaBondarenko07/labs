function simpson2
syms x y;
N = 2;
a = 0.1;
b = 1.7;
f = sin(0.02*N +1.5*x)/(1.4+cos(1.2*N-0.3*x));
df = diff(f,x);
df = diff(df,x);
df = diff(df,x);
df = diff(df,x);
x1 = fminbnd(@fout,a,0.6);
max = double(subs(df,x,x1));
exact = double(int(f,a,b));
eps = 0.001;
h =sqrt(sqrt(eps*2880/(max*(b-a)^5)));
n = round((b-a)/h);
disp(n);
h = (b-a)/n;
current = (double(subs(f,x,a))+double(subs(f,x,b)));
current1 = 0;
current2 = 0;
for i = 1:n-1
    if mod(i,2)==0
        current1 =current1 + double(subs(f,x,a+h*i));
    else
        current2 =current2 + double(subs(f,x,a+h*i));
    end
end
current = h*(current+current1*2+4*current2)/3; 
disp(current);
disp(exact);
end

function out=fout(x) 
     out = -((81*sin((3*x)/2 + 1/25))/(16*(cos((3*x)/10 - 12/5) + 7/5)) + (243*cos((3*x)/10 - 12/5)^2*sin((3*x)/2 + 1/25))/(5000*(cos((3*x)/10 - 12/5) + 7/5)^3) + (243*cos((3*x)/2 + 1/25)*sin((3*x)/10 - 12/5)^3)/(250*(cos((3*x)/10 - 12/5) + 7/5)^4) - (6237*sin((3*x)/10 - 12/5)^2*sin((3*x)/2 + 1/25))/(2500*(cos((3*x)/10 - 12/5) + 7/5)^3) + (243*sin((3*x)/10 - 12/5)^4*sin((3*x)/2 + 1/25))/(1250*(cos((3*x)/10 - 12/5) + 7/5)^5) - (12231*cos((3*x)/10 - 12/5)*sin((3*x)/2 + 1/25))/(10000*(cos((3*x)/10 - 12/5) + 7/5)^2) - (1053*cos((3*x)/2 + 1/25)*sin((3*x)/10 - 12/5))/(250*(cos((3*x)/10 - 12/5) + 7/5)^2) + (729*cos((3*x)/10 - 12/5)*sin((3*x)/10 - 12/5)^2*sin((3*x)/2 + 1/25))/(2500*(cos((3*x)/10 - 12/5) + 7/5)^4) + (243*cos((3*x)/10 - 12/5)*cos((3*x)/2 + 1/25)*sin((3*x)/10 - 12/5))/(250*(cos((3*x)/10 - 12/5) + 7/5)^3));
end