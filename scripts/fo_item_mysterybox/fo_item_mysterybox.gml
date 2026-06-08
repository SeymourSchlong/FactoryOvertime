// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_mysterybox(){
	var item_id = "mysterybox";
	var data = {
	    name: "item_name_FO_mysterybox",
	    spr: "spr_FO_I_MysteryBox",
	    sprupgr: "spr_FO_I_S_MysteryBox",
	    type: 0,
	    rarity: RARITY.COMMON,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.SHOP,
	    price: 6,
	    trig: "NubbyLaunchItem",
	    alttrig: "",
	    desc: "item_desc_FO_mysterybox",
	    upgr: "item_upgr_FO_mysterybox",
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
		on_create: function(this) {
			this.MystBoxPool = [];
			array_push(MystBoxPool, 0);
			array_push(MystBoxPool, 2);
			array_push(MystBoxPool, 3);
			array_push(MystBoxPool, 4);
			array_push(MystBoxPool, 5);
			array_push(MystBoxPool, 9);
			array_push(MystBoxPool, 8);
			array_push(MystBoxPool, 10);
			array_push(MystBoxPool, 11);
			array_push(MystBoxPool, 12);
			array_push(MystBoxPool, 14);
			array_push(MystBoxPool, 16);
			array_push(MystBoxPool, 17);
			array_push(MystBoxPool, 20);
			array_push(MystBoxPool, 21);
			array_push(MystBoxPool, 22);
			array_push(MystBoxPool, 23);
			array_push(MystBoxPool, 24);
			array_push(MystBoxPool, 28);
			array_push(MystBoxPool, 29);
			array_push(MystBoxPool, 30);
			array_push(MystBoxPool, 32);
			array_push(MystBoxPool, 33);
			array_push(MystBoxPool, 34);
			array_push(MystBoxPool, 37);
			array_push(MystBoxPool, 40);
			array_push(MystBoxPool, 41);
			array_push(MystBoxPool, 52);
			array_push(MystBoxPool, 59);
			array_push(MystBoxPool, 55);
			array_push(MystBoxPool, 65);
			array_push(MystBoxPool, obj_ModMGMT.GetItemID(obj_MOD_I_ToySoldier));
			array_push(MystBoxPool, obj_ModMGMT.GetItemID(obj_MOD_I_NubUp));
			array_push(MystBoxPool, obj_ModMGMT.GetItemID(obj_MOD_I_FaultyRocket));
			array_push(MystBoxPool, obj_ModMGMT.GetItemID(obj_MOD_I_Beetle));
			array_push(MystBoxPool, obj_ModMGMT.GetItemID(obj_MOD_I_PocketFrogs));
		},
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