function fo_perk_magicwand(){
	var perk_id = "magicwand";
	var data = {
	    name: "perk_name_FO_magicwand",
	    spr: "spr_FO_Perk_MagicWand",
	    trig: "Passive",
	    rarity: 2,
	    type: 0,
	    pool: 0,
	    colour: 0,
	    augmenteffect: 0,
	    desc: "perk_desc_FO_magicwand"
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
		on_create: function() {
			// update description for this perk type
		},
		on_trigger: function() {}
	}, perk_id);
}