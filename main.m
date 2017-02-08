function retval = main(percent_snr=0, ALPHA=1, PLOT=false)
close all;
%measure time taken for program to run
time = cputime;
%initiate the program with outputs of MEAN, VARIANCE and the distribution of 
%significance data or the max point of the histogram. Depending on wether
%equation 5 or equation 17 is used
RANGE = [1 1e7];
%get baseline readings
[MEAN0 STD0 SIG0 COUNT0 BINS0] = setup(1, 0, RANGE);

%get values to test against base line
[MEAN STD SIG COUNT BINS] = setup(ALPHA, percent_snr, RANGE);



if (ALPHA >= .5 && ALPHA <= 1.5)
  disp('#####################################################################');
  disp('%%%%%%%%%%%%%%%%%Using eq. 5 from Li and Ma 1983%%%%%%%%%%%%%%%%%%%%%');
  disp('#####################################################################');
  disp('H_0, Null hypothesis - Significance is not a std normal distribution');
  disp('H_a, Alternate hypothesis - Significance is a std normal distribution');
  disp('%%%%%%%%%%%%%%%%%%%%%%%%% Test Data %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
  figure(1);
  hist(SIG0, 40, 'facecolor', 'b');
  hold on;
  hist(real(SIG), 40, 'facecolor', 'w');
  hold off;
  title('Equation 5 - Test for significant SNR');
  xlabel('Value of Signal Occurence');
  ylabel('Number of Times Value Occured');
  legend('Standard Normal Dist', 'Test Data');
  if (MEAN - MEAN0 > 0.05)
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    printf('\t\t\tSIGNAL PRESENT\n');
  else
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    printf('\t\t\tNO SIGNAL\n');
  end
else
  disp('#####################################################################');
  disp('%%%%%%%%%%%%%%%%Using eq. 17 from Li and Ma 1983%%%%%%%%%%%%%%%%%%%%%');
  disp('#####################################################################');
  disp('H_0, Null hypothesis - Significance is not a std normal distribution');
  disp('H_a, Alternate hypothesis - Significance is a std normal distribution');
  disp('#####################################################################');
  
  %converting standard normal dist to chi-square dist
  x = SIG0.^2;
  %converting chi-square dist to chi dist and dividing by 2 due to double counts
  %of negative values that have become possitive due to squaring.
  %in essence getting rid of all the negative values of the normal dist
  x = sqrt(x)/2;
  figure(1);
  hist(x, 40, 'facecolor', 'b');
  hold on;
  hist(real(SIG), 40, 'facecolor', 'w');
  hold off;
  title('Equation 17 - Test for significant SNR');
  xlabel('Value of Signal Occurence');
  ylabel('Number of Times Value Occured');
  legend('Chi Dist -> df = 1', 'Test Data');
  MEAN = round(MEAN*10)/10
  MEAN0 = mean(x);
  MEAN0 = round(MEAN0*10)/10
  if (MEAN - MEAN0 >= 0.2)
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    printf('\t\t\tSIGNAL PRESENT\n');
  else
    disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    printf('\t\t\tNO SIGNAL\n');
  end
end
%just worked out the chi distribution to normal distribution correlation
%read over papers and get code to tell me if signal exists
%printf('Total cpu time: %f seconds\n', cputime-time);
clear all;
endfunction
