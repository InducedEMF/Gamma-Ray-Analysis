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

function retval = signal(LAMBDA, RANGE, PLOT = false, TITLE = '')
  if (isinteger(LAMBDA))
    printf("error: LAMBDA must be integer \n");
    break;
  elseif (!isvector(RANGE));
    printf("error: RANGE must be a [1 x 2] vector \n");
    break;
  elseif (!isbool(PLOT))
    printf("error: PLOT must be a boolean \n");
    break;
  elseif (!ischar(TITLE))
    printf("error: TITLE must be a string \n");
  end
  
  
  x = poissrnd(LAMBDA, RANGE);
  retval = x;
  if (PLOT)
    hist(x, 40);
    LAMBDA = int2str(LAMBDA);
    title(TITLE);
  end
endfunction