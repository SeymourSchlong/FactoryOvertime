function fo_item_boxofnails(){
	var item_id = "boxofnails";
	var data = {
	    name: "item_name_FO_boxofnails",
	    spr: "spr_FO_I_BoxOfNails",
	    sprupgr: "spr_FO_I_S_BoxOfNails",
	    type: 0,
	    rarity: RARITY.ULTRARARE,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.SHOP,
	    price: 15,
	    trig: "PegFullPop",
	    alttrig: "30Popped",
	    desc: "item_desc_FO_boxofnails",
	    upgr: "item_upgr_FO_boxofnails",
	    weight: [1, 3, 3]
	}
	
	forgery.register_item({
		display_name: data.name,
		description: data.desc,
		description_args: ["\n", 5],
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
            global.fo.scoremult.boxofnails += 0.05;
		}
	}, item_id);
	
	forgery.register_item({
	    display_name: data.name,
		description: data.upgr,
		description_args: ["\n", 15],
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
            global.fo.scoremult.boxofnails += 0.15;
		}
	}, item_id + "_upgrade");
}