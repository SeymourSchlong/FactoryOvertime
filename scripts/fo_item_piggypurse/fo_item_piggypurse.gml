function scr_FO_piggy_description(this, mult) {
	var trigger_condition = obj_ItemMGMT.ItemTrig[this.MyItemID]

	var part_1 = scr_Text(trigger_condition, "\n");

	// Our perk instance holds the perk struct in the variable `perk`
	var item = this.item;

	// Get the bottom part of the description filled with the current focused slot
	var part_2 = scr_Text(item.description, "\n", global.fo.piggy_coins*mult)
	// Join together
	return string_concat(part_1, part_2)
}


function fo_item_piggypurse(){
	var item_id = "piggy";
	var data = {
	    name: "item_name_piggypurse",
	    spr: "spr_FO_I_PiggyPurse",
	    sprupgr: "spr_FO_I_S_PiggyPurse",
	    type: 0,
	    rarity: RARITY.COMMON,
	    augment: "none",
	    category: "pointgiver",
	    pool: ITEMPOOL.SHOP,
	    price: 6,
	    trig: "FirstPop",
	    alttrig: "NubbyDies",
	    desc: "item_desc_piggypurse",
	    upgr: "item_upgr_piggypurse",
	    weight: [5, 4, 1]
	}
	
	global.fo.piggy_coins = 0;
	
	forgery.register_autosave_save_callback(function(data) {
		data[$ "piggy_coins"] = global.fo.piggy_coins;
	});
	
	forgery.register_autosave_load_callback(function(data) {
		global.fo.piggy_coins = data[$ "piggy_coins"];
	});
	
	
	forgery.subscribe_to_game_event("RestartRun", function(this) {
		global.fo.piggy_coins = 0;
	});
	forgery.subscribe_to_game_event("QuitToTitle", function(this) {
		global.fo.piggy_coins = 0;
	});
	
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
		on_create: function(this) {
			forgery.run_delayed(1, this, function(this) {
				this.MyDesc = scr_FO_piggy_description(this, 100);
			});
		},
		on_trigger: function(this) {
			var _is_rightmost = true;
            var _i = this.WhatSlot + 1;
            
            while (_i < array_length(obj_ItemMGMT.ItemInst))
            {
                if (instance_exists(obj_ItemMGMT.ItemInst[_i]) && obj_ItemMGMT.ItemInst[_i] != -1)
                {
                    _is_rightmost = false;
                }
                
                _i++;
            }
            
            if (_is_rightmost)
            {
                if (global.Money >= 1)
                {
                    global.Money -= 1;
                    global.fo.piggy_coins += 1;
                    //scr_UpdateDesc("Piggy");
                    
                    if (global.ItemSfx == true)
                    {
                        audio_play_sound(agi("snd_MOD_Pig"), 1, 0, global.SFXGain, 0, choose(0.9, 1, 1.1));
                    }
                }
            }
            
            scr_AddNumber(global.fo.piggy_coins * 100, this, -1);
			with (this.object_index) {
				self.MyDesc = scr_FO_piggy_description(self.id, 100);
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
		on_create: function(this) {
			forgery.run_delayed(1, this, function(this) {
				this.MyDesc = scr_FO_piggy_description(this, 300);
			});
		},
		on_trigger: function(this) {
			var _is_rightmost = true;
            var _i = this.WhatSlot + 1;
            
            while (_i < array_length(obj_ItemMGMT.ItemInst))
            {
                if (instance_exists(obj_ItemMGMT.ItemInst[_i]) && obj_ItemMGMT.ItemInst[_i] != -1)
                {
                    _is_rightmost = false;
                }
                
                _i++;
            }
            
            if (_is_rightmost)
            {
                if (global.Money >= 1)
                {
                    global.Money -= 1;
                    global.fo.piggy_coins += 1;
                    //scr_UpdateDesc("Piggy");
                    
                    if (global.ItemSfx == true)
                    {
                        audio_play_sound(agi("snd_MOD_Pig"), 1, 0, global.SFXGain, 0, choose(0.9, 1, 1.1));
                    }
                }
            }
            
            scr_AddNumber(global.fo.piggy_coins * 300, this, -1);
			with (this.object_index) {
				self.MyDesc = scr_FO_piggy_description(self.id, 300);
			}
		}
	}, item_id + "_upgrade");
}