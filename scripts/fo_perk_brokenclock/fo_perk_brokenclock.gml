function fo_perk_broken_clock(){
	var perk_id = "brokenclock";
	var data = {
	    name: "perk_name_FO_brokenclock",
	    //spr: "spr_FO_Perk_BrokenClock",
		spr: "spr_FO_I_BrokenClock",
	    trig: "Passive",
	    rarity: 2,
	    type: 0,
	    pool: 0,
	    colour: 0,
	    augmenteffect: 0,
	    desc: "perk_desc_FO_brokenclock"
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
		on_trigger: function() {}
	}, perk_id);
}