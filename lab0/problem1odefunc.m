function yp = program1odefunc(t,y)
    global n;
    %disp(n);
    yp = [y(2);-(y(1)^n)];
end