clear, close all, clc;
%% txt file
fileName = 'TemperatureDataMeasurementX.txt';    % enter name of file to write data to

fileID = fopen(fileName,'w');
%% setup serial port
port = 'COM3';                  % set serial port where the arduino is connected
baudRate = 9600;                % set baud rate to the same value as in the arduino script

s = serialport(port,baudRate);
%% User interface panel
figure('Position',[500,500,170,200]);
StopButtonHandle = uicontrol(   'Style', 'PushButton', ...
                                'String', 'Stop', ...
                                'Callback', 'delete(gcbf)',...
                                'Position',[20,20,120,40]);

uicontrol(   'Style', 'text', ...
             'String', "reading data from serial port "+port, ...
             'Position',[20,100,120,40]);
%% read serial data and write to text file
while true
  SerialData = readline(s);
  fprintf(fileID,SerialData);

  if ~ishandle(StopButtonHandle)
      disp('reading serial data stopped by user');
      break;
  end
end

fclose(fileID);

disp("serial data written to "+fileName)