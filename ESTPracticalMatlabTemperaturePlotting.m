
fileName = 'TemperatureDataMeasurementX.txt'; % Enter name of data file to plot
data = dlmread(fileName);


time = data(:, 1); % Setting up the axes
temperature = data(:, 2);


plot(time, temperature); %Plotting the actual graph
xlabel('Time');
ylabel('Temperature');
title('Temperature vs Time');
grid on;