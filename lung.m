%filename: lung.m (main program)
clear all
clf

% only for task 3
beta_vec = [0:0.1:1];
global Pstar cstar n maxcount M Q camax RT cI;

for i = 1:length(beta_vec)
    beta = beta_vec(i);
    setup_lung
    cvsolve
    outchecklung
    % record inspired partial pressure of oxygen
    PI_vec(i) = PI;
    % record mean alveolar partial pressure of oxygen
    PAbar_vec(i) = PAbar;
    % record mean arterial partial pressure of oxygen
    Pabar_vec(i) = Pabar;
    % record venous partial pressure of oxygen
    Pv_vec(i) = Pv;

end

% plot PI v.s. beta
figure;
plot(beta_vec,PI_vec,'-o');
title('Inspired partial pressure of oxygen v.s. beta');
xlabel('beta'); ylabel('PI');

% plot beta v.s. PAbar
figure;
plot(beta_vec,PAbar_vec,'-o');
title('mean alveolar partial pressure of oxygen v.s. beta');
xlabel('beta'); ylabel('PAbar');

% plot beta v.s. Pabar
figure;
plot(beta_vec,Pabar_vec,'-o');
title('mean arterial partial pressure of oxygen v.s. beta');
xlabel('beta'); ylabel('Pabar');

% plot beta v.s. Pv
figure;
plot(beta_vec,Pv_vec,'-o');
title('venous partial pressure of oxygen v.s. beta');
xlabel('beta'); ylabel('Pv');

% plot everything in one figure;
figure;
plot(beta_vec,PI_vec,'-o'); hold on;
plot(beta_vec,PAbar_vec,'-o'); hold on;
plot(beta_vec,Pabar_vec,'-o'); hold on;
plot(beta_vec,Pv_vec,'-o'); 
legend('PI','PAbar','Pabar','Pv');
title('partial pressure at different location v.s. beta');
xlabel('beta'); ylabel('partial pressure');
