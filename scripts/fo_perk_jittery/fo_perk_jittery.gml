// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_perk_jittery(){
	var perk_id = "jittery";
	var data = {
	    name: "perk_name_jittery",
	    spr: "spr_FO_Perk_Jittery",
	    trig: "HalfSecond",
	    rarity: 0,
	    type: 0,
	    pool: 1,
	    colour: 0,
	    augmenteffect: 0,
	    desc: "perk_desc_jittery",
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
				var _Odds = random(100);
			    var _Rate = 20;
    
			    if (scr_FO_RandomWithLuck(_Odds, _Rate)) {
			        for (var i = 1; i < array_length(obj_ItemMGMT.ItemInst); i += 1) {
			            if (instance_exists(obj_ItemMGMT.ItemInst[i]) && obj_ItemMGMT.ItemInst[i] != -1) {
			                switch (obj_ItemMGMT.ItemInst[i].EvType) {
			                    case "HalfSecond":
			                    case "1Second":
			                    case "1andHalfSecond":
			                    case "2Second":
			                    case "2andHalfSecond":
			                    case "3Second":
			                    case "3andHalfSecond":
			                    case "4Second":
			                    case "5Second":
			                        scr_ForceTrigger(i, 1);
			                        break;
			                }
                
			                if (instance_exists(obj_SV4Manager)) {
			                    switch (obj_ItemMGMT.ItemInst[i].EvTypeAlt) {
			                        case "HalfSecond":
			                        case "1Second":
			                        case "1andHalfSecond":
			                        case "2Second":
			                        case "2andHalfSecond":
			                        case "3Second":
			                        case "3andHalfSecond":
			                        case "4Second":
			                        case "5Second":
			                            scr_ForceTrigger(i, 1);
			                            break;
			                    }
			                }
			            }
			        }
			    }
			}
		}
	}, perk_id);
}