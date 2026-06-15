function fo_perk_nubup(){
	var perk_id = "nubup";
	var data = {
	    name: "perk_name_FO_nubup",
	    //spr: "spr_FO_Perk_NubUp",
		spr: "spr_FO_I_NubUp",
	    trig: "Passive",
	    rarity: 2,
	    type: 0,
	    pool: 0,
	    colour: 0,
	    augmenteffect: 0,
	    desc: "perk_desc_FO_nubup"
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