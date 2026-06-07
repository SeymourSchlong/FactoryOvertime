// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_chocolatecoin(){
	var item_id = "chocolatecoin";
	var data = {
	    name: "item_name_chocolatecoin",
	    spr: "spr_FO_I_ChocolateCoin",
	    sprupgr: "spr_FO_I_S_ChocolateCoin",
	    type: 1,
	    rarity: RARITY.ULTRARARE,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.CAFE,
	    price: 20,
	    trig: "Eat",
	    alttrig: "",
	    desc: "item_desc_chocolatecoin",
	    upgr: "item_upgr_chocolatecoin",
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
		food_crumb_colors: [ #efd91c, #713400 ],
		on_create: function() {},
		on_trigger: function(this) {
            if (instance_exists(obj_CafeMouth))
            {
                with (obj_CafeMouth)
                {
                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
                    _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_chocolatecoin");
                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 1.3);
                }
            }
            
            if (obj_LvlMGMT.MaxMoney == 99)
            {
                obj_LvlMGMT.MaxMoney += 1;
            }
            
            obj_LvlMGMT.MaxMoney += 20;
			
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
		food_crumb_colors: [ #f4b3ff, #713400 ],
		on_create: function() {},
		on_trigger: function(this) {
            if (instance_exists(obj_CafeMouth))
            {
                with (obj_CafeMouth)
                {
                    var _DialogueBox = instance_create_depth(x, y, depth - 1, obj_CafeDialogue);
                    _DialogueBox.CafeDialogueStr = scr_Text("food_eat_confirm_chocolatecoin");
                    audio_play_sound(au_FoodEffect, 1, 0, 1, 0, 1.3);
                }
            }
            
            if (obj_LvlMGMT.MaxMoney == 99)
            {
                obj_LvlMGMT.MaxMoney += 1;
            }
            
            obj_LvlMGMT.MaxMoney += 50;
			
            obj_ItemMGMT.RecentEatenFoodDisp = obj_ItemMGMT.ItemID[this.MyItemID];
            obj_ItemMGMT.RecentEatenFoodDispID = this.MyItemID;
            obj_ItemMGMT.RecentEatenFood = this.MyItemID;
		}
	}, item_id + "_upgrade");
}