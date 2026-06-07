// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_arthur(){
	var item_id = "arthur";
	var data = {
	    name: "item_name_arthur",
	    spr: "spr_FO_I_Arthur",
	    sprupgr: "spr_FO_I_S_Arthur",
	    type: 0,
	    rarity: RARITY.COMMON,
	    augment: "corrupted",
	    category: "pointgiver",
	    pool: ITEMPOOL.BLACKMARKET,
	    price: 6,
	    trig: "NubbyDies",
	    alttrig: "20Summoned",
	    desc: "item_desc_arthur",
	    upgr: "item_upgr_arthur",
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
			with (this) {
				scr_AddNumber(global.Goal * 0.2, this, -1);
            
				if (irandom(9) == 1 || true) {
				    scr_AddNumber(global.Goal * 2, this, -1);
					scr_FX_ItemExplosion(1);
					
					with (obj_ItemMGMT.ItemInst[this.WhatSlot]) {
						instance_destroy(id);
					}
				    obj_ItemMGMT.Item[this.WhatSlot] = -1;
					//scr_MutateItem(0, get_item_number_from_id("ash"));
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
			scr_AddNumber(global.Goal * 0.5, this, -1);
            
            if (irandom(19) == 1) {
                scr_AddNumber(global.Goal * 5, this, -1);
                scr_FX_ItemExplosion(1);
                obj_ItemMGMT.Item[this.WhatSlot] = -1;
                instance_destroy(this);
            }
		}
	}, item_id + "_upgrade");
}