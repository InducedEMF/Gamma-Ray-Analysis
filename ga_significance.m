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

function [retvalx retvaly] = ga_significance(ON, OFF, ALPHA = 1, EQUATION = 5)
term1 = (1 + ALPHA)/ALPHA;
term2 = 1 + ALPHA;

if (EQUATION == 5)  
  x = (ON - (ALPHA*OFF))./sqrt(ON + ((ALPHA^2)*(OFF)));
  retvalx = x;
  retvaly = 0;
elseif(EQUATION == 17)
  a=ON.*log(term1.*(ON./(ON+OFF)));
  b=OFF.*log(term2.*(OFF./(ON+OFF)));
  c=(a+b).^(1/2);
  x = sqrt(2).*c;
  retvalx = x;
  retvaly = 0;
elseif(EQUATION == 0)
  x = (ON - (ALPHA*OFF))./sqrt(ON + ((ALPHA^2)*(OFF)));
  retvalx = x;
  
  
  a=ON.*log(term1.*(ON./(ON+OFF)));
  b=OFF.*log(term2.*(OFF./(ON+OFF)));
  c=(a+b).^(1/2);
  y = sqrt(2).*c;
  retvaly = y;
  
end

endfunction
