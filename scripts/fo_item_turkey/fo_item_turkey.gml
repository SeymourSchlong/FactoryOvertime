
function fo_item_turkey(){
	var item_id = "turkey";
	var data = {
	    name: "item_name_FO_turkey",
	    spr: "spr_FO_I_Turkey",
	    sprupgr: "spr_FO_I_S_Turkey",
	    type: 1,
	    rarity: RARITY.ULTRARARE,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.CAFE,
	    price: 12,
	    trig: "Eat",
	    alttrig: "",
	    desc: "item_desc_FO_turkey",
	    upgr: "item_upgr_FO_turkey",
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
		food_crumb_colors: [ #efd91c, #713400 ],
		on_create: function() {},
		on_trigger: function(this) {
			var _valid = false;
			
			var _valid_items = [
				get_item_number_from_id("brokenclock"),
				get_item_number_from_id("brokenclock_upgrade"),
				get_item_number_from_id("clover"),
				get_item_number_from_id("clover_upgrade"),
				get_item_number_from_id("magicwand"),
				get_item_number_from_id("magicwand_upgrade"),
				get_item_number_from_id("nubup"),
				get_item_number_from_id("nubup_upgrade")
			];
			var _perks_to_give = [];
			
			with (obj_ItemMGMT) {
				for (var i = 1; i <= 7; i++) {
					if (Item[i] != -1 && ItemInst[i] != -1 && instance_exists(ItemInst[i])) {
						if (array_contains(_valid_items, Item[i])) {
							_valid = true;
						
							switch (Item[i]) {
								case _valid_items[1]:
									array_push(_perks_to_give, "brokenclock");
								case _valid_items[0]:
									array_push(_perks_to_give, "brokenclock");
									break;
									
								case _valid_items[3]:
									array_push(_perks_to_give, "clover");
								case _valid_items[2]:
									array_push(_perks_to_give, "clover");
									break;
									
								case _valid_items[5]:
									array_push(_perks_to_give, "magicwand");
								case _valid_items[4]:
									array_push(_perks_to_give, "magicwand");
									break;
									
								case _valid_items[7]:
									array_push(_perks_to_give, "nubup");
								case _valid_items[6]:
									array_push(_perks_to_give, "nubup");
									break;
							}
						
							with (ItemInst[i]) {
								scr_FX_ItemExplosion(self);
							}
							instance_destroy(ItemInst[i]);
						
							Item[i] = -1;
							ItemInst[i] = -1;
						}
					}
				}
			}
			
			
			if (array_length(_perks_to_give) > 0) {
				array_sort(_perks_to_give, true);
				
				var _perk_giver = instance_create_depth(0, 0, obj_ItemMGMT.depth, agi("obj_FO_PerkHelper"));
			
				with (_perk_giver) {
					for (var i = 0; i < array_length(_perks_to_give); i++) {
						//_perks_to_give
						var _perk_id = get_perk_number_from_id(_perks_to_give[i]);
						
						array_push(queue, _perk_id);
					}
				}
			}
			
            if (instance_exists(obj_CafeMouth))
            {
                with (obj_CafeMouth)
                {
                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
					
					if (_valid) {
	                    _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_turkey");
	                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 1.3);
					} else {
	                    _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_turkey_fail");
	                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 0.8);
					}
                }
            }
			
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
		food_crumb_colors: [ #f4b3ff, #713400 ],
		on_create: function() {},
		on_trigger: function(this) {
			var _valid = false;
			
			var _valid_items = [
				get_item_number_from_id("brokenclock"),
				get_item_number_from_id("brokenclock_upgrade"),
				get_item_number_from_id("clover"),
				get_item_number_from_id("clover_upgrade"),
				get_item_number_from_id("magicwand"),
				get_item_number_from_id("magicwand_upgrade"),
				get_item_number_from_id("nubup"),
				get_item_number_from_id("nubup_upgrade")
			];
			var _perks_to_give = [];
			
			with (obj_ItemMGMT) {
				for (var i = 1; i <= 7; i++) {
					if (Item[i] != -1 && ItemInst[i] != -1 && instance_exists(ItemInst[i])) {
						if (array_contains(_valid_items, Item[i])) {
							_valid = true;
						
							repeat(2) {
								switch (Item[i]) {
									case _valid_items[1]:
										array_push(_perks_to_give, "brokenclock");
									case _valid_items[0]:
										array_push(_perks_to_give, "brokenclock");
										break;
									
									case _valid_items[3]:
										array_push(_perks_to_give, "clover");
									case _valid_items[2]:
										array_push(_perks_to_give, "clover");
										break;
									
									case _valid_items[5]:
										array_push(_perks_to_give, "magicwand");
									case _valid_items[4]:
										array_push(_perks_to_give, "magicwand");
										break;
									
									case _valid_items[7]:
										array_push(_perks_to_give, "nubup");
									case _valid_items[6]:
										array_push(_perks_to_give, "nubup");
										break;
								}
							}
						
							with (ItemInst[i]) {
								scr_FX_ItemExplosion(self);
							}
							instance_destroy(ItemInst[i]);
						
							Item[i] = -1;
							ItemInst[i] = -1;
						}
					}
				}
			}
			
			
			if (array_length(_perks_to_give) > 0) {
				array_sort(_perks_to_give, true);
				
				var _perk_giver = instance_create_depth(0, 0, obj_ItemMGMT.depth, agi("obj_FO_PerkHelper"));
			
				with (_perk_giver) {
					for (var i = 0; i < array_length(_perks_to_give); i++) {
						//_perks_to_give
						var _perk_id = get_perk_number_from_id(_perks_to_give[i]);
						
						array_push(queue, _perk_id);
					}
				}
			}
			
            if (instance_exists(obj_CafeMouth))
            {
                with (obj_CafeMouth)
                {
                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
					
					if (_valid) {
	                    _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_turkey");
	                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 1.3);
					} else {
	                    _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_turkey_fail");
	                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 0.8);
					}
                }
            }
			
            obj_ItemMGMT.RecentEatenFoodDisp = obj_ItemMGMT.ItemID[this.MyItemID];
            obj_ItemMGMT.RecentEatenFoodDispID = this.MyItemID;
            obj_ItemMGMT.RecentEatenFood = this.MyItemID;
		}
	}, item_id + "_upgrade");
}