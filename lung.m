%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;

% First step: change several M to find the maximum sustainble oxygen rate of
% consumption (when the code stop)

M_vec = 0:0.01:0.5;

for i = 1:length(M_vec)
    M = M_vec(i);
    setup_lung
    cvsolve
    outchecklung
end