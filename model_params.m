clear 
close all
%% parametri necessari per la simulazione 

alpha = 0.9; % coefficiente del complementary filter
radiantitodeg= 180/pi; % coefficiente di conversione da radianti a gradi
degtoradianti = pi/180;
theta_0=0; %angolo iniziale di postura (statico)
epsilon_0=5;% ampiezza deadzone
lambda = -2; %guadagno 
lambda_feedforward = 0; %guadagno feedforward
dt= 0.01;
soglia_nonlin = 0.5;
beta = 0.5; 
%% matrici di rotazione IMU - TERNA DH

R_x_90 = [1 0 0 ; 0 cosd(90) sind(90) ; 0 -sind(90) cosd(90)];

R_z_90 = [cosd(90) sind(90) 0 ; -sind(90) cosd(90) 0 ; 0 0 1];

R_imu = R_z_90 * R_x_90;

% Inizializzazione R_est come matrice di identità 3x3
R0 = eye(3);
R_tilde = angle2dcm(0,0,0, 'ZYX');
R_est = R0*(R_tilde');

% Inizializzazione bias come vettore nullo 3x1
%bias= zeros(3, 1);
%bias_next = zeros(3,1);
yaw_old = 0;
ax_pre = 0;
q_init = [1 0 0 0]';

% filtro EKF

gravity = 9.81007;
%noise_gyro = 2.4e-3;        % Gyroscope noise(discrete), rad/s a caso
noise_gyro = 0.1 * degtoradianti ; %gyro noise from datasheet
%noise_acc = 2.83e-2 ;      % Accelerometer noise, m/s^2 a caso
noise_acc = 0.008 * gravity;
%gyro_bias = 0.01 ; %rad/s per ora valori a caso poi li misuro bene
%noise_acc = 2 ; %m/s^2 idem
bias_acc = [0.1 , 0.1 , 0.1];
bias_mag = 0.1;
gyro_bias_deg = [2.8823, 0.11539 , -2.30181];
gyro_bias = gyro_bias_deg*degtoradianti;
P_init = 1e-10 * eye(4);

%legge di controllo
%Jacobiani
l1 = 0.30; %[m]
Jre = [0 0 0 1 0 0]';
Jhe = [0 0 0 ; 0 0 l1 ; 0 -l1 0; 1 0 0; 0 1 0; 0 0 1];
Jrc = [0 0 0 0 0 0]';
Jhc = [0 0 0; 0 0 0; 0 0 0; 1 0 0; 0 1 0 ; 0 0 1];
kc = 1;
lambda_legrand = 1;

%% 
t1 = 150;
t2 = 300;


