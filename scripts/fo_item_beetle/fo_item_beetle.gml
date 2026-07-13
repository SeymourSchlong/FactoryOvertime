function fo_item_beetle(){
	var item_id = "beetle";
	var data = {
	    name: "item_name_FO_beetle",
	    spr: "spr_FO_I_Beetle",
	    sprupgr: "spr_FO_I_S_Beetle",
	    type: 0,
	    rarity: RARITY.COMMON,
	    augment: "none",
	    category: "doubleandhalver",
	    pool: ITEMPOOL.SHOP,
	    price: 7,
	    trig: "1Second",
	    alttrig: "NubbyBounce5",
	    desc: "item_desc_FO_beetle",
	    upgr: "item_upgr_FO_beetle",
	    weight: [5, 5, 4]
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
		pair_id: mod_id + ":" + item_id + "_upgrade",
		odds_weight_early: data.weight[0], 
		odds_weight_mid: data.weight[1], 
		odds_weight_end: data.weight[2],
		on_create: function() {},
		on_trigger: function(this) {
			var _TargetsHighest = (this.WhatSlot % 2) == 1;
			
			var _Target = noone;
			
			if (_TargetsHighest) {
				var _highest_peg = nnf_get_highest_peg(1);
				if (array_length(_highest_peg) > 0)
					_Target = _highest_peg[0];
			} else {
				var _lowest_peg = nnf_get_lowest_peg(1, 2);
				if (array_length(_lowest_peg) > 0)
					_Target = _lowest_peg[0];
			}
			
			if (_Target != noone) {
				if (instance_exists(_Target) && _Target.PegDead == false) {
					with (_Target) {
						instance_create_depth(x, y + 60, this.depth + 1, agi("obj_FO_Chunk"));
						scr_HalvePeg(id, -1, 0);
					}
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
		pair_id: mod_id + ":" + item_id,
		odds_weight_early: 0, 
		odds_weight_mid: 0, 
		odds_weight_end: 0,
		on_create: function() {},
		on_trigger: function(this) {
			var _TargetsHighest = (this.WhatSlot % 2) == 1;
			
			var _Targets = [];
			
			if (_TargetsHighest) {
				_Targets = nnf_get_highest_peg(2);
			} else {
				_Targets = nnf_get_lowest_peg(2, 2);
			}
			
			for (var _i = 0; _i < array_length(_Targets); _i++) {
				var _Target = _Targets[_i];
				if (_Target != noone) {
					if (instance_exists(_Target) && _Target.PegDead == false) {
						with (_Target) {
							instance_create_depth(x, y + 60, this.depth + 1, agi("obj_FO_BigChunk"));
							scr_HalvePeg(id, -1, 0);
						}
					}
				}
			}
		}
	}, item_id + "_upgrade");
}