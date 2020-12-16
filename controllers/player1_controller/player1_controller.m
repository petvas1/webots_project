TIME_STEP = 64;

MAX_SPEED = 6.28;

left_motor = wb_robot_get_device('left wheel motor');
right_motor = wb_robot_get_device('right wheel motor');
wb_motor_set_position(left_motor, inf);
wb_motor_set_position(right_motor, inf);

wb_motor_set_velocity(left_motor, MAX_SPEED);
wb_motor_set_velocity(right_motor, MAX_SPEED);

gps = wb_robot_get_device('gps');
wb_gps_enable(gps, TIME_STEP);

while wb_robot_step(TIME_STEP) ~= -1
% wb_console_print('Hello!');
% x_y_z_array = wb_gps_get_values(gps);
values = wb_gps_get_values(gps);
wb_console_print(sprintf('MY_ROBOT is at position: %g %g %g\n', values(1), values(2), values(3)), WB_STDOUT);
speed = wb_gps_get_speed(gps);

end
