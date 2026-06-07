// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_perk_copycat(){
	var perk_id = "copycat";
	var data = {
	    name: "perk_name_copycat",
	    spr: "spr_FO_Perk_Copycat",
	    trig: "2Second",
	    rarity: 0,
	    type: 0,
	    pool: 1,
	    colour: 0,
	    augmenteffect: 0,
	    desc: "perk_desc_copycat"//, "\n", 4)
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
				for (var i = 0; i <= 7; i++) {
			        var _force_triggered = false;
        
			        if (obj_ItemMGMT.Item[i] != -1) {
			            for (var j = 0; j <= 7; j++) {
			                if (j == i || _force_triggered == true)
			                    continue;
                
			                if (obj_ItemMGMT.Item[j] != -1) {
			                    _force_triggered = obj_ItemMGMT.Item[i] == obj_ItemMGMT.Item[j] || obj_ItemMGMT.Item[i] == obj_ItemMGMT.ItemPair[obj_ItemMGMT.Item[j]];
                    
			                    if (_force_triggered)
			                        scr_ForceTrigger(i, 1);
			                }
			            }
			        }
			    }
			}
		}
	}, perk_id);
}