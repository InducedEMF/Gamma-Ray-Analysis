function retval = ga_main(percent_snr=0, ALPHA=1)

close all;

EQUATION = input('>>> Choose equation 5 || 17 || 0(both)from Li and Ma 1983: ');


%How many values to use
RANGE = [1 1e7];


%get control readings. Used to compare results
%no signal to noise ratio. No signal present
[SIG0x SIG0y] = ga_setup(ALPHA, 0, RANGE, EQUATION);


%get values to test against control
[SIGx SIGy] = ga_setup(ALPHA, percent_snr, RANGE, EQUATION);



if (EQUATION == 5)
    [count bins] = hist(real(SIGx), 30);
    [count1 bins1] = hist(real(SIG0x), 30);
    figure();
    plot(bins, count, 'r');
    hold on;
    plot(bins1, count1);
    hold off;
    
    
    figure();
    semilogy(bins, count, 'r');
    hold on;
    semilogy(bins1, count1);
    hold off;    
elseif (EQUATION == 17)
    [count bins] = hist(real(SIGx), 30);
    [count1 bins1] = hist(real(SIG0x), 30);
    figure();
    plot(bins, count, 'r');
    hold on;
    plot(bins1, count1);
    hold off;
  
  
    figure();
    semilogy(bins, count, 'r');
    hold on;
    semilogy(bins1, count1);
    hold off;
elseif (EQUATION == 0)
    [countx binsx] = hist(real(SIGx), 30);
    [county binsy] = hist(real(SIGy), 30);
    [count1x bins1x] = hist(real(SIG0x), 30);
    [count1y bins1y] = hist(real(SIG0y), 30);
    figure();
    hold on;
    semilogy(binsx, countx, 'r'); %test data 5
    semilogy(bins1x, count1x, 'b'); %control data 5
    semilogy(binsy, county, 'ro'); %test data 17
    semilogy(bins1y, count1y, 'bo'); %control data 17
    hold off;
    legend('test data 5', 'control data 5', 'test data 17', 'control data 17');
    title('Combined distribution for equation 5 and 17');
    xlabel('Sigma \sigma');
    ylabel('Number of Occurrences');
end
clear all;
endfunction
