#########################################################
%Used to set parameters of data input
%
%Produced by:
% - Jamie Place
% - 13332721
% - NUIG
% - 24/01/2017
#########################################################

function [retmean retstd retsig retcount retbins]...
           = ga_setup(ALPHA=1,percent = 0, RANGE = [1 1e5], EQUATION=5)
if (!isfloat(ALPHA) && !isfloat(percent))
  disp("error: ALPHA & SNR should be a number!");
  break
end
%mean of data
lambda = 1000;
%produce the source signal
source = 0;
if (percent != 0)
  source = ga_signal(lambda*percent, RANGE);
end
%produce background noise
background = (ALPHA)*ga_signal(lambda, RANGE);
%combine background noise and source signal to make N_on
N_on = background + source;
%produce N_off
N_off = ga_signal(lambda, RANGE);

%compute significance using eq. 5 || 17from Li and Ma 1983
%compute significance
signif = ga_significance(N_on, N_off, ALPHA, EQUATION);

%check normality of significance

%Retrun different variables depending on value of alpha. These are used to
%determine if a signal is present or not
retmean = mean(signif);
retstd = std(signif);
retsig = signif;
retcount = [];
retbins = [];

endfunction
