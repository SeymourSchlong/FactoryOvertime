
function fo_supervisor_einstony(){
	var supervisor_id = "einstony";
	var data = {
		display_name: "supervisor_name_FO_einstony",
		description: "supervisor_desc_FO_einstony",
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
	
	global.fo.einstony_triggers = [
		"HitWall3",
		"20Popped",
		"2Second",
		"FirstPop",
		"NubbyDies",
		"PegFullPop",
		"PassGoal"
	];
	
	forgery.register_autosave_save_callback(function(data) {
		data[$ "einstony_triggers"] = global.fo.einstony_triggers;
	});
	
	forgery.register_autosave_load_callback(function(data) {
		global.fo.einstony_triggers = data[$ "einstony_triggers"];
	});
	
	
	forgery.subscribe_to_game_event("RestartRun", function(this) {
		global.fo.einstony_triggers = [
			"HitWall3",
			"20Popped",
			"2Second",
			"FirstPop",
			"NubbyDies",
			"PegFullPop",
			"PassGoal"
		];
	});
	forgery.subscribe_to_game_event("QuitToTitle", function(this) {
		global.fo.einstony_triggers = [
			"HitWall3",
			"20Popped",
			"2Second",
			"FirstPop",
			"NubbyDies",
			"PegFullPop",
			"PassGoal"
		];
	});
	
	forgery.register_supervisor({
		display_name: data.display_name,
		description: data.description,
		sprites: data.sprites,
		clicked_sounds: data.clicked_sounds,
		go_sound: data.go_sound,
		name_color: data.name_color,
		cost: 0,
		on_create: function(this) {
			obj_ItemMGMT.InItemPool[get_item_number_from_id("catalyst")] = ITEMPOOL.SHOP;
			//obj_ItemMGMT.InItemPool[get_item_number_from_id("acid")] = ITEMPOOL.CAFE;

			with (obj_ItemMGMT) {
				// iterate through every available item
				// if the trigger is not "Passive", set it to nothing.
				
			    for (var _i = 0; _i < array_length(ItemID); _i++) {
					if (ItemType[_i] == 1) continue;
			        if (ItemTrig[_i] == "Passive") continue;
					
					ItemTrig[_i] = "";
					ItemTrigText[_i] = scr_Text(ItemTrig[_i]);
			
				    var _ItemDesc = string_join("", ItemTrigText[_i], ItemDescBase[_i]);
				    ItemDesc[_i] = _ItemDesc;
			    }
			}
		},
		on_step: function(this) {},
		on_destroy: function(this) {}
	}, supervisor_id);
}