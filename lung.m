%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
% redeclare cstar
cref=0.2/(22.4*(310/273));
cstar_vec = cref:-0.0001:0.0021;
cI = cref;
for i = 1:length(cstar_vec)
    cstar = cstar_vec(i);    
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
plot(cstar_vec,PI_vec,'-o');
title('Inspired O2 partial pressure v.s. cstar');
xlabel('cstar'); ylabel('PI');

subplot(2,2,2);
plot(cstar_vec,PAbar_vec,'-o');
title('Mean alveolar O2 partial pressure v.s. cstar');
xlabel('cstar'); ylabel('PAbar');

subplot(2,2,3)
plot(cstar_vec,Pabar_vec,'-o');
title('Mean arterial O2 concentration v.s. cstar');
xlabel('cstar'); ylabel('Pabar');

subplot(2,2,4);
plot(cstar_vec,Pv_vec,'-o');
title('Venous O2 concentration v.s. cstar');
xlabel('cstar'); ylabel('Pv');

figure;
plot(cstar_vec,PI_vec,'-o'); hold on;
plot(cstar_vec,PAbar_vec,'-o'); hold on;
plot(cstar_vec,Pabar_vec,'-o'); hold on;
plot(cstar_vec,Pv_vec,'-o');
title('partial pressure v.s. cstar');
xlabel('cstar'); ylabel('partial pressure');
legend('PI','PA','Pa','Pv');

%% Set 2 Concentration 
figure;
subplot(2,2,1);
plot(cstar_vec,cI_vec,'-o');
title('Inspiration O2 concentration v.s. cstar');
xlabel('cstar'); ylabel('cI');

subplot(2,2,2);
plot(cstar_vec,cAbar_vec,'-o');
title('Mean alveolar O2 concentration v.s. cstar');
xlabel('cstar'); ylabel('cA');

subplot(2,2,3);
plot(cstar_vec,cabar_vec,'-o');
title('Mean arterial O2 concentration v.s. cstar');
xlabel('cstar'); ylabel('ca');

subplot(2,2,4);
plot(cstar_vec,cv_vec,'-o');
title('Venous O2 concentration v.s. cstar');
xlabel('cstar'); ylabel('cv');

figure;
plot(cstar_vec,cI_vec,'-o'); hold on;
plot(cstar_vec,cAbar_vec,'-o'); hold on;
plot(cstar_vec,cabar_vec,'-o'); hold on;
plot(cstar_vec,cv_vec,'-o');
title('concentration of O2 v.s. cstar');
xlabel('cstar'); ylabel('concentration of O2');
legend('cI','cA','ca','cv');

