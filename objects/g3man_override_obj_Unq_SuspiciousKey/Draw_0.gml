if (instance_find(obj_Unq_SuspiciousKey, 0) == id)
{
    draw_self();
    var _key_count = instance_number(obj_Unq_SuspiciousKey);
    if (_key_count > 1) {
		draw_set_colour(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_set_font(agi("fnt_ComicSansSmall"));
        draw_text(x + 20, y, "x" + string(_key_count));
    }
}