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
           = setup(ALPHA=1,percent = 0, RANGE = [1 1e5], PLOT=false)
if (!isfloat(ALPHA) && !isfloat(percent))
  disp("error: ALPHA & SNR should be a number!");
  break
elseif (!isbool(PLOT))
  disp("error: PLOT should be true or false");
  break;
end
%mean of data
lambda = 1000;
%produce the source signal
source = 0;
if (percent != 0)
  source = signal(lambda*percent, RANGE);
end
%produce background noise
background = (ALPHA)*signal(lambda, RANGE);
%combine background noise and source signal to make N_on
N_on = background + source;
%produce N_off
N_off = signal(lambda, RANGE);

%compute significance using eq. 5 || 17from Li and Ma 1983
%compute significance
signif = significance(N_on, N_off, ALPHA);
%check normality of significance and plot over significance plot

%Plotting the data in a histogram
if (PLOT)
  figure(1);
  if (ALPHA >= .5 && ALPHA <= 1.5) 
    hist(signif, 20);
    xlabel('Value of occurance');
    ylabel('Frequency of occurance');
    title('Frequency plot of data using eq.5');
  else
    [count bins] = hist(real(signif), 20);
    hist(real(signif), 20);
    xlabel('Value of occurance');
    ylabel('Frequency of occurance');
    title('Frequency plot of data using eq.17');
  end
end

%Retrun different variables depending on value of alpha. These are used to
%determine if a signal is present or not
if (ALPHA >= .5 && ALPHA <= 1.5)
  retmean = mean(signif);
  retstd = std(signif);
  retsig = signif;
  retcount = [];
  retbins = [];
else
  retmean = mean(signif);
  retstd= std(signif);
  retsig = signif;
  retcount = [];
  retbins = [];
end
endfunction