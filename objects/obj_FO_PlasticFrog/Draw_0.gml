var _alpha = 1;

if (alarm_get(0) < 5)
    _alpha = alarm_get(0) / 5;

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, _alpha);
