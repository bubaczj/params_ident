clear all
close all
clc;

%% Simulation settings
T = [0, 5e1];
x0 = [rand(), 0, 1, 0]';

%% Object parameters
params.a = 1*(0.5 + 0.5*rand());
params.b = 1*sign(rand())*(0.5 + 0.5*rand());
params.am = 1;
params.bm =  1;
params.gamma = 1 * sign(params.b);

%% Object initialization
plant([],[],[], params);

%% simulation
tic
[t, Y] = ode45(@(t, x) plant(t, x, u(t)), T, x0);
toc

%% reduce number of pts
Ytot = Y;
ttot = t;
ref = 1;
Y = Y(1:ref:end, :);
t = t(1:ref:end, :);

%% plots drawing
fig = figure();
subplot(4, 1, 1);
plot(t, Y(:, 1));
grid on
hold on
plot(t, Y(:, 2));
plot(t, Y(:, 1) - Y(:, 2));
title('Object and model output', 'interpreter', 'latex');
legend('$y$', '$\hat{y}$', '$e = y - \hat{y}$', 'interpreter', 'latex');
subplot(4, 1, 2);
grid on
hold on
plot(t, u(t));
title('Steering signal', 'interpreter', 'latex');
legend('$u_c$', 'interpreter', 'latex');
subplot(4, 1, 3);
grid on
hold on
plot(t, params.am - params.bm.*(Y(:, 4)./Y(:, 3)));
plot(t, params.bm./Y(:, 3));
title('Parameters identification', 'interpreter', 'latex');
legend( '$a_{est} = \hat{a} - \hat{b}\frac{\Theta_2}{\Theta_1}$', '$b_{est} = \frac{\hat{b}}{\Theta_1}$', 'interpreter', 'latex');
subplot(4, 1, 4);
grid on
hold on
plot(t, 100.*(params.a - (params.am - params.bm.*(Y(:, 4)./Y(:, 3))))./params.a);
plot(t, 100.*(params.b - (params.bm./Y(:, 3)))./params.b);
title('Percentage identification error', 'interpreter', 'latex');
legend( '$err_a = \frac{a - a_{est}}{a} \cdot 100\%$', '$err_b = \frac{b - b_{est}}{b} \cdot 100\%$', 'interpreter', 'latex');

print(fig, 'sim', '-dpdf', '-bestfit');
