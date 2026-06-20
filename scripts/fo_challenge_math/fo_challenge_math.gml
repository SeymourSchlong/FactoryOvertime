
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

			with (obj_ItemMGMT) {
				for (var i = 0; i < array_length(ItemID); i++)
				{
				    OffsetPrice[i] = OffsetPrice[i] - 2;
				    ItemPrice[i] = ItemPrice[i] - 2;
				    ItemPrice[i] = clamp(ItemPrice[i], 1, 99);
    
				    if (GeneralEffect[i] == "pointgiver")
				    {
				        InItemPool[i] = 0;
				    }
				}
			
				// force dave's cost to be free
				OffsetPrice[38] = -10;
				OffsetPrice[159] = -10;
				ItemPrice[38] = 0;
				ItemPrice[159]	= 0;

				// enabling item pools
				InItemPool[4] = 1;  // lobster claw
				InItemPool[10] = 1;	// evil goose
				InItemPool[12] = 1;	// sea cucumber
				InItemPool[15] = 2;	// fly agaric
				InItemPool[23] = 1;	// squirmy
				InItemPool[29] = 1;	// yeti
				InItemPool[47] = 2;	// wingless fly
				InItemPool[52] = 1;	// laser pointer
				InItemPool[get_item_number_from_id("piggy")] = 1;
			
				/* total removed point givers:
				* [ 16/ 84]	finger puppet		(1)			/ (2)
				* [ 44/112]	cheese house		(300/3000)	/ (750/7500)
				* [ 55/123]	two headed turtle	(1000/10x)	/ (2000/20x)
				* [ 65/133]	poop butt			(15)		/ (40)
				* [ ??/ ??]	piggy purse			(100/per)	/ (300/per)
				*/
				
				var desc_update = [16, 23, 28, 29, 37, 44, 55, 65, get_item_number_from_id("piggy")];
			
				// squirmy
				// adjust the value in the description to say "3" instead of "5" / "5" instead of "10"
				OddsWeightEarly[23] = 4;
				ItemDescBase[23] = scr_Text("item_desc29", "\n", 3);
				ItemDescBase[91] = scr_Text("item_desc97", "\n", 5);
				// flutty
				// adjust the value in the description to say "1" instead of "3" / "3" instead of "5"
				ItemDescBase[28] = scr_Text("item_desc28", "\n", 1);
				ItemDescBase[96] = scr_Text("item_desc96", "\n", 3);
				// yeti
				// adjust the value in the description to say "25%" instead of "15%" / "50%" instead of "30%"
				ItemDescBase[29] = scr_Text("item_desc29", "\n", 25);
				ItemDescBase[97] = scr_Text("item_desc97", "\n", 50);
				// friendly rock
				// adjust the value in the description to say "6" instead of "32" / "9" instead of "256"
				ItemDescBase[37] = scr_Text("item_desc37", "\n", 6, 4);
				ItemDescBase[105] = scr_Text("item_desc105", "\n", 9, 4);
				// piggy purse
				// adjust the value in the descirption to say "5" instead of "100" / "15" instead of "300"
				OddsWeightEarly[get_item_number_from_id("piggy")] = 1;
				OddsWeightMid[get_item_number_from_id("piggy")] = 3;
				OddsWeightEnd[get_item_number_from_id("piggy")] = 5;
				ItemDescBase[get_item_number_from_id("piggy")] = scr_Text("item_desc_FO_piggypurse", "\n", 5, 0);
				ItemDescBase[get_item_number_from_id("piggy_upgrade")] = scr_Text("item_upgr_FO_piggypurse", "\n", 15, 0);
				
				for (var i = 0; i < array_length(desc_update); i++) {
					var _id = desc_update[i];
					var _pair = ItemPair[i];
					
					ItemDesc[_id] = string_join("", ItemTrigText[_id], ItemDescBase[_id]);
					ItemDesc[_pair] = string_join("", ItemTrigText[_pair], ItemDescBase[_pair]);
				}
			}
		}
	}, challenge_id)
}