%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;

altitude = 0:1:120;
mole_standard = 22.4 + altitude;
cref_vec = 0.2./(mole_standard.*(310/273));

for i = 1:length(cref_vec)
    cref = cref_vec(i);
    cstar = 1.5*cref;
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
plot(altitude,PAbar_vec,'-o');
title('mean alveolar O2 partial pressure v.s. altitude ');
xlabel('altitude'); ylabel('PA');

subplot(2,2,2);
plot(altitude,Pabar_vec,'-o');
title('mean arterial O2 partial pressure v.s. altitude');
xlabel('altitude'); ylabel('Pa');

subplot(2,2,3);
plot(altitude,Pv_vec,'-o');
title('venous O2 partial pressure v.s. altitude');
xlabel('altitude'); ylabel('Pv');

subplot(2,2,4);
plot(altitude,PAbar_vec,'-o'); hold on;
plot(altitude,Pabar_vec,'-o'); hold on;
plot(altitude,Pv_vec,'-o');
title('partial pressure v.s. altitude');
xlabel('altitude'); ylabel('partial pressure');
legend('PA','Pa','Pv');

%% set 2: concentration v.s. altitude
figure;
subplot(2,2,1);
plot(altitude,cAbar_vec,'-o');
title('mean alveolar O2 concentration v.s. altitude');
xlabel('altitude'); ylabel('cA');

subplot(2,2,2);
plot(altitude,cabar_vec,'-o');
title('mean arterial O2 concentration v.s. altitude');
xlabel('altitude'); ylabel('ca');

subplot(2,2,3);
plot(altitude,cv_vec,'-o');
title('venous O2 concentration v.s. altitude');
xlabel('altitude'); ylabel('cv');

subplot(2,2,4);
plot(altitude,cAbar_vec,'-o'); hold on;
plot(altitude,cabar_vec,'-o'); hold on;
plot(altitude,cv_vec,'-o');
title('O2 concentration v.s. altitude');
xlabel('altitude'); ylabel('concentration');
legend('cA','ca','cv');