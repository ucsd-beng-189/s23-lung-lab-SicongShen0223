%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
% redeclare cstar
cstar = 0.0021;
beta_vec = 0;
cref=0.2/(22.4*(310/273))
cI = cref;
for i = 1:length(beta_vec)
    
    setup_lung
    cvsolve
    outchecklung

    % record partial pressures
    PI_vec(i) = PI; % Inspired O2 partial pressure
    PAbar_vec(i) = PAbar; % Mean alveolar O2 partial pressure
    Pabar_vec(i) = Pabar; % Mean arterial O2 partial pressure
    Pv_vec(i) = Pv; % Venous O2 partial pressure

    % record concentration
    cI_vec(i) = cI; % Inspired O2 concentration
    cAbar_vec(i) = cAbar; % Mean alveolar O2 concentration
    cabar_vec(i) = cabar; % Mean arterial O2 concentration
    cv_vec(i) = cv; % Venous O2 concentration
end

%% Set 1 partial pressure figures;
figure;
subplot(2,2,1);
plot(beta_vec,PI_vec,'-o');
title('Inspired O2 partial pressure v.s. beta');
xlabel('beta'); ylabel('PI');

subplot(2,2,2);
plot(beta_vec,PAbar_vec,'-o');
title('Mean alveolar O2 partial pressure v.s. beta');
xlabel('beta'); ylabel('PAbar');

subplot(2,2,3)
plot(beta_vec,Pabar_vec,'-o');
title('Mean arterial O2 concentration v.s. beta');
xlabel('beta'); ylabel('Pabar');

subplot(2,2,4);
plot(beta_vec,Pv_vec,'-o');
title('Venous O2 concentration v.s. beta');
xlabel('beta'); ylabel('Pv');

figure;
plot(beta_vec,PI_vec,'-o'); hold on;
plot(beta_vec,PAbar_vec,'-o'); hold on;
plot(beta_vec,Pabar_vec,'-o'); hold on;
plot(beta_vec,Pv_vec,'-o');
title('partial pressure v.s. beta');
xlabel('beta'); ylabel('partial pressure');
legend('PI','PA','Pa','Pv');

%% Set 2 Concentration 
figure;
subplot(2,2,1);
plot(beta_vec,cI_vec,'-o');
title('Inspiration O2 concentration v.s. beta');
xlabel('beta'); ylabel('cI');

subplot(2,2,2);
plot(beta_vec,cAbar_vec,'-o');
title('Mean alveolar O2 concentration v.s. beta');
xlabel('beta'); ylabel('cA');

subplot(2,2,3);
plot(beta_vec,cabar_vec,'-o');
title('Mean arterial O2 concentration v.s. beta');
xlabel('beta'); ylabel('ca');

subplot(2,2,4);
plot(beta_vec,cv_vec,'-o');
title('Venous O2 concentration v.s. beta');
xlabel('beta'); ylabel('cv');

figure;
plot(beta_vec,cI_vec,'-o'); hold on;
plot(beta_vec,cAbar_vec,'-o'); hold on;
plot(beta_vec,cabar_vec,'-o'); hold on;
plot(beta_vec,cv_vec,'-o');
title('concentration of O2 v.s. beta');
xlabel('beta'); ylabel('concentration of O2');
legend('cI','cA','ca','cv');

