function fo_item_flupper(){
	var item_id = "flupper";
	var data = {
	    name: "item_name_FO_flupper",
	    spr: "spr_FO_I_Flupper",
	    sprupgr: "spr_FO_I_S_Flupper",
	    type: 0,
	    rarity: RARITY.RARE,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.SHOP,
	    price: 10,
	    trig: "NubbyLaunchItem",
	    alttrig: "",
	    desc: "item_desc_FO_flupper",
	    upgr: "item_upgr_FO_flupper",
	    weight: [3, 5, 4]
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
			with (this) {
				if (WhatSlot == 1) return;
            
	            var _target_slot = WhatSlot - 1;
	            var _target_id = obj_ItemMGMT.Item[_target_slot];
	            var _target_inst = obj_ItemMGMT.ItemInst[_target_slot];
            
	            if (_target_id == -1 || !_target_inst) return;
				if (obj_ItemMGMT.ItemAugment[_target_id] == "evil") return;
	            if (obj_ItemMGMT.ItemLevel[_target_id] == 2) return;
            
	            if (global.ItemSfx == true) {
	                audio_play_sound(au_Squid, 1, 0, 1);
	            }
            
	            with (_target_inst) {
	                if (ItemTemporary) {
	                    scr_MutateItem(0, obj_ItemMGMT.ItemPair[_target_id]);
	                }
	                else {
	                    scr_MutateItem(1, obj_ItemMGMT.ItemPair[_target_id]);
	                }
                
					scr_ItemEffectUpFX(x, y, id, 1);
	                scr_Part_Fireworks(scr_PartAmt(5));
	            }
			}
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
			with (this) {
				var _target_left = true;
	            var _target_right = true;
            
	            if (WhatSlot == 1) {
	                _target_left = false;
	            }
            
	            if (WhatSlot == 7) {
	                _target_right = false;
	            }
            
	            if (_target_left) {
	                var _target_slot = WhatSlot - 1;
	                var _target_id = obj_ItemMGMT.Item[_target_slot];
	                var _target_inst = obj_ItemMGMT.ItemInst[_target_slot];
                
	                if (_target_id != -1 && _target_inst && obj_ItemMGMT.ItemLevel[_target_id] == 1) {
	                    if (global.ItemSfx == true) {
	                        audio_play_sound(au_Squid, 1, 0, 1);
	                    }
                    
	                    with (_target_inst) {
	                        if (ItemTemporary) {
	                            scr_MutateItem(0, obj_ItemMGMT.ItemPair[_target_id]);
	                        }
	                        else {
	                            scr_MutateItem(1, obj_ItemMGMT.ItemPair[_target_id]);
	                        }
                        
							scr_ItemEffectUpFX(x, y, id, 1);
	                        scr_Part_Fireworks(scr_PartAmt(5));
	                    }
	                }
	            }
            
	            if (_target_right) {
	                var _target_slot = WhatSlot + 1;
	                var _target_id = obj_ItemMGMT.Item[_target_slot];
	                var _target_inst = obj_ItemMGMT.ItemInst[_target_slot];
                
	                if (_target_id != -1 && _target_inst && obj_ItemMGMT.ItemLevel[_target_id] == 1) {
	                    if (global.ItemSfx == true) {
	                        audio_play_sound(au_Squid, 1, 0, 1);
	                    }
                    
	                    with (_target_inst) {
	                        if (ItemTemporary) {
	                            scr_MutateItem(0, obj_ItemMGMT.ItemPair[_target_id]);
	                        }
	                        else {
	                            scr_MutateItem(1, obj_ItemMGMT.ItemPair[_target_id]);
	                        }
                        
							scr_ItemEffectUpFX(x, y, id, 1);
	                        scr_Part_Fireworks(scr_PartAmt(5));
	                    }
	                }
	            }
			}
		}
	}, item_id + "_upgrade");
}