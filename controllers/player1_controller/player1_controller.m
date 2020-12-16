% initialize basic info
time_step = 64;
max_speed = 6.28; %angular velocity

% set robot position and velocity
left_motor = wb_robot_get_device('left wheel motor');
right_motor = wb_robot_get_device('right wheel motor');
wb_motor_set_position(left_motor, inf);
wb_motor_set_position(right_motor, inf);
wb_motor_set_velocity(left_motor, 0);
wb_motor_set_velocity(right_motor, 0);

% movement of the robot
sides = 9;
side_length = 0.2;
wheel_radius = 0.0075;
linear_velocity = wheel_radius*max_speed;
side_time = side_length/linear_velocity;
time_start = wb_robot_get_time;

rotation_angle = 6.28/sides;
distance_btw_wheels = 0.052;
rotation_rate = 2*linear_velocity/distance_btw_wheels;
turn_duration = rotation_angle/rotation_rate;

rotation_start_time = time_start + side_time;
rotation_end_time = rotation_start_time + turn_duration;

% gps = wb_robot_get_device('gps');
% wb_gps_enable(gps, time_step);

% main loop:
% -perform simulation steps
while wb_robot_step(time_step) ~= -1
% movement of the robot
  left_speed = max_speed;
  right_speed = max_speed;
  current_time = wb_robot_get_time;
    if (rotation_start_time < current_time) && (current_time < rotation_end_time)
      left_speed = -max_speed;
      right_speed = max_speed;
    elseif current_time > rotation_end_time
      rotation_start_time = current_time + side_time;
      rotation_end_time = rotation_start_time + turn_duration;
    end
  wb_motor_set_velocity(left_motor, left_speed);
  wb_motor_set_velocity(right_motor, right_speed);

  %values = wb_gps_get_values(gps);
  %wb_console_print(sprintf('MY_ROBOT is at position: %g %g %g\n', values(1), values(2), values(3)), WB_STDOUT);
  %speed = wb_gps_get_speed(gps);

end
