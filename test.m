%TEST PROGRAM
%sig_1 = 0.682
%sig_2 = 0.954
%sig_3 = 0.997
%sig_4 = 0.999
%sig_5 = 0.999999
%sig_6 = 0.999999998
%sig_7 = 0.999999999997
clear all;
close all;
ALPHA = 1;
SNR = 0.01;
STD = [];
for i = 1:1e3
  [MEAN VAR SIG COUNT BINS] = setup(ALPHA, SNR, [1 1e5]);
  STD = [STD ; sqrt(VAR)];
end;
printf("sigma = %d\n", mean(STD));

