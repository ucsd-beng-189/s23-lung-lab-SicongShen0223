clear; clc;

% Data
M_vec = [0.03 0.04 0.04 0.04 0.03 0.03 0.03 0.03 0.03 0.02 0.02];
beta_vec = 0:0.1:1;

figure;
plot(beta_vec,M_vec,'-o');
title('Maximum M v.s. Beta');
xlabel('M'); ylabel('M');