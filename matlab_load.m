valori_roll = load('roll_fermo.mat');
valori_gx=load('gx_fermo.mat');
valori_ax=load('ax_fermo.mat');
valori_ay=load('ay_fermo.mat');
valori_az=load('az_fermo.mat');


% Estraggo la time series dalla struttura caricata
roll = valori_roll.roll;
gx=valori_gx.gx;
ax=valori_ax.ax;
ay=valori_ay.ay;
az=valori_az.az;


% Estraggo i dati dalla time series
data_roll = roll.Data;
data_gx=gx.Data;
data_ax=ax.Data;
data_ay=ay.Data;
data_az=az.Data;

%Plots
figure(1);
subplot(2, 1, 1);
plot(data_roll(:,:), 'o-', 'MarkerSize', 5); 
 xlabel('t');
% ylabel('gx');
title('roll');

subplot(2, 1, 2);
plot(data_gx(:,:), 'o-', 'MarkerSize', 0.5); 
xlabel('t');
%ylabel('theta');
title('gx');

figure(3)
subplot(3,1,1)
plot(data_ax(:,:), 'o-', 'MarkerSize', 5); 
 xlabel('t');
% ylabel('gx');
title('ax');

subplot(3,1,2)
plot(data_ay(:,:), 'o-', 'MarkerSize', 5); 
 xlabel('t');
% ylabel('gx');
title('ay');

subplot(3,1,3)
plot(data_az(:,:), 'o-', 'MarkerSize', 5); 
 xlabel('t');
% ylabel('gx');
title('az');