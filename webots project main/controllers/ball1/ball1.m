
TIME_STEP = 64;

gps = wb_robot_get_device('gps');
wb_gps_enable(gps, TIME_STEP);
b_state = 0;
red_score = 0;
blue_score =0;
ball_node = wb_supervisor_node_get_from_def('ball1');
trans_field = wb_supervisor_node_get_field(ball_node, 'translation');

wb_console_print(' ', WB_STDOUT );
wb_console_print(' ', WB_STDOUT );
wb_console_print('==================================================', WB_STDOUT );
wb_console_print(sprintf('              %g - RED TEAM : BLUE TEAM - %g\n  ', red_score, blue_score), WB_STDOUT );
wb_console_print('==================================================', WB_STDOUT );

while wb_robot_step(TIME_STEP) ~= -1

 values = wb_gps_get_values(gps);
 x = values(1);
 y = values(2);
 z = values(3);
 %wb_console_print(sprintf('THE BALL is at position: %g %g %g\n', x, y, z), WB_STDOUT);
 %speed = wb_gps_get_speed(gps);
 
  if (b_state == 0)
   if(x >= 0.66 & z <= 0.1 & z >= -0.1)
     red_score = red_score + 1;
     wb_console_print(' ', WB_STDOUT );
     wb_console_print(' ', WB_STDOUT );
     wb_console_print(' ', WB_STDOUT );
     wb_console_print(' ', WB_STDOUT );
     wb_console_print('==================================================', WB_STDOUT );
     wb_console_print(sprintf('              %g - RED TEAM : BLUE TEAM - %g\n  ', red_score, blue_score), WB_STDOUT );
     wb_console_print('==================================================', WB_STDOUT );
     wb_console_print('Red team scored!', WB_STDOUT );
     b_state = 1;
   end
  end
     if(x > -0.066 & x < 0.66)
      b_state = 0;
   end
  if (b_state == 0)
    if(x <= -0.66 & z <= 0.1 & z >= -0.1)
     blue_score = blue_score + 1;
     wb_console_print(' ', WB_STDOUT );
     wb_console_print(' ', WB_STDOUT );
     wb_console_print(' ', WB_STDOUT );
     wb_console_print(' ', WB_STDOUT );
     wb_console_print('==================================================', WB_STDOUT );
     wb_console_print(sprintf('              %g - RED TEAM : BLUE TEAM - %g\n  ', red_score, blue_score), WB_STDOUT );
     wb_console_print('==================================================', WB_STDOUT );
     wb_console_print('Blue team scored!', WB_STDOUT );
     b_state = 1;
     end
   end
   if(x < 0.066 & x > -0.66)
      b_state = 0;
   end
   if(x > 0.7 || x < -0.7)
    INITIAL = [0, 0.3, 0];
    wb_supervisor_field_set_sf_vec3f(trans_field, INITIAL);
    wb_supervisor_node_reset_physics(ball_node);
    wb_console_print('out', WB_STDOUT );
   end

end