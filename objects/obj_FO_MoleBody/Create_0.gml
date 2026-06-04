spin_speed = irandom_range(-5, 5);
x_speed = irandom_range(-10, 10);
y_speed = irandom_range(-5, -10);
image_xscale = choose(-1, 1);

with (instance_create_depth(x, y - 25, depth - 1, agi("obj_FO_MoleGlasses"))) {
    spin_speed = -other.spin_speed;
    x_speed = -other.x_speed;
    y_speed = irandom_range(-5, -10);
}

alarm_set(0, 120);
