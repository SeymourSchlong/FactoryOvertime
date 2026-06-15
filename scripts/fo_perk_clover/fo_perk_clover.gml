function fo_perk_clover(){
	var perk_id = "clover";
	var data = {
	    name: "perk_name_FO_clover",
	    //spr: "spr_FO_Perk_Clover",
		spr: "spr_FO_I_Clover",
	    trig: "Passive",
	    rarity: 2,
	    type: 0,
	    pool: 0,
	    colour: 0,
	    augmenteffect: 0,
	    desc: "perk_desc_FO_clover"
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