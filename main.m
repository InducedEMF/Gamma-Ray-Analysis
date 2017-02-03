function retval = main(percent_snr=0, ALPHA=1, PLOT=false)
close all;
%measure time taken for program to run
time = cputime;
%initiate the program with outputs of MEAN, VARIANCE and the distribution of 
%significance data or the max point of the histogram. Depending on wether
%equation 5 or equation 17 is used
RANGE = [1 1e5];
%get baseline readings
[MEAN0 STD0 SIG0 COUNT0 BINS0] = setup(1, 0, RANGE);
figure(1);
hold on;
hist(SIG0, 40, 'facecolor', 'b');
%get values to test against base line
[MEAN STD SIG COUNT BINS] = setup(ALPHA, percent_snr, RANGE, PLOT);
hist(SIG, 40, 'facecolor', 'r');
hold off;

if (ALPHA >= .8 && ALPHA <= 1.2)
  disp('#####################################################################');
  disp('%%%%%%%%%%%%%%%%%Using eq. 5 from Li and Ma 1983%%%%%%%%%%%%%%%%%%%%%');
  disp('#####################################################################');
  disp('H_0, Null hypothesis - Significance is not a std normal distribution');
  disp('H_a, Alternate hypothesis - Significance is a std normal distribution');
  disp('%%%%%%%%%%%%%%%%%%%%%%%%% Test Data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  [PVAL H] = isnorm(SIG);
  if (H == 1)
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    printf('\t\t\tSIGNAL PRESENT\n');
  else
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    printf('\t\t\t\tNO SIGNAL\n');
  end
else
  disp('#####################################################################');
  disp('%%%%%%%%%%%%%%%%Using eq. 17 from Li and Ma 1983%%%%%%%%%%%%%%%%%%%%%');
  disp('#####################################################################');
  disp('H_0, Null hypothesis - Significance is not a std normal distribution');
  disp('H_a, Alternate hypothesis - Significance is a std normal distribution');
  disp('#####################################################################');
  if (STD -STD0 > 0.1)
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    printf('\t\t\tSIGNAL PRESENT\n');
  else
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    printf('\t\t\t\tNO SIGNAL\n');
  end
end

%printf('Total cpu time: %f seconds\n', cputime-time);
clear all;
endfunction