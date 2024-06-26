clear 
close all
%% parametri necessari per la simulazione 
% non è necessario runnare lo script, viene fatto automaticamente quando si
% avvia la simulazione

alpha = 0.3; % coefficiente del complementary filter
radiantitodeg= 180/pi; % coefficiente di conversione da radianti a gradi
theta_0=0; %angolo iniziale di postura (statico)
epsilon_0=5;% ampiezza deadzone
lambda = -2; %guadagno 
lambda_feedforward = 0; %guadagno feedforward
dt=0.002;

%% matrici di rotazione IMU - TERNA DH

R_x_90 = [1 0 0 ; 0 cosd(90) sind(90) ; 0 -sind(90) cosd(90)];

R_z_90 = [cosd(90) sind(90) 0 ; -sind(90) cosd(90) 0 ; 0 0 1];

R_imu = R_z_90 * R_x_90;