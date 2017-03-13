#########################################################
%Produce a poisson distribution with the parameters given
%
%
%
%Produced by:
% - Jamie Place
% - 13332721
% - NUIG
% - 18/01/2017
#########################################################

function retval = ga_signal(LAMBDA, RANGE)
  x = poissrnd(LAMBDA, RANGE);
  retval = x;
endfunction
