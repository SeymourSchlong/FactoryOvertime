// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item_faultyrocket(){
	var item_id = "rocket";
	var data = {
	    name: "item_name_faultyrocket",
	    spr: "spr_FO_I_FaultyRocket",
	    sprupgr: "spr_FO_I_S_FaultyRocket",
	    type: 0,
	    rarity: RARITY.ULTRARARE,
	    augment: "none",
	    category: "scoremult",
	    pool: ITEMPOOL.SHOP,
	    price: 15,
	    trig: "5Second",
	    alttrig: "NubbyDies",
	    desc: "item_desc_faultyrocket",
	    upgr: "item_upgr_faultyrocket",
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
			var _Amt = obj_LvlMGMT.PotentialNum * 0.2;
            scr_AddNumber(_Amt, this, -1);
            scr_FX_MultiplyScore(this);
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
			var _Amt = obj_LvlMGMT.PotentialNum * 0.5;
            scr_AddNumber(_Amt, this, -1);
            scr_FX_MultiplyScore(this);
		}
	}, item_id + "_upgrade");
}