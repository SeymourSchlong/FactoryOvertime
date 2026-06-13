function fo_item_acid(){
	var item_id = "acid";
	var data = {
	    name: "item_name_FO_acid",
	    spr: "spr_FO_I_Acid",
	    sprupgr: "spr_FO_I_S_Acid",
	    type: 1,
	    rarity: RARITY.COMMON,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.CAFE,
	    price: 5,
	    trig: "Eat",
	    alttrig: "",
	    desc: "item_desc_FO_acid",
	    upgr: "item_upgr_FO_acid",
	    weight: [0, 0, 0]
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
		food: true,
		food_crumb_colors: [ #25a200, #3aff00 ],
		on_create: function() {},
		on_trigger: function(this) {
			var _depth = this.depth - 8;
            var _mouth_x = this.x;
            var _mouth_y = this.y;
			
			var catalyst_slot = -1;
            
			for (var i = 1; i <= 7; i++) {
				if (obj_ItemMGMT.Item[i] == -1) continue;
				if (obj_ItemMGMT.Item[i] != get_item_number_from_id("catalyst")) continue;
				
				catalyst_slot = i;
				break;
			}
			
			// return early if no catalyst items
			if (catalyst_slot == -1) {
	            if (instance_exists(obj_CafeMouth))
	            {
	                with (obj_CafeMouth)
	                {
	                    _depth = depth - 8;
	                    _mouth_x = x;
	                    _mouth_y = y;
	                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
		                _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_acid_fail");
	                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 0.8);
						
	                }
	            }
			
	            obj_ItemMGMT.RecentEatenFoodDisp = obj_ItemMGMT.ItemID[this.MyItemID];
	            obj_ItemMGMT.RecentEatenFoodDispID = this.MyItemID;
	            obj_ItemMGMT.RecentEatenFood = this.MyItemID;
				return;
			}
			
			var acid_triggers = [
				{ 
					trigger: "12Popped",
					weight: 12,
				},
				{ 
					trigger: "15Popped",
					weight: 14,
				},
				{ 
					trigger: "20Popped",
					weight: 10,
				},
				{ 
					trigger: "30Popped",
					weight: 5,
				},
				{ 
					trigger: "1andHalfSecond",
					weight: 15,
				},
				{ 
					trigger: "2Second",
					weight: 17,
				},
				{ 
					trigger: "3Second",
					weight: 14,
				},
				{ 
					trigger: "FirstPop",
					weight: 5,
				},
				{ 
					trigger: "NubbyDies",
					weight: 8,
				},
				{ 
					trigger: "PassGoal",
					weight: 15,
				},
				{ 
					trigger: "PassGoalOnce",
					weight: 12,
				},
				{ 
					trigger: "12Summons",
					weight: 10,
				},
				{ 
					trigger: "PegDouble5",
					weight: 5,
				},
				{ 
					trigger: "PegHalve5",
					weight: 5,
				},
				{ 
					trigger: "NubbyBounce5",
					weight: 8,
				},
				{ 
					trigger: "NubbyBounce10",
					weight: 10,
				},
				{ 
					trigger: "HitWall3",
					weight: 10,
				},
				{ 
					trigger: "HitWall5",
					weight: 10,
				},
				{ 
					trigger: "PegFullPop",
					weight: 10,
				},
				{ 
					trigger: "HighestPop",
					weight: 5,
				},
				{ 
					trigger: "LowestPop",
					weight: 5,
				},
			];
			
            var weight_pool = ds_list_create();
            ds_list_clear(weight_pool);
			
			for (var i = 0; i < array_length(acid_triggers); i++) {
				repeat(acid_triggers[i].weight) {
                    ds_list_add(weight_pool, acid_triggers[i].trigger);
				}
			}
			
			var non_catalyst_slots = [];
			for (var i = 1; i <= 7; i++) {
				if (i == catalyst_slot) continue;
				array_push(non_catalyst_slots, i);
			}
			for (var i = 0; i < array_length(non_catalyst_slots); i++) {
				var slot = non_catalyst_slots[i];
				// slot trigger # 4 5 10
				//ds_list_add(weight_pool, $"S{slot}Trigger{4}");
				ds_list_add(weight_pool, $"S{slot}Trigger{5}");
				ds_list_add(weight_pool, $"S{slot}Trigger{10}");
			}
			if (catalyst_slot != 1) {
				ds_list_add(weight_pool, "ItemFire_Left");
			}
			if (catalyst_slot != 7) {
				ds_list_add(weight_pool, "ItemFire_Right");
			}
			
			ds_list_shuffle(weight_pool);
			var new_trigger = ds_list_find_value(weight_pool, 0);
				
			global.fo.einstony_triggers[catalyst_slot] = new_trigger;
				
			// destroy catalyst
			with (obj_ItemMGMT.ItemInst[catalyst_slot]) {
				scr_FX_ItemExplosion(1);
				instance_destroy();
				obj_ItemMGMT.Item[WhatSlot] = -1;
				obj_ItemMGMT.ItemInst[WhatSlot] = -1;
			}
            
            if (instance_exists(obj_CafeMouth))
            {
                with (obj_CafeMouth)
                {
                    _depth = depth - 8; 
                    _mouth_x = x;
                    _mouth_y = y;
                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
	                _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_acid", "\n", scr_Text(new_trigger));
	                audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 1.3);
                }
            }
			
            ds_list_destroy(weight_pool);
			
            obj_ItemMGMT.RecentEatenFoodDisp = obj_ItemMGMT.ItemID[this.MyItemID];
            obj_ItemMGMT.RecentEatenFoodDispID = this.MyItemID;
            obj_ItemMGMT.RecentEatenFood = this.MyItemID;
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
		food: true,
		food_crumb_colors: [ #a21e00, #ff3000 ],
		on_create: function() {},
		on_trigger: function(this) {
			var _depth = this.depth - 8;
            var _mouth_x = this.x;
            var _mouth_y = this.y;
			
			var catalyst_slots = [];
            
			for (var i = 1; i <= 7; i++) {
				if (obj_ItemMGMT.Item[i] == -1) continue;
				if (obj_ItemMGMT.Item[i] != get_item_number_from_id("catalyst")) continue;
				
				array_push(catalyst_slots, i);
			}
			
			// return early if no catalyst items
			if (array_length(catalyst_slots) == 0) {
	            if (instance_exists(obj_CafeMouth))
	            {
	                with (obj_CafeMouth)
	                {
	                    _depth = depth - 8;
	                    _mouth_x = x;
	                    _mouth_y = y;
	                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
		                _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_acid_fail");
	                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 0.8);
						
	                }
	            }
			
	            obj_ItemMGMT.RecentEatenFoodDisp = obj_ItemMGMT.ItemID[this.MyItemID];
	            obj_ItemMGMT.RecentEatenFoodDispID = this.MyItemID;
	            obj_ItemMGMT.RecentEatenFood = this.MyItemID;
				return;
			}
			
			var acid_triggers = [
				{ 
					trigger: "12Popped",
					weight: 17,
				},
				{ 
					trigger: "15Popped",
					weight: 14,
				},
				{ 
					trigger: "20Popped",
					weight: 10,
				},
				{ 
					trigger: "30Popped",
					weight: 2,
				},
				{ 
					trigger: "1andHalfSecond",
					weight: 15,
				},
				{ 
					trigger: "2Second",
					weight: 17,
				},
				{ 
					trigger: "3Second",
					weight: 5,
				},
				{ 
					trigger: "FirstPop",
					weight: 2,
				},
				{ 
					trigger: "NubbyDies",
					weight: 2,
				},
				{ 
					trigger: "PassGoal",
					weight: 15,
				},
				{ 
					trigger: "PassGoalOnce",
					weight: 2,
				},
				{ 
					trigger: "12Summons",
					weight: 10,
				},
				{ 
					trigger: "PegDouble5",
					weight: 10,
				},
				{ 
					trigger: "PegHalve5",
					weight: 10,
				},
				{ 
					trigger: "NubbyBounce5",
					weight: 12,
				},
				{ 
					trigger: "NubbyBounce10",
					weight: 10,
				},
				{ 
					trigger: "HitWall3",
					weight: 15,
				},
				{ 
					trigger: "HitWall5",
					weight: 10,
				},
				{ 
					trigger: "PegFullPop",
					weight: 15,
				},
				{ 
					trigger: "HighestPop",
					weight: 10,
				},
				{ 
					trigger: "LowestPop",
					weight: 10,
				},
			];
			
            var weight_pool = ds_list_create();
            ds_list_clear(weight_pool);
			
			for (var i = 0; i < array_length(acid_triggers); i++) {
				repeat(acid_triggers[i].weight) {
                    ds_list_add(acid_triggers[i].trigger, 0);
				}
			}
			
			var non_catalyst_slots = [];
			for (var i = 1; i <= 7; i++) {
				if (array_contains(catalyst_slots, i)) continue;
				array_push(non_catalyst_slots, i);
			}
			for (var i = 0; i < array_length(non_catalyst_slots); i++) {
				var slot = non_catalyst_slots[i];
				// slot trigger # 4 5 10
				ds_list_add(weight_pool, $"S{slot}Trigger{4}");
				ds_list_add(weight_pool, $"S{slot}Trigger{4}");
				ds_list_add(weight_pool, $"S{slot}Trigger{5}");
				ds_list_add(weight_pool, $"S{slot}Trigger{5}");
				ds_list_add(weight_pool, $"S{slot}Trigger{10}");
			}
			if (catalyst_slot != 1) {
				ds_list_add(weight_pool, "ItemFire_Left");
				ds_list_add(weight_pool, "ItemFire_Left");
			}
			if (catalyst_slot != 7) {
				ds_list_add(weight_pool, "ItemFire_Right");
				ds_list_add(weight_pool, "ItemFire_Right");
			}
			
			ds_list_shuffle(weight_pool);
			var new_trigger = ds_list_find_value(weight_pool, 0);
			
			for (var i = 0; i < array_length(catalyst_slots); i++) {
				var slot = catalyst_slots[i];
				global.fo.einstony_triggers[slot] = new_trigger;
				
				// destroy catalyst
				with (obj_ItemMGMT.ItemInst[slot]) {
					scr_FX_ItemExplosion(1);
					instance_destroy();
					obj_ItemMGMT.Item[WhatSlot] = -1;
					obj_ItemMGMT.ItemInst[WhatSlot] = -1;
				}
			}
            
            if (instance_exists(obj_CafeMouth))
            {
                with (obj_CafeMouth)
                {
                    _depth = depth - 8; 
                    _mouth_x = x;
                    _mouth_y = y;
                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
	                _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_acid", "\n", scr_Text(new_trigger));
	                audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 1.3);
                }
            }
			
            ds_list_destroy(weight_pool);
			
            obj_ItemMGMT.RecentEatenFoodDisp = obj_ItemMGMT.ItemID[this.MyItemID];
            obj_ItemMGMT.RecentEatenFoodDispID = this.MyItemID;
            obj_ItemMGMT.RecentEatenFood = this.MyItemID;
		}
	}, item_id + "_upgrade");
}