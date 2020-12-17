
TIME_STEP = 64;

%gps = wb_robot_get_device('gps');
%wb_gps_enable(gps, TIME_STEP);

%while wb_robot_step(TIME_STEP) ~= -1
% wb_console_print('Hello!');
% x_y_z_array = wb_gps_get_values(gps);
%values = wb_gps_get_values(gps);
%wb_console_print(sprintf('MY_ROBOT is at position: %g %g %g\n', values(1), values(2), values(3)), WB_STDOUT);
%speed = wb_gps_get_speed(gps);

ps1 = wb_robot_get_device('ps1');
wb_position_sensor_enable(ps1, TIME_STEP);

while wb_robot_step(TIME_STEP) ~= -1
 
 values = wb_position_sensor_get_value(ps1);
 wb_console_print(sprintf('MY_ROBOT is at position: %g %g %g\n', values(1), values(2), values(3)), WB_STDOUT);
 
 
 drawnow;

end


