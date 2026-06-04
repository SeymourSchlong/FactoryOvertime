if (scr_FO_is_challenge("basicmath"))
{
    var _is_negative = sprite_index == agi("spr_3DPegNumsNeg");
    var _num_string = string(image_index + 1);
    
    if (_is_negative)
    {
        _num_string = "-" + _num_string;
    }
    
    draw_set_font(scr_LocalEqualFont(agi("fnt_PegNum")));
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_black);
    scr_OutlineText(x, y, 0, 0, _num_string);
    draw_set_color(#F5F5D7);
    
    if (_is_negative)
    {
        draw_set_color(#FF3333);
    }
    
    draw_text(x, y, _num_string);
    exit;
}

draw_self();