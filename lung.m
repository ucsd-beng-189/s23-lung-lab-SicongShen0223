%filename: lung.m (main program)
clear all
clc
global Pstar cstar n maxcount M Q camax RT cI;

% this following 2 lines are for task 6:
% altitude = 0:1:99;
% mole_standard = 22.4 + altitude;

cref = 0.2./((22.4+99).*(310/273));
beta_vec = 0:0.1:0.6

for i = 1:length(beta_vec)
    % cref = cref_vec(i);
    beta = beta_vec(i);
    setup_lung
    cvsolve
    outchecklung

    % record mean alveolar O2 partial pressure
    PAbar_vec(i) = PAbar;
    % record mean arterial O2 partial pressure
    Pabar_vec(i) = Pabar;
    % record venous O2 partial pressure
    Pv_vec(i) = Pv;
    % record mean alveolar O2 concentration
    cAbar_vec(i) = cAbar;
    % record mean arterial O2 concentration
    cabar_vec(i) = cabar;
    % record venous O2 concentration
    cv_vec(i) = cv;
end

%% set 1: partial pressure v.s. altitude
figure;
subplot(2,2,1);
plot(beta_vec,PAbar_vec,'-o');
title('mean alveolar O2 partial pressure v.s. beta at altitude 121.4');
xlabel('beta'); ylabel('PA');

subplot(2,2,2);
plot(beta_vec,Pabar_vec,'-o');
title('mean arterial O2 partial pressure v.s. beta at altitude 121.4');
xlabel('beta'); ylabel('Pa');

subplot(2,2,3);
plot(beta_vec,Pv_vec,'-o');
title('venous O2 partial pressure v.s. beta at altitude 121.4');
xlabel('beta'); ylabel('Pv');

subplot(2,2,4);
plot(beta_vec,PAbar_vec,'-o'); hold on;
plot(beta_vec,Pabar_vec,'-o'); hold on;
plot(beta_vec,Pv_vec,'-o');
title('partial pressure v.s. beta at altitude 121.4');
xlabel('beta'); ylabel('partial pressure');
legend('PA','Pa','Pv');

%% set 2: concentration v.s. altitude
figure;
subplot(2,2,1);
plot(beta_vec,cAbar_vec,'-o');
title('mean alveolar O2 concentration v.s. beta at altitude 121.4');
xlabel('beta'); ylabel('cA');

subplot(2,2,2);
plot(beta_vec,cabar_vec,'-o');
title('mean arterial O2 concentration v.s. beta at altitude 121.4');
xlabel('beta'); ylabel('ca');

subplot(2,2,3);
plot(beta_vec,cv_vec,'-o');
title('venous O2 concentration v.s. beta at altitude 121.4');
xlabel('beta'); ylabel('cv');

subplot(2,2,4);
plot(beta_vec,cAbar_vec,'-o'); hold on;
plot(beta_vec,cabar_vec,'-o'); hold on;
plot(beta_vec,cv_vec,'-o');
title('concentration v.s. altitude');
xlabel('beta'); ylabel('concentration');
legend('cA','ca','cv');