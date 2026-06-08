// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_littlepea(){
	var item_id = "littlepea";
	var data = {
	    name: "item_name_FO_littlepea",
	    spr: "spr_FO_I_Little_Pea",
	    sprupgr: "spr_FO_I_S_Little_Pea",
	    type: 1,
	    rarity: RARITY.COMMON,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.CAFE,
	    price: 1,
	    trig: "Eat",
	    alttrig: "",
	    desc: "item_desc_FO_littlepea",
	    upgr: "item_upgr_FO_littlepea",
	    weight: [0, 0, 0]
	}
	
	global.fo.littlepeas = 0;
	
	forgery.register_autosave_save_callback(function(data) {
		data[$ "littlepeas"] = global.fo.littlepeas;
	});
	
	forgery.register_autosave_load_callback(function(data) {
		global.fo.littlepeas = data[$ "littlepeas"];
	});
	
	
	forgery.subscribe_to_game_event("RestartRun", function(this) {
		global.fo.littlepeas = 0;
	});
	forgery.subscribe_to_game_event("QuitToTitle", function(this) {
		global.fo.littlepeas = 0;
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
		food: true,
		food_crumb_colors: [ #99e550, #47810e ],
		on_create: function() {},
		on_trigger: function(this) {
			if (instance_exists(obj_CafeMouth))
            {
                with (obj_CafeMouth)
                {
                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
                    _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_littlepea");
                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 1.3);
                }
            }
            
            global.fo.littlepeas++;
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
		food: true,
		food_crumb_colors: [ #50a5e5, #0e5181 ],
		on_create: function() {},
		on_trigger: function(this) {
			if (instance_exists(obj_CafeMouth))
            {
                with (obj_CafeMouth)
                {
                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
                    _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_littlepea");
                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 1.3);
                }
            }
			
            global.fo.littlepeas += 3;
		}
	}, item_id + "_upgrade");
}