
function fo_challenge_math(){
	var challenge_id = "basicmath";
	var data = {
		display_name: "challenge_name_FO_math",
		description: "challenge_desc_FO_math",
		sprite: "spr_FO_Challenge",
		oval_sprite: "spr_FO_Challenge_Prev"
	}
	
	forgery.register_challenge({
		display_name: data.display_name,
		description: data.description,
		sprite: agi(data.sprite),
		oval_sprite: agi(data.oval_sprite),
		on_create: function(this, is_loading_from_autosave) {
			// disable TONY?!?!

			if (instance_exists(obj_EventMGMT))
			{
			    obj_EventMGMT.BossEvt[10] = -1;
			}

			for (var _i = 1; _i <= 111; _i++)
			{
			    obj_LvlMGMT.BaseNum[_i] = _i;
			    obj_LvlMGMT.Peg[_i] = "\"Peg #" + string(_i) + "\"";
			}

			for (var i = 0; i < array_length(obj_ItemMGMT.ItemID); i++)
			{
			    obj_ItemMGMT.OffsetPrice[i] = obj_ItemMGMT.OffsetPrice[i] - 2;
			    obj_ItemMGMT.ItemPrice[i] = obj_ItemMGMT.ItemPrice[i] - 2;
    
			    if (i != 38)
			    {
			        obj_ItemMGMT.ItemPrice[i] = clamp(obj_ItemMGMT.ItemPrice[i], 1, 99);
			    }
    
			    if (obj_ItemMGMT.GeneralEffect[i] == "pointgiver")
			    {
			        obj_ItemMGMT.InItemPool[i] = 0;
			    }
			}
			obj_ItemMGMT.OffsetPrice[38] = -10;
			obj_ItemMGMT.OffsetPrice[159] = -10;
			obj_ItemMGMT.ItemPrice[38] = 0;
			obj_ItemMGMT.ItemPrice[159]	= 0;

			// enabling item pools
			obj_ItemMGMT.InItemPool[4] = 1;
			obj_ItemMGMT.InItemPool[10] = 1;
			obj_ItemMGMT.InItemPool[12] = 1;
			obj_ItemMGMT.InItemPool[29] = 1;
			// friendly rock
			obj_ItemMGMT.ItemDescBase[37] = scr_Text("item_desc37", "\n", 6, 4);
			obj_ItemMGMT.ItemDesc[37] = string_join("", obj_ItemMGMT.ItemTrigText[37], obj_ItemMGMT.ItemDescBase[37]);
			obj_ItemMGMT.ItemDescBase[105] = scr_Text("item_desc105", "\n", 9, 4);
			obj_ItemMGMT.ItemDesc[105] = string_join("", obj_ItemMGMT.ItemTrigText[105], obj_ItemMGMT.ItemDescBase[105]);
			// yeti
			obj_ItemMGMT.ItemDescBase[29] = scr_Text("item_desc29", "\n", 25);
			obj_ItemMGMT.ItemDesc[29] = string_join("", obj_ItemMGMT.ItemTrigText[29], obj_ItemMGMT.ItemDescBase[29]);
			obj_ItemMGMT.ItemDescBase[97] = scr_Text("item_desc97", "\n", 50);
			obj_ItemMGMT.ItemDesc[97] = string_join("", obj_ItemMGMT.ItemTrigText[97], obj_ItemMGMT.ItemDescBase[97]);

		}
	}, challenge_id)
}