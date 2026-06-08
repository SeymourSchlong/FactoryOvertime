// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_piyopiyos(){
	var item_id = "piyopiyos";
	var data = {
	    name: "item_name_FO_piyopiyos",
	    spr: "spr_FO_I_PiyoPiyos",
	    sprupgr: "spr_FO_I_S_PiyoPiyos",
	    type: 0,
	    rarity: RARITY.ULTRARARE,
	    augment: "none",
	    category: "passive",
	    pool: ITEMPOOL.SHOP,
	    price: 15,
	    trig: "Passive",
	    alttrig: "",
	    desc: "item_desc_FO_piyopiyos",
	    upgr: "item_upgr_FO_piyopiyos",
	    weight: [1, 3, 3]
	}
	
	forgery.subscribe_to_game_event("5Summoned", function() {
		scr_FO_PiyoPiyosIncrease();
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
		on_create: function() {},
		on_trigger: function(this) {}
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
		on_trigger: function(this) {}
	}, item_id + "_upgrade");
}