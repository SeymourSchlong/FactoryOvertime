// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_geeks(){
	var data = {
	    name: "item_name_geeks",
	    spr: spr_FO_I_Geeks,
	    sprupgr: spr_FO_I_S_Geeks,
	    type: 1,
	    rarity: RARITY.RARE,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.CAFE,
	    price: 13,
	    trig: "Eat",
	    alttrig: "",
	    desc: "item_desc_geeks",
	    upgr: "item_upgr_geeks",
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
		food: true,
		on_create: function() {},
		on_trigger: function(this) {}
	}, item_id + "_upgrade");
}