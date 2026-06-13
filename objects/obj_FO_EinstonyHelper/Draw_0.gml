// draw the current trigger if the cursor is in the specified areas
var area_w = 109;
var area_h = 131;
var slot_origin_x = 567;
var slot_origin_y = 56;

var cur_x = obj_Cursor.x;
var cur_y = obj_Cursor.y;

if (cur_y < slot_origin_y || cur_y > slot_origin_y + area_h) exit;
	
for (var i = 0; i < 7; i++) {
		
	if (cur_x > slot_origin_x + area_w*i) {
		if (cur_x < slot_origin_x + area_w*i + area_w) {

			draw_sprite(agi("spr_FO_PromptBox"), ProboFr, 204, 690);
			// 340, 732
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(scr_LocalEqualFont(agi("fnt_ComicSansMed")));
			draw_set_color(c_black);
			draw_set_alpha(1);
				
			draw_text_scribble_ext(
				340,
				732,
				scr_Text(global.fo.einstony_triggers[i+1]),
				220
			);
				
			if (instance_exists(obj_Tony)) {
				obj_Tony.sprite_index = obj_TonyMGMT.TonyTalkSpr[obj_LvlMGMT.SVID];
			}
				
			alarm_set(1, 2);
				
			exit;
		}
	}
}