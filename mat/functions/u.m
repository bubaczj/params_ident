function [u] = u(t)
%% P regulation
% u = 10*(y_zad - x(2)); % for now just constant
u = sin(t);
end

