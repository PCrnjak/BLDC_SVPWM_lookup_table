clc 
clear

var = 1039; %% variable to adjust peak value to number we want
A = 900; %% peak value of saddle = A * 2
sample = 1000; %% how many samples we take

step =  (2*pi) / (sample) ;
a1 = 0: step :(2*pi);

sin1 = var* sin(a1) ;
sin2 = var * sin(a1 - ((2*pi)/3)) ; %% faze shift of -120 deg
sin3 = var * sin(a1 + ((2*pi)/3)) ; %% faze shift of +120 deg

hold on;
grid on;


for i = 1 : sample+1
   V(i)=(min([sin1(i),sin2(i),sin3(i)]) + max([sin1(i),sin2(i),sin3(i)]) ) /2;
   phase(i) =  sin1(i) - V(i) + A;
end

%%plot(phase)
%% ploting saddle profile period for visualization

n=7;
B = repmat(phase,1,n)
%%plot(B,'LineWidth', 3) %% plot n periods but not interpolated

%%% if we want look up table of n periods of our sine wave
%%% We just downsample it to the size we want, here i want 10 bit  = 1024
%%% since i have 10 bit encoder for bldc motor and i cant fit every tick of
%%% encoder to one index of array

idx = 1:(n*(sample+1));                                 % Index
idxq = linspace(min(idx), max(idx), 1024);    % Interpolation Vector
Vi = interp1(idx, B, idxq, 'linear');       % Downsampled Vector
plot(Vi,'LineWidth', 3);



%% this will save lookup table as .txt file, in current folder. 
%%file = fopen('Space_Vector.txt','wt');

%%enter path where you want to save your file,
file = fopen('C:\Users\Rope\Desktop\Space_Vector.txt','wt');

%%split array to remove last comma from txt file
end_ = Vi(end);
Vi(end) = [];

if file > 0
     fprintf(file,' %.0f , ',Vi');
     fprintf(file,' %.0f  ',end_');
     fclose(file);
 end
%% 



