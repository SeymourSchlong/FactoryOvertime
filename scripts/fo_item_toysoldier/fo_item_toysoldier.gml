// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_toysoldier(){
	var item_id = "toysoldier";
	var data = {
	    name: "item_name_FO_toysoldier",
	    spr: "spr_FO_I_ToySoldier",
	    sprupgr: "spr_FO_I_S_ToySoldier",
	    type: 0,
	    rarity: RARITY.COMMON,
	    augment: "none",
	    category: "popper",
	    pool: ITEMPOOL.SHOP,
	    price: 8,
	    trig: "HalfSecond",
	    alttrig: "PegHalve5",
	    desc: "item_desc_FO_toysoldier",
	    upgr: "item_upgr_FO_toysoldier",
	    weight: [5, 5, 5]
	}
	
	forgery.register_item({
		display_name: data.name,
		description: data.desc,
		sprite: agi(data.spr),
		game_event: data.trig,
	    alt_game_event: data.alttrig,
		level: 1,
	    tier: real(data.rarity),
	    augment: data.augment,
	    effect: data.category,
	    pool: real(data.pool),
	    offset_price: data.price - (data.rarity > RARITY.COMMON ? 10 : 5),
		pair_id: "fo:" + item_id + "_upgrade",
		odds_weight_early: data.weight[0], 
		odds_weight_mid: data.weight[1], 
		odds_weight_end: data.weight[2],
		on_create: function() {},
		on_trigger: function(this) {
			var _soldier_count = instance_number(get_object_from_id("toysoldier")) + instance_number(get_object_from_id("toysoldier_upgrade"));
            
            repeat (_soldier_count) {
                var _column = irandom(4) + 1;
                var _valid_pegs = [];
                
                with (obj_ParPeg) {
                    if (PegDead == false) {
                        if (x == obj_LvlMGMT.RealGridX[_column])
                            array_push(_valid_pegs, self);
                    }
                }
                
                array_sort(_valid_pegs, function(arg0, arg1) {
                    return arg0.y - arg1.y;
                });
                var _pegs_in_column = min(array_length(_valid_pegs), 2);
                
                if (_pegs_in_column > 0) {
                    for (var _i = 0; _i < _pegs_in_column; _i++) {
                        if (_i == 0) {
                            with (instance_create_layer(obj_LvlMGMT.RealGridX[_column], this.y, "Prompts", agi("obj_FO_SoldierShot")))
                                y_target = _valid_pegs[_i].y;
                            
                            with (_valid_pegs[_i]) {
                                scr_PopPeg(self, "Explosion", 0);
                                scr_Part_SunExplode(scr_PartAmt(10));
                            }
                        } else {
                            with (_valid_pegs[_i]) {
                                scr_Part_SunExplode(scr_PartAmt(10));
                                scr_AddNumber(PegNum, id, "Half");
                            }
                        }
                    }
                } else {
                    instance_create_layer(obj_LvlMGMT.RealGridX[_column], this.y, "Prompts", agi("obj_FO_SoldierShot"));
                }
            }
            
            if (global.ItemSfx == true)
                audio_play_sound(agi("snd_MOD_Gun"), 1, 0, global.SFXGain/2, 0, choose(0.9, 1, 1.1));
		}
	}, item_id);
	
	forgery.register_item({
	    display_name: data.name,
		description: data.upgr,
		sprite: agi(data.sprupgr),
		game_event: data.trig,
	    alt_game_event: data.alttrig,
		level: 2,
	    tier: real(data.rarity),
	    augment: data.augment,
	    effect: data.category,
	    pool: 0,
	    offset_price: data.price - (data.rarity > RARITY.COMMON ? 10 : 5),
		pair_id: "fo:" + item_id,
		odds_weight_early: 0, 
		odds_weight_mid: 0, 
		odds_weight_end: 0,
		on_create: function() {},
		on_trigger: function(this) {
			var _soldier_count = instance_number(get_object_from_id("toysoldier")) + instance_number(get_object_from_id("toysoldier_upgrade"));
            
            repeat (_soldier_count) {
                var _column = irandom(4) + 1;
                var _valid_pegs = [];
                
                with (obj_ParPeg) {
                    if (PegDead == false) {
                        if (x == obj_LvlMGMT.RealGridX[_column])
                            array_push(_valid_pegs, self);
                    }
                }
                
                array_sort(_valid_pegs, function(arg0, arg1) {
                    return arg0.y - arg1.y;
                });
                var _pegs_in_column = min(array_length(_valid_pegs), 3);
                
                if (_pegs_in_column > 0) {
                    for (var _i = 0; _i < _pegs_in_column; _i++) {
                        if (_i == 0) {
                            with (instance_create_layer(obj_LvlMGMT.RealGridX[_column], this.y, "Prompts", agi("obj_FO_SoldierShot")))
                                y_target = _valid_pegs[_i].y;
                            
                            scr_PopPeg(_valid_pegs[_i], "Explosion", 0);
                        } else {
                            with (_valid_pegs[_i])
                                scr_AddNumber(PegNum, id, "Half");
                        }
                    }
                } else {
                    instance_create_layer(obj_LvlMGMT.RealGridX[_column], this.y, "Prompts", agi("obj_FO_SoldierShot"));
                }
            }
            
            if (global.ItemSfx == true)
                audio_play_sound(snd_MOD_Gun, 1, 0, global.SFXGain/2, 0, choose(0.9, 1, 1.1));
		}
	}, item_id + "_upgrade");
}