function fo_perk_nubup(){
	var perk_id = "nubup";
	var data = {
	    name: "perk_name_FO_nubup",
	    spr: "spr_FO_Perk_NubUp",
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
		on_create: function(this) {
			// update description for this perk type
			with (obj_PerkMGMT.PerkObj[this.MyPerkID]) {
				var trigger_condition = obj_PerkMGMT.PerkTrigger[MyPerkID];
				var perk = this.perk;
				var perk_count = instance_number(obj_PerkMGMT.PerkObj[MyPerkID]);
				var part_1 = scr_Text(trigger_condition, "\n");
				var part_2 = scr_Text("perk_desc_FO_nubup", "\n", perk_count*25);
				obj_PerkMGMT.PerkDescBase[MyPerkID] = part_2;
				
				MyDesc = string_concat(part_1, part_2);
			}
		},
		on_trigger: function() {}
	}, perk_id);
}