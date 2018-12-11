function p = MyBisection(fh, a, b, tol)

u = 2 * tol;
fa = feval(fh, a);
fb = feval(fh, b);

while abs(u) > tol
    p = (a+b) / 2;
    u = feval(fh,p);
    if (u*fa > 0)
        a = p;
        fa = u;
    else
        b = p;
        fb = u;
    end
end

