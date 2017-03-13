#########################################################
%Used to set parameters of data input
%
%Produced by:
% - Jamie Place
% - 13332721
% - NUIG
% - 24/01/2017
#########################################################

function [retsigx retsigy] = ga_setup(ALPHA=1,percent = 0, RANGE = [1 1e5], EQUATION=5)
  
  
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
  [signifx signify]= ga_significance(N_on, N_off, ALPHA, EQUATION);

  
  retsigx = signifx;
  retsigy = signify;

  
endfunction
