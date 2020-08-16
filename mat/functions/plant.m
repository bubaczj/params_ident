function [dx] = plant(t, x, u, params)

persistent p
if nargin == 4
    p = params; % a, b, am, bm, gamma
else
    dx(1, 1) = -p.a*x(1) + p.b*x(3)*u - p.b*x(4)*x(1);
    dx(2, 1) = -p.am*x(2) + p.bm*u;
    dx(3, 1) = -u*(x(1) - x(2))*p.gamma;
    dx(4, 1) = x(1)*(x(1) - x(2))*p.gamma;
end

end

