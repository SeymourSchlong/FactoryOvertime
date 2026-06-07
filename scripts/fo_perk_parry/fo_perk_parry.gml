// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_perk_parry(){
	var perk_id = "parry";
	var data = {
	    name: "perk_name_parry",
	    spr: "spr_FO_Perk_Parry",
	    trig: "CorruptTrigger",
	    rarity: 1,
	    type: 0,
	    pool: 1,
	    colour: 0,
	    augmenteffect: 0,
	    desc: "perk_desc_parry"//, "\n", 25)
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
				if (scr_FO_RandomWithLuck(random(100), 25)) {
			        if (instance_number(obj_ItemParent) > 0) {
			            var _TarItem = instance_find(obj_ItemParent, irandom(instance_number(obj_ItemParent) - 1));
			            scr_ForceTrigger(_TarItem.WhatSlot, 1);
			        }
			    }
			}
		}
	}, perk_id);
}