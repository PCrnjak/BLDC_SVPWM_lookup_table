clc 
clear

A = 10000; %% peak value of sine
sample = 2400; %% how many samples we take

step =  (2*pi) / (sample-1) ;
a1 = 0: step :(2*pi);
sin1 = A* sin(a1) + A ; %% move in y axis by A , to remove negative values

hold on;
grid on;

%% ploting saddle profile for visualization

out = sin1;
%%plot(out);
n=5;

axis([0 (sample*(n+1)) 0 (A+A*1.2)]);
B = repmat(out,1,n);
plot(B,'LineWidth', 3)


set(gca,'XTick',[0 sample/4 sample/3 sample/2 (2*sample)/3 sample],'XTickLabel',{'0','\pi/2','2\pi/3','\pi','4\pi/3','2\pi'})
 

out(end)
%% this will save lookup table as .txt file, in current folder. 
%%file = fopen('SIN_table.txt','wt');

%%enter path where you want to save your file,
file = fopen('C:\Users\Rope\Desktop\SIN_table.txt','wt');

%%split array to remove last comma from txt file
end_ = out(end);
out(end) = [];

if file > 0
  
     fprintf(file,' %.0f , ',out');
     fprintf(file,' %.0f  ',end_');
     fclose(file);
  
end


 

%% 



