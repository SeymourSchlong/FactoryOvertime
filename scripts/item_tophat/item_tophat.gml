
function item_tophat(){
	var item_id = "tophat";
	var data = {
	    name: "item_name_tophat",
	    spr: "spr_FO_I_TopHat",
	    sprupgr: "spr_FO_I_S_TopHat",
	    type: 0,
	    rarity: RARITY.COMMON,
	    augment: "corrupted",
	    category: "misc",
	    pool: ITEMPOOL.BLACKMARKET,
	    price: 7,
	    trig: "1Second",
	    alttrig: "PegFullPop",
	    desc: "item_desc_tophat",
	    upgr: "item_upgr_tophat",
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
            if (instance_exists(obj_ParNubby)) {
                if (irandom(99) < 15) {
                    var _angle = random(360);
					var _NubDupe = instance_create_depth(958, 350, instance_find(obj_ParNubby, 0).depth, agi("obj_FO_NubbyBunny"));
					
					with (_NubDupe) {
	                    motion_set(_angle, obj_LvlMGMT.NubbyLaunchSpd / 2);
						
						if (!instance_exists(agi("obj_FO_WarpHat"))) {
	                        with (instance_create_layer(x, y, "Prompts", agi("obj_FO_WarpHat"))) {
	                            image_angle = _angle;
	                            alarm_set(0, 15);
	                        }
	                    } else {
	                        with (agi("obj_FO_WarpHat")) {
	                            image_angle = _angle;
	                            alarm_set(0, 15);
	                        }
	                    }
					}
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
			if (instance_exists(obj_ParNubby)) {
                //with (obj_ParNubby) {
                    if (irandom(99) < 30) {
	                    var _angle = random(360);
						var _NubDupe = instance_create_depth(958, 350, instance_find(obj_ParNubby, 0).depth, agi("obj_FO_NubbyBunny"));
					
						with (_NubDupe) {
							motion_set(_angle, (obj_LvlMGMT.NubbyLaunchSpd * 3) / 4);
                        
	                        if (!instance_exists(agi("obj_FO_WarpHat"))) {
	                            with (instance_create_layer(x, y, "Prompts", agi("obj_FO_WarpHat"))) {
	                                image_angle = _angle;
	                                alarm_set(0, 15);
	                            }
	                        } else {
	                            with (agi("obj_FO_WarpHat")) {
	                                image_angle = _angle;
	                                alarm_set(0, 15);
	                            }
	                        }
						}
                    }
                //}
            }
		}
	}, item_id + "_upgrade");
}