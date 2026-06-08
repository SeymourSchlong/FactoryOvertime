// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_redpill(){
	var item_id = "redpill";
	var data = {
	    name: "item_name_FO_redpill",
	    spr: "spr_FO_I_RedPill",
	    sprupgr: "spr_FO_I_S_RedPill",
	    type: 1,
	    rarity: RARITY.COMMON,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.CAFE,
	    price: 15,
	    trig: "Eat",
	    alttrig: "",
	    desc: "item_desc_FO_redpill",
	    upgr: "item_upgr_FO_redpill",
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
		food_crumb_colors: [ #AC0000, #FFFFFF ],
		on_create: function() {},
		on_trigger: function(this) {
			var _depth = this.depth - 8;
            var _mouth_x = this.x;
            var _mouth_y = this.y;
            
            if (instance_exists(obj_CafeMouth))
            {
                with (obj_CafeMouth)
                {
                    _depth = depth - 8;
                    _mouth_x = x;
                    _mouth_y = y;
                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
                    _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_redpill");
                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 1.3);
                }
            }
            
            var _MovingUnq = instance_create_depth(_mouth_x, _mouth_y, _depth, obj_UnqItemMove);
            _MovingUnq.sprite_index = agi("spr_I_SuspiciousKey");
            _MovingUnq.HeldUnqItem = 0;
			
            obj_ItemMGMT.RecentEatenFoodDisp = obj_ItemMGMT.ItemID[this.MyItemID];
            obj_ItemMGMT.RecentEatenFoodDispID = this.MyItemID;
            obj_ItemMGMT.RecentEatenFood = this.MyItemID;
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
		food_crumb_colors: [ #2055C0, #FFFFFF ],
		on_create: function() {},
		on_trigger: function(this) {
			var _depth = this.depth - 8;
            var _mouth_x = this.x;
            var _mouth_y = this.y;
            
            if (instance_exists(obj_CafeMouth))
            {
                with (obj_CafeMouth)
                {
                    _depth = depth - 8;
                    _mouth_x = x;
                    _mouth_y = y;
                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
                    _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_redpill");
                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 1.3);
                }
            }
            
            repeat (2)
            {
                var _MovingUnq = instance_create_depth(_mouth_x, _mouth_y, _depth, obj_UnqItemMove);
                _MovingUnq.sprite_index = agi("spr_I_SuspiciousKey");
                _MovingUnq.HeldUnqItem = 0;
            }
			
            obj_ItemMGMT.RecentEatenFoodDisp = obj_ItemMGMT.ItemID[this.MyItemID];
            obj_ItemMGMT.RecentEatenFoodDispID = this.MyItemID;
            obj_ItemMGMT.RecentEatenFood = this.MyItemID;
		}
	}, item_id + "_upgrade");
}