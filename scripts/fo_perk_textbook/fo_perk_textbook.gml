function fo_perk_textbook(){
	var perk_id = "textbook";
	var data = {
	    name: "perk_name_FO_textbook",
	    spr: "spr_FO_Perk_Textbook",
	    trig: "PegHalve5",
	    rarity: 1,
	    type: 0,
	    pool: 1,
	    colour: 3386879,
	    augmenteffect: 0,
	    desc: "perk_desc_FO_textbook"
	}

	forgery.register_perk({
		display_name: data.name,
		description: data.desc,
		description_args: ["\n", "\""],
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
				for (var i = 1; i < array_length(obj_ItemMGMT.ItemInst); i += 1) {
			        if (instance_exists(obj_ItemMGMT.ItemInst[i]) && obj_ItemMGMT.ItemInst[i] != -1) {
			            if (obj_ItemMGMT.GeneralEffect[obj_ItemMGMT.ItemInst[i].MyItemID] == "doubler")
			                scr_ForceTrigger(i, 1);
			        }
			    }
			}
		}
	}, perk_id);
}