
function fo_supervisor_king(){
	var supervisor_id = "king";
	var data = {
		display_name: "supervisor_name_FO_king",
		description: "supervisor_desc_FO_king",
		sprites: {
			idle_neutral: agi("spr_SV10IdleNeutral"),
			preview: agi("spr_SVPrev_Immortal"),
			preview_clicked: agi("spr_SVPrev_Immortal_Click"),
			angry: agi("spr_SV10Angry"),
			evil: agi("spr_SV10Evil"),
			head_swivel: agi("spr_SV10HeadSwivel"),
			scream: agi("spr_SV10Scream"),
			idle_happy: agi("spr_SV10IdleHappy"),
			idle_sad: agi("spr_SV10IdleSad"),
			idle_weird: agi("spr_SV10IdleWeird"),
		},
		clicked_sounds: [
			agi("au_TonyImmortal_VO1"),
			agi("au_TonyImmortal_VO2"),
			agi("au_TonyImmortal_VO3")
		],
		go_sound: agi("au_TonyImmortal_VOGo"),
		name_color: int64(#000000),
	}
	
	forgery.register_supervisor({
		display_name: data.display_name,
		description: data.description,
		sprites: data.sprites,
		clicked_sounds: data.clicked_sounds,
		go_sound: data.go_sound,
		name_color: data.name_color,
		cost: 0,
		on_create: function(this) {
			obj_PerkMGMT.InPerkItemPool[get_perk_number_from_id("treasure")] = 0;
			obj_ItemMGMT.InItemPool[46] = 0;
			obj_ItemMGMT.InItemPool[137] = 0;
			obj_ItemMGMT.InItemPool[138] = 0;
			obj_LvlMGMT.ComnOdds = 1000;
			obj_LvlMGMT.RareOdds = 0;
			obj_LvlMGMT.UltraRareOdds = 0;
			obj_LvlMGMT.PerkComnOdds = 1000;
			obj_LvlMGMT.PerkRareOdds = 0;
			obj_LvlMGMT.PerkUltraRareOdds = 0;
			global.Money = 8;
			this.UpgradeChance = 20;

			with (obj_ItemMGMT)
			{
			    for (var _i = 0; _i < array_length(ItemID); _i++)
			    {
			        if (InItemPool[_i] == 1 || InItemPool[_i] == 2)
			        {
			            if (ItemLevel[_i] == 1)
			            {
			                var _up_id = ItemPair[_i];
			                ItemPrice[_up_id] = floor(ItemPrice[_i] * 1.5);
			            }
			        }
        
			        if (ItemTier[_i] > 0)
			        {
			            OffsetPrice[_i] += 5;
			        }
        
			        ItemTier[_i] = 0;
			    }
			}

			with (obj_PerkMGMT)
			{
			    for (var _i = 0; _i < array_length(PerkID); _i++)
			    {
			        PerkTier[_i] = 0;
			    }
			}

		},
		on_step: function(this) {
			// make sure that these are never changed.
			obj_LvlMGMT.ComnOdds = 1000;
			obj_LvlMGMT.RareOdds = 0;
			obj_LvlMGMT.UltraRareOdds = 0;
			obj_LvlMGMT.PerkComnOdds = 1000;
			obj_LvlMGMT.PerkRareOdds = 0;
			obj_LvlMGMT.PerkUltraRareOdds = 0;
		},
		on_destroy: function(this) {}
	}, supervisor_id);
}