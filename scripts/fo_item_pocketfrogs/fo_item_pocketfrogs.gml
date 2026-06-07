
function fo_item_pocketfrogs() {
	var item_id = "pocketfrogs";
	var data = {
	    name: "item_name_pocketfrogs",
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
	    desc: "item_desc_pocketfrogs",
	    upgr: "item_upgr_pocketfrogs",
	    weight: [5, 3, 1]
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
			var _Odds = 0;
			
			_Odds = choose(1, 0);
            
            //if (agi("obj_ModMGMT").RandomWithLuck(random(100), 50))
            //    _Odds = 1;
            
            if (_Odds == 1) {
                if (global.ItemSfx == true)
                    audio_play_sound(agi("snd_MOD_Frog"), 1, 0, global.SFXGain, 0, choose(0.9, 1, 1.1));
                
                var _Target = -1;
                var _StoreGCell = 0;
                
                for (var i = 1; i < 22; i += 1) {
                    var _iTar = instance_position(obj_LvlMGMT.GridX[i], obj_LvlMGMT.GridY[i], obj_ParPeg);
                    
                    if (instance_exists(_iTar) && _iTar.PegDead == false) {
                        if (_Target == -1) {
                            _Target = _iTar.PegNum;
                            _StoreGCell = i;
                        }
                        
                        if (_iTar.PegNum > _Target) {
                            _Target = _iTar.PegNum;
                            _StoreGCell = i;
                        }
                    }
                }
                
                var _Tar = instance_position(obj_LvlMGMT.GridX[_StoreGCell], obj_LvlMGMT.GridY[_StoreGCell], obj_ParPeg);
                
                if (instance_exists(_Tar) && _Tar.PegDead == false) {
                    with (instance_position(obj_LvlMGMT.GridX[_StoreGCell], obj_LvlMGMT.GridY[_StoreGCell], obj_ParPeg)) {
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
			var _Odds = 0;
			
			_Odds = choose(1, 0);
            
            //if (agi("obj_ModMGMT").RandomWithLuck(random(100), 50))
            //    _Odds = 1;
            
            if (_Odds == 1) {
                if (global.ItemSfx == true)
                    audio_play_sound(agi("snd_MOD_Frog"), 1, 0, global.SFXGain, 0, choose(0.9, 1, 1.1));
                
                var _Target1 = -1;
                var _StoreGCell1 = 0;
                var _Target2 = -1;
                var _StoreGCell2 = 0;
                
                for (var i = 1; i < 22; i += 1) {
                    var _iTar = instance_position(obj_LvlMGMT.GridX[i], obj_LvlMGMT.GridY[i], obj_ParPeg);
                    
                    if (instance_exists(_iTar) && _iTar.PegDead == false) {
                        if (_Target1 == -1) {
                            _Target1 = _iTar.PegNum;
                            _StoreGCell1 = i;
                        }
                        
                        if (_iTar.PegNum > _Target1) {
                            _Target1 = _iTar.PegNum;
                            _StoreGCell1 = i;
                        }
                    }
                }
                
                if (instance_number(obj_ParPeg) > 1) {
                    for (var i = 1; i < 22; i += 1) {
                        var _iTar = instance_position(obj_LvlMGMT.GridX[i], obj_LvlMGMT.GridY[i], obj_ParPeg);
                        
                        if (instance_exists(_iTar) && _iTar.PegDead == false) {
                            if (_Target2 == -1) {
                                if (i != _StoreGCell1) {
                                    _Target2 = _iTar.PegNum;
                                    _StoreGCell2 = i;
                                }
                            }
                            
                            if (_iTar.PegNum > _Target2) {
                                if (i != _StoreGCell1) {
                                    _Target2 = _iTar.PegNum;
                                    _StoreGCell2 = i;
                                }
                            }
                        }
                    }
                }
                
                if (_StoreGCell1 != 0) {
                    var _Tar = instance_position(obj_LvlMGMT.GridX[_StoreGCell1], obj_LvlMGMT.GridY[_StoreGCell1], obj_ParPeg);
                        
                    if (instance_exists(_Tar) && _Tar.PegDead == false) {
                        with (instance_position(obj_LvlMGMT.GridX[_StoreGCell1], obj_LvlMGMT.GridY[_StoreGCell1], obj_ParPeg)) {
                            scr_PopPeg(id, -1, 0);
                            instance_create_depth(x, y, depth - 10, agi("obj_FO_PlasticFrog"));
                        }
                    }
                }
                    
                if (_StoreGCell2 != 0) {
                    var _Tar = instance_position(obj_LvlMGMT.GridX[_StoreGCell2], obj_LvlMGMT.GridY[_StoreGCell2], obj_ParPeg);
                        
                    if (instance_exists(_Tar) && _Tar.PegDead == false) {
                        with (instance_position(obj_LvlMGMT.GridX[_StoreGCell2], obj_LvlMGMT.GridY[_StoreGCell2], obj_ParPeg)) {
                            scr_PopPeg(id, -1, 0);
                            instance_create_depth(x, y, depth - 10, agi("obj_FO_PlasticFrog"));
                        }
                    }
                }
            }
		}
	}, item_id + "_upgrade");
}