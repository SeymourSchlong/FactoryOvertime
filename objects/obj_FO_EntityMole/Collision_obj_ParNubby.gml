with (other) {
	scr_BounceAndCol();
	move_bounce_solid(1);
}

with (instance_create_depth(x, y, depth - 1, agi("obj_FO_MoleBody"))) {
    if (other.upgraded)
        sprite_index = agi("spr_FO_S_MoleHit");
}
    
scr_FlyingNumber(x, y, 10092543, "Pop!", 3, 1);
instance_destroy(self);
	
if (global.ItemSfx == true)
    audio_play_sound(agi("au_Bonus"), 1, 0, global.SFXGain, 0, choose(0.9, 1, 1.1));

obj_LvlMGMT.CounterPegsFullPops += 1;
scr_GameEv("PegFullPop");
obj_LvlMGMT.CounterBounces += 1;
obj_LvlMGMT.NubbyBounces += 1;
obj_LvlMGMT.NubbyBounce5 += 1;
obj_LvlMGMT.NubbyBounce10 += 1;
scr_GameEv("NubbyBounce");

if (obj_LvlMGMT.NubbyBounce5 == 5) {
    scr_GameEv("NubbyBounce5");
    obj_LvlMGMT.NubbyBounce5 = 0;
}

if (obj_LvlMGMT.NubbyBounce10 == 10) {
    scr_GameEv("NubbyBounce10");
    obj_LvlMGMT.NubbyBounce10 = 0;
}
