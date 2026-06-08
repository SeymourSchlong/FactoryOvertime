// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_ash(){
	var item_id = "ash";
	var data = {
	    name: "item_name_FO_ash",
	    spr: "spr_FO_I_Ash",
	    type: 0,
	    rarity: RARITY.COMMON,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.NONE,
	    price: 0,
	    trig: "",
	    alttrig: "",
	    desc: "item_desc_FO_ash",
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
		pair_id: "fo:arthur",
		odds_weight_early: data.weight[0], 
		odds_weight_mid: data.weight[1], 
		odds_weight_end: data.weight[2],
		on_create: function() {},
		on_trigger: function(this) {}
	}, item_id);
}