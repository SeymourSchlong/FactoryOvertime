// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_perk_treasure(){
	var perk_id = "treasure";
	var data = {
	    name: "perk_name_treasure",
	    spr: "spr_FO_Perk_Treasure",
	    trig: "30Popped",
	    rarity: 0,
	    type: 0,
	    pool: 1,
	    colour: 0,
	    augmenteffect: 0,
	    desc: "perk_desc_treasure"
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
			            var _item_rarity = obj_ItemMGMT.ItemTier[obj_ItemMGMT.ItemInst[i].MyItemID];
            
			            switch (_item_rarity) {
			                case 2:
			                    scr_ForceTrigger(i, 1);
                
			                case 1:
			                    scr_ForceTrigger(i, 1);
			                    break;
			            }
			        }
			    }
			}
		}
	}, perk_id);
}