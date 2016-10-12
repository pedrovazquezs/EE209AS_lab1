function T=MDH(x)

    T=trotz(x(1))*transl(0,0,x(2))*transl(x(3),0,0)*trotx(x(4));
end