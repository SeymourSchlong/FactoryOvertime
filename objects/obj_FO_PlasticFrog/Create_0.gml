image_speed = 0;
image_index = irandom(9);
dir_x = choose(-1, 1);
dir_y = choose(-1, 1);
image_xscale = -dir_x;
image_yscale = -dir_y;
alarm_set(0, 40);
angle = 45;

if (dir_y == -1) {
    if (dir_x == 1)
        angle = 45;
    
    if (dir_x == -1)
        angle = 135;
} else {
    if (dir_x == -1)
        angle = 225;
    
    if (dir_x == 1)
        angle = 315;
}

motion_add(angle, 10);
friction = 0.4;
