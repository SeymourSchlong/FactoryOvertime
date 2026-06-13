function fo_item_catalyst(){
	var item_id = "catalyst";
	var data = {
	    name: "item_name_FO_catalyst",
	    spr: "spr_FO_I_Catalyst",
	    type: 0,
	    rarity: RARITY.COMMON,
	    augment: "evil",
	    category: "passive",
	    pool: ITEMPOOL.NONE,
	    price: 10,
	    trig: "Passive",
	    desc: "item_desc_FO_catalyst",
	    weight: [10, 10, 10]
	}
	
	forgery.register_item({
		display_name: data.name,
		description: data.desc,
		sprite: agi(data.spr),
		game_event: data.trig,
	    alt_game_event: "",
		level: 1,
	    tier: real(data.rarity),
	    augment: data.augment,
	    effect: data.category,
	    pool: real(data.pool),
	    offset_price: data.price - (data.rarity > RARITY.COMMON ? 10 : 5),
		pair_id: "fo:" + item_id,
		odds_weight_early: data.weight[0], 
		odds_weight_mid: data.weight[1], 
		odds_weight_end: data.weight[2],
		on_create: function() {},
		on_trigger: function(this) {}
	}, item_id);
}