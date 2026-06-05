draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(agi("fnt_ComicSansSmall"));
var _draw_x = 621;
var _draw_y = 286;

if (instance_exists(agi("obj_Unq_SuspiciousKey")))
    _draw_y += 50;

var _current_y = 0;
    
if (global.fo.scoremult.gloober > 1) {
    draw_sprite(agi("spr_FO_Status_Gloober"), image_index, _draw_x + 25, _draw_y + 25 + _current_y);
    draw_text(_draw_x + 50, _draw_y + 25 + _current_y, "x" + string(global.fo.scoremult.gloober));
    _current_y += 50;
}
    
if (global.fo.scoremult.boxofnails > 1) {
    draw_sprite(agi("spr_FO_Status_BoxOfNails"), image_index, _draw_x + 25, _draw_y + 25 + _current_y);
    draw_text(_draw_x + 50, _draw_y + 25 + _current_y, "x" + string(global.fo.scoremult.boxofnails));
    _current_y += 50;
}
    
if (global.fo.scoremult.heartmonitor > 1) {
    draw_sprite(agi("spr_FO_Status_HeartMonitor"), image_index, _draw_x + 25, _draw_y + 25 + _current_y);
    draw_text(_draw_x + 50, _draw_y + 25 + _current_y, "x" + string(global.fo.scoremult.heartmonitor));
    _current_y += 50;
}
    
if (global.fo.scoremult.piyopiyos > 1) {
    draw_sprite(agi("spr_FO_Status_PiyoPiyos"), image_index, _draw_x + 25, _draw_y + 25 + _current_y);
    draw_text(_draw_x + 50, _draw_y + 25 + _current_y, "x" + string(global.fo.scoremult.piyopiyos));
    _current_y += 50;
}