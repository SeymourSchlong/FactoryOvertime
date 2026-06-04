// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item_wackomole(){
	var item_id = "wackomole";
	var data = {
	    name: "item_name_wackomole",
	    spr: "spr_FO_I_Mole",
	    sprupgr: "spr_FO_I_S_Mole",
	    type: 0,
	    rarity: RARITY.COMMON,
	    augment: "corrupted",
	    category: "misc",
	    pool: ITEMPOOL.BLACKMARKET,
	    price: 8,
	    trig: "1andHalfSecond",
	    alttrig: "PassGoal",
	    desc: "item_desc_wackomole",
	    upgr: "item_upgr_wackomole",
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
			var _empty_slots = ds_list_create();
            ds_list_clear(_empty_slots);
            
            for (var i = 0; i < instance_number(obj_GridCell); i += 1) {
                if (instance_exists(instance_find(obj_GridCell, i)) && (instance_find(obj_GridCell, i).ImEmpty == true || instance_find(obj_GridCell, i).TempDead == true)) {
                    with (instance_find(obj_GridCell, i)) {
                        if (!instance_position(x, y, agi("obj_FO_EntityMole")))
                            ds_list_add(_empty_slots, self);
                    }
                }
            }
            
            if (ds_list_size(_empty_slots) > 0) {
                ds_list_shuffle(_empty_slots);
                var _grid_slot = ds_list_find_value(_empty_slots, 0);
                instance_create_depth(_grid_slot.x, _grid_slot.y, 502, agi("obj_FO_EntityMole"));
                ds_list_delete(_empty_slots, 0);
            }
            
            ds_list_destroy(_empty_slots);
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
			var _empty_slots = ds_list_create();
            ds_list_clear(_empty_slots);
            
            for (var i = 0; i < instance_number(obj_GridCell); i += 1) {
                if (instance_exists(instance_find(obj_GridCell, i)) && (instance_find(obj_GridCell, i).ImEmpty == true || instance_find(obj_GridCell, i).TempDead == true)) {
                    with (instance_find(obj_GridCell, i)) {
                        if (!instance_position(x, y, agi("obj_FO_EntityMole")))
                            ds_list_add(_empty_slots, self);
                    }
                }
            }
            
            repeat (2) {
                if (ds_list_size(_empty_slots) > 0) {
                    ds_list_shuffle(_empty_slots);
                    var _grid_slot = ds_list_find_value(_empty_slots, 0);
                    
                    with (instance_create_depth(_grid_slot.x, _grid_slot.y, 502, agi("obj_FO_EntityMole"))) {
                        upgraded = true;
                        sprite_index = agi("spr_FO_S_MoleEmerge");
                    }
                    
                    ds_list_delete(_empty_slots, 0);
                }
            }
            
            ds_list_destroy(_empty_slots);
		}
	}, item_id + "_upgrade");
}