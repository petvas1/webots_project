% MATLAB controller for Webots
% File:          ball.m
% Date:
% Description:
% Author:
% Modifications:

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
%desktop;
%keyboard;

TIME_STEP = 64;

ps1 = wb_robot_get_device('ps1');
wb_position_sensor_enable(ps1, TIME_STEP);


while wb_robot_step(TIME_STEP) ~= -1

  values = wb_gps_get_values(gps);
  values2 = wb_position_sensor_get_value(ps1); 
  wb_console_print(sprintf('MY_ROBOT is at position: %g %g %g\n', values2(1), values2(2), values2(3)), WB_STDOUT);

end

% cleanup code goes here: write data to files, etc.
