clc
clear
close all

% User Selects
valid = 0;

while valid == 0    % Loop Ensures Only a Valid Drivecycle is Selected
    DC = input('Select a Drivecycle (1.MW130, 2.Road, 3.Urban): ');
    Drivecylce = DC;
    switch DC
        case 1
            load('ArtMW130.mat');
            valid = 1;
        case 2
            load('ArtRoad.mat');
            valid = 1;
        case 3
            load('ArtUrban.mat');
            valid = 1;
        otherwise
            disp('Please use a valid input...') % Forces User to Reselect Drivecycle
    end
end 
Drivecycle = [t,v]; % Creates the Drivecycle Variable for the Drivecycle Source in Simulink
simtime = t(end);   % Sets the Simulation Time for the Model

%% Coasting Down Coefficients
A = 93.086154;      %N
B = 2.5373490;      %N/(m/s)
C = 0.38382359;     %N/(m/s)^2

%% Vehicle Mass
M = 1200;           %kg

%% Wheel Radius
Rw = 0.281154;      %m
Jw = 2.24;          %kg-m^2

%% Final Drive Ratio
g0 = 3.173;

%% Coefficients
Crr = 0.015;
Cd = 0.3;
Af = 2.2; %m^2

%% Driver Control
P = 10;
I = 0.1;
D = 0;

%% Simulation
sim_res = sim('model.slx'); % Runs Simulation
%save('sim_res.mat');