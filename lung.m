%filename: lung.m (main program)
clear all
clf

% only for task 5
global Pstar cstar n maxcount M Q camax RT cI;
cI_vec = [0:0.01:1];

for j = 1:length(cI_vec)
    cI = cI_vec(j);
end

for i = 1:length(cI_vec)
    setup_lung
    cvsolve
    outchecklung

    % record mean alveolar partial pressure of oxygen
    PAbar_vec(i) = PAbar;
    % record mean arterial partial pressure of oxygen
    Pabar_vec(i) = Pabar;
    % record venous partial pressure of oxygen
    Pv_vec(i) = Pv;

    % record mean alveolar partial concentration of oxygen
    cAbar_vec(i) = cAbar;
    % record mean arterial partial concentration of oxygen
    cabar_vec(i) = cabar;
    % record venous concentration of oxygen
    cv_vec(i) = cv; 
end

%% first set: plot mean partial pressures v.s. cI
% plot PAbar v.s. cI
figure;
subplot(2,2,1);
plot(cI_vec,PAbar_vec,'-o');
title('mean alveolar partial pressure of oxygen v.s. cI');
xlabel('cI'); ylabel('PAbar');

% plot Pabar v.s. cI
subplot(2,2,2);
plot(cI_vec,Pabar_vec,'-o');
title('mean arterial partial pressure of oxygen v.s. cI');
xlabel('cI'); ylabel('Pabar');

% plot Pv v.s. cI
subplot(2,2,3);
plot(cI_vec,Pv_vec,'-o');
title('venous partial pressure of oxygen v.s. cI');
xlabel('cI'); ylabel('Pv');

% plot everything in one figure;
subplot(2,2,4);
plot(cI_vec,PAbar_vec,'-o'); hold on;
plot(cI_vec,Pabar_vec,'-o'); hold on;
plot(cI_vec,Pv_vec,'-o'); 
legend('PAbar','Pabar','Pv');
title('partial pressure at different location v.s. cI');
xlabel('cI'); ylabel('partial pressure');

%% second set: plot mean concentration versus cI
% plot cAbar v.s. cI
figure;
subplot(2,2,1);
plot(cI_vec,cAbar_vec,'-o');
title('mean alveolar concentration of oxygen v.s. cI');
xlabel('cI'); ylabel('cAbar');

% plot cabar v.s. cI
subplot(2,2,2);
plot(cI_vec,cabar_vec,'-o');
title('mean arterial concentration of oxygen v.s. cI');
xlabel('cI'); ylabel('cabar');

% plot cvbar v.s. cI
subplot(2,2,3);
plot(cI_vec,cv_vec,'-o');
title('venous concentration of oxygen v.s. cI');
xlabel('cI'); ylabel('cv');

% plot everything in one figure
subplot(2,2,4);
plot(cI_vec,cAbar_vec,'-o'); hold on;
plot(cI_vec,cabar_vec,'-o'); hold on;
plot(cI_vec,cv_vec,'-o'); 
legend('cAbar','cabar','cv')
title('concentration of oxygen at different location v.s. cI');
xlabel('cI'); ylabel('concentration');