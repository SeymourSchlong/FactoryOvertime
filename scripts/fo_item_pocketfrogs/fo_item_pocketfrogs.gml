
function fo_item_pocketfrogs() {
	var item_id = "pocketfrogs";
	var data = {
	    name: "item_name_FO_pocketfrogs",
	    spr: "spr_FO_I_PocketFrogs",
	    sprupgr: "spr_FO_I_S_PocketFrogs",
	    type: 0,
	    rarity: RARITY.RARE,
	    augment: "none",
	    category: "popper",
	    pool: ITEMPOOL.SHOP,
	    price: 11,
	    trig: "LowestPop",
	    alttrig: "HalfSecond",
	    desc: "item_desc_FO_pocketfrogs",
	    upgr: "item_upgr_FO_pocketfrogs",
	    weight: [5, 3, 1]
	}
	
	forgery.register_item({
		display_name: data.name,
		description: data.desc,
		description_args: ["\n", 50],
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
		tags: ["forgery:mystery_box_friendly"],
		on_create: function() {},
		on_trigger: function(this) {
			var _Odds = nnf.random_chance(random(100), 50);
            
            if (_Odds) {
                if (global.ItemSfx == true)
                    audio_play_sound(agi("snd_FO_Frog"), 1, 0, global.SFXGain, 0, choose(0.9, 1, 1.1));
                
				var _highest_peg = nnf.get_highest_peg(1);
				
				if (array_length(_highest_peg) == 0) return;
				var _Tar = _highest_peg[0];
                
                if (instance_exists(_Tar) && _Tar.PegDead == false) {
                    with (_Tar) {
                        scr_PopPeg(id, -1, 0);
                        instance_create_depth(x, y, depth - 10, agi("obj_FO_PlasticFrog"));
                    }
                }
            }
		}
	}, item_id);
	
	forgery.register_item({
	    display_name: data.name,
		description: data.upgr,
		description_args: ["\n", 50],
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
			var _Odds = nnf.random_chance(random(100), 50);
            
            if (_Odds) {
                if (global.ItemSfx == true)
                    audio_play_sound(agi("snd_FO_Frog"), 1, 0, global.SFXGain, 0, choose(0.9, 1, 1.1));
                
				var _highest_peg = nnf.get_highest_peg(2);
				
				for (var _i = 0; _i < array_length(_highest_peg); _i++) {
					var _Tar = _highest_peg[_i];
                        
                    if (instance_exists(_Tar) && _Tar.PegDead == false) {
                        with (_Tar) {
                            scr_PopPeg(id, -1, 0);
                            instance_create_depth(x, y, depth - 10, agi("obj_FO_PlasticFrog"));
                        }
                    }
				}
            }
		}
	}, item_id + "_upgrade");
}