
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
				
				var _piggy = get_item_number_from_id("piggy");
				var _piggy_s = get_item_number_from_id("piggy_upgrade")

				// enabling item pools
				InItemPool[4] = 1;  // lobster claw
				InItemPool[10] = 1;	// evil goose
				InItemPool[12] = 1;	// sea cucumber
				InItemPool[15] = 2;	// fly agaric
				InItemPool[23] = 1;	// squirmy
				InItemPool[29] = 1;	// yeti
				InItemPool[44] = 1; // cheese house
				InItemPool[47] = 2;	// wingless fly
				InItemPool[52] = 1;	// laser pointer
				InItemPool[65] = 1; // poop butt
				InItemPool[get_item_number_from_id("piggy")] = 1;
				InItemPool[get_item_number_from_id("arthur")] = 1;
			
				/* total removed point givers:
				* [ 55/123]	two headed turtle	(1000/10x)	/ (2000/20x) -> turn into (60) 5x / (120) 10x
				*/
				
				var desc_update = [16, 23, 28, 29, 37, 44, 55, 65, _piggy];
			
				// sea cucumber
				ItemTier[12] = RARITY.ULTRARARE;
				ItemTier[80] = RARITY.ULTRARARE;
				// finger puppet
				ItemTier[16] = RARITY.RARE;
				ItemTier[84] = RARITY.RARE;
				// squirmy
				OddsWeightEarly[23] = 4;
				ItemDescBase[23] = scr_Text("item_desc29", "\n", 3);
				ItemDescBase[91] = scr_Text("item_desc97", "\n", 5);
				// flutty
				ItemDescBase[28] = scr_Text("item_desc28", "\n", 1);
				ItemDescBase[96] = scr_Text("item_desc96", "\n", 3);
				// yeti
				ItemDescBase[29] = scr_Text("item_desc29", "\n", 25);
				ItemDescBase[97] = scr_Text("item_desc97", "\n", 50);
				// friendly rock
				ItemDescBase[37] = scr_Text("item_desc37", "\n", 6, 4);
				ItemDescBase[105] = scr_Text("item_desc105", "\n", 9, 4);
				// cheese house
				ItemDescBase[44] = scr_Text("item_desc44", "\n", 30, 100, 30);
				ItemDescBase[112] = scr_Text("item_desc112", "\n", 75, 250, 30);
				// two headed turtle
				ItemTier[55] = RARITY.RARE;
				ItemTier[123] = RARITY.RARE;
				ItemDescBase[55] = scr_Text("item_desc55", "\n", 5, 60, 11);
				ItemDescBase[123] = scr_Text("item_desc123", "\n", 10, 120, 11);
				// poop butt
				ItemDescBase[65] = scr_Text("item_desc65", "\n", 1);
				ItemDescBase[133] = scr_Text("item_desc133", "\n", 4);
				// piggy purse
				OddsWeightEarly[_piggy] = 2;
				OddsWeightMid[_piggy] = 3;
				OddsWeightEnd[_piggy] = 5;
				ItemTier[_piggy] = RARITY.RARE;
				ItemTier[_piggy_s] = RARITY.RARE;
				ItemDescBase[_piggy] = scr_Text("item_desc_FO_piggypurseBM", "\n", 5, 0);
				ItemDescBase[_piggy_s] = scr_Text("item_upgr_FO_piggypurseBM", "\n", 15, 0);
				
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