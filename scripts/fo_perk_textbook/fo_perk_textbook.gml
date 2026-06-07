// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_perk_textbook(){
	var perk_id = "textbook";
	var data = {
	    name: "perk_name_textbook",
	    spr: "spr_FO_Perk_Textbook",
	    trig: "PegHalve5",
	    rarity: 1,
	    type: 0,
	    pool: 1,
	    colour: 3386879,
	    augmenteffect: 0,
	    desc: "perk_desc_textbook"//, "\n", "'")
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