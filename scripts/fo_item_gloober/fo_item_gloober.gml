// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_gloober(){
	var item_id = "gloober";
	var data = {
	    name: "item_name_FO_gloober",
	    spr: "spr_FO_I_Gloober",
	    sprupgr: "spr_FO_I_S_Gloober",
	    type: 0,
	    rarity: RARITY.ULTRARARE,
	    augment: "none",
	    category: "passive",
	    pool: ITEMPOOL.SHOP,
	    price: 15,
	    trig: "NubbyBounce",
	    alttrig: "NubbyBounce5",
	    desc: "item_desc_FO_gloober",
	    upgr: "item_upgr_FO_gloober",
	    weight: [1, 3, 3]
	}
	
	forgery.subscribe_to_game_event("NubbyBounce", function() {
		//scr_FO_GlooberIncrease();
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
		on_trigger: function(this) {
			global.fo.scoremult.gloober += 0.01;
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
			global.fo.scoremult.gloober += 0.03;
		}
	}, item_id + "_upgrade");
}