// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item_heartmonitor(){
	var item_id = "heartmonitor";
	var data = {
	    name: "item_name_heartmonitor",
	    spr: "spr_FO_I_HeartMonitor",
	    sprupgr: "spr_FO_I_S_HeartMonitor",
	    type: 0,
	    rarity: RARITY.ULTRARARE,
	    augment: "passive",
	    category: "passive",
	    pool: ITEMPOOL.SHOP,
	    price: 15,
	    trig: "Passive",
	    alttrig: "",
	    desc: "item_desc_heartmonitor",
	    upgr: "item_upgr_heartmonitor",
	    weight: [1, 3, 3]
	}
	
	forgery.subscribe_to_game_event("HalfSecond", function() {
		scr_FO_HeartMonitorIncrease();
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