// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fo_item_lunchbag(){
	var item_id = "lunchbag";
	var data = {
	    name: "item_name_FO_lunchbag",
	    spr: "spr_FO_I_LunchBag",
	    sprupgr: "spr_FO_I_S_LunchBag",
	    type: 1,
	    rarity: RARITY.COMMON,
	    augment: "none",
	    category: "misc",
	    pool: ITEMPOOL.CAFE,
	    price: 7,
	    trig: "Eat",
	    alttrig: "",
	    desc: "item_desc_FO_lunchbag",
	    upgr: "item_upgr_FO_lunchbag",
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
		food_crumb_colors: [ #d9a066, #eec39a ],
		on_create: function() {},
		manage_own_trigger: true,
		on_trigger: function(this) {
			scr_UpdateSeed();
            var _ValidItems = ds_list_create();
            ds_list_clear(_ValidItems);
            
            for (var i = 0; i < array_length(obj_ItemMGMT.ItemID); i += 1)
            {
                if (obj_ItemMGMT.InItemPool[i] == 3 && i != this.MyItemID && i != 61 && i != 179)
                {
                    ds_list_add(_ValidItems, i);
                }
            }
            
            ds_list_shuffle(_ValidItems);
            var _Eaten = ds_list_find_value(_ValidItems, 0);
            scr_FoodEffect(_Eaten);
            ds_list_destroy(_ValidItems);
            
            //if (obj_ItemMGMT.ItemID[_Eaten] != 1 && obj_ItemMGMT.ItemID[_Eaten] != obj_ItemMGMT.ItemPair[1])
            //{
            //    obj_ItemMGMT.RecentEatenFoodDisp = obj_ItemMGMT.ItemID[_Eaten];
            //}
            
            //obj_ItemMGMT.RecentEatenFoodDispID = _Eaten;
            //obj_ItemMGMT.RecentEatenFood = _Eaten;
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
		food_crumb_colors: [ #ff1d0f, #d01a0c ],
		on_create: function() {},
		manage_own_trigger: true,
		on_trigger: function(this) {
			scr_UpdateSeed();
            var _ValidItems = ds_list_create();
            ds_list_clear(_ValidItems);
            
            for (var i = 0; i < array_length(obj_ItemMGMT.ItemID); i += 1)
            {
                if (obj_ItemMGMT.InItemPool[i] == 3 && i != this.MyItemID && i != 179)
                {
                    ds_list_add(_ValidItems, i);
                }
            }
            
            ds_list_shuffle(_ValidItems);
            var _Eaten = obj_ItemMGMT.ItemPair[ds_list_find_value(_ValidItems, 0)];
            scr_UpgrFoodEffect(_Eaten);
            ds_list_destroy(_ValidItems);
            
            //if (obj_ItemMGMT.ItemID[_Eaten] != 1 && obj_ItemMGMT.ItemID[_Eaten] != obj_ItemMGMT.ItemPair[1])
            //{
            //    obj_ItemMGMT.RecentEatenFoodDisp = obj_ItemMGMT.ItemID[_Eaten];
            //}
            
            //obj_ItemMGMT.RecentEatenFoodDispID = _Eaten;
            //obj_ItemMGMT.RecentEatenFood = _Eaten;
		}
	}, item_id + "_upgrade");
}