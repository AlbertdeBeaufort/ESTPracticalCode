fileName = 'TemperatureDataMeasurementX.txt'; % Enter name of data file to plot
data = dlmread(fileName);


time = data(:, 1)/1000; % Setting up the axes and vonverting milliseconds to seconds
temperature = data(:, 2);


plot(time, temperature); %Plotting the actual graph
xlabel('Time (s)');
ylabel('Temperature (C)');
title('Temperature vs Time');
grid on;
