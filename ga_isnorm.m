#########################################################
%check normality of data inputted.
%using graphical
%
%Produced by:
% - Jamie Place
% - 13332721
% - NUIG
% - 18/01/2017
#########################################################
function [retHval, retPval] = ga_isnorm(x, ALPHA = 1);
pkg load statistics;
if (!isvector(x))
  printf("error: input variable must be a vector \n");
  break;
elseif (!isfloat(ALPHA))
  printf("error: ALPHA value must be a number");
  break;
end  
########################################################
            %Standard Deviation Table
%sig_1 = 0.682
%sig_2 = 0.954
%sig_3 = 0.997
%sig_4 = 0.999
%sig_5 = 0.999999
%sig_6 = 0.999999998
%sig_7 = 0.999999999997



H = 0;
P = 0;
if (ALPHA >= 0.5 && ALPHA <= 1.5)
  [P H] = ttest(x, 0);
end
retHval = H;
retPval = P;

endfunction
