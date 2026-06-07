// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_perk_pancake(){
	var perk_id = "pancake";
	var data = {
	    name: "perk_name_pancake",
	    spr: "spr_FO_Perk_Pancake",
	    trig: "NubbyDies",
	    rarity: 0,
	    type: 0,
	    pool: 1,
	    colour: 4235519,
	    augmenteffect: 0,
	    desc: "perk_desc_pancake"
	}

	forgery.register_perk({
		display_name: data.name,
		description: data.desc,
		sprite: agi(data.spr),
		game_event: data.trig,
		tier: data.rarity,
		type: data.type,
		pool: data.pool,
		trigger_fx_color: int64(data.colour),
		additional_info_type: 0,
		on_create: function() {},
		on_trigger: function(this) {
			with (this) {
				scr_ForceTrigger(2, 1);
			    scr_ForceTrigger(4, 1);
			    scr_ForceTrigger(6, 1);
			}
		}
	}, perk_id);
}