#########################################################
%Determine the statistical significance
%of the inputted data
%Methods of analysis from:
% - Li & Ma: Analysis Methods for Results in Gamma-Ray Astronomy
% - 01/09/1983
%
%Produced by:
% - Jamie Place
% - 13332721
% - NUIG
% - 18/01/2017
#########################################################

function retval = significance(ON, OFF, ALPHA = 1)
if (!isvector(ON))
  prinf("error: N_on must be a array \n");
  break;
elseif (!isvector(OFF))
  printf("error: N_off must be an array \n");
  break;
elseif (!isfloat(ALPHA))
  printf("error: ALPHA must be an number \n");
  break;
end
term1 = (1 + ALPHA)/ALPHA;
term2 = 1 + ALPHA;

if (ALPHA >= .5 && ALPHA <= 1.5)  
  x = (ON - (ALPHA*OFF))./sqrt(ON + ((ALPHA^2)*(OFF)));
  retval = x;
else
  a=ON.*log(term1.*(ON./(ON+OFF)));
  b=OFF.*log(term2.*(OFF./(ON+OFF)));
  c=(a+b).^(1/2);
  x = sqrt(2).*c;
  retval = x;
end

endfunction