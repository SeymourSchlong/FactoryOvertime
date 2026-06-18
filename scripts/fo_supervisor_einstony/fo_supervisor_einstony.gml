function scr_FO_remake_description(item, trigger) {
	var _ItemTrigText = scr_Text(trigger);
	var _ItemDesc = string_join("", _ItemTrigText, obj_ItemMGMT.ItemDescBase[item]);
	return _ItemDesc;
}


function fo_supervisor_einstony(){
	var supervisor_id = "einstony";
	var data = {
		display_name: "supervisor_name_FO_einstony",
		description: "supervisor_desc_FO_einstony",
		sprites: {
			idle_neutral: agi("spr_FO_EinstonyIdleNeutral"),
			preview: agi("spr_FO_EinstonyPrev"),
			preview_clicked: agi("spr_FO_EinstonyPrevTalk"),
			angry: agi("spr_FO_EinstonyAngry"),
			evil: agi("spr_FO_EinstonyEvil"),
			head_swivel: agi("spr_FO_EinstonyHeadSwivel"),
			scream: agi("spr_FO_EinstonyScream"),
			idle_happy: agi("spr_FO_EinstonyIdleHappy"),
			idle_sad: agi("spr_FO_EinstonyIdleSad"),
			talk: agi("spr_FO_EinstonyTalk"),
		},
		clicked_sounds: [
			agi("snd_FO_EinstonyTalk1"),
			agi("snd_FO_EinstonyTalk2"),
			agi("snd_FO_EinstonyTalk3")
		],
		go_sound: agi("snd_FO_EinstonyGo"),
		name_color: int64(#000000),
	}
	
	global.fo.einstony_triggers = [
		"",
		"HitWall3",
		"15Popped",
		"2Second",
		"FirstPop",
		"NubbyDies",
		"5Summoned",
		"HitWall2"
	];
	
	forgery.register_autosave_save_callback(function(data) {
		data[$ "einstony_triggers"] = global.fo.einstony_triggers;
	});
	
	forgery.register_autosave_load_callback(function(data) {
		global.fo.einstony_triggers = data[$ "einstony_triggers"];
	});
	
	
	forgery.subscribe_to_game_event("RestartRun", function(this) {
		global.fo.einstony_triggers = [
			"",
			"HitWall3",
			"15Popped",
			"2Second",
			"FirstPop",
			"NubbyDies",
			"5Summoned",
			"HitWall2"
		];
	});
	forgery.subscribe_to_game_event("QuitToTitle", function(this) {
		global.fo.einstony_triggers = [
			"",
			"HitWall3",
			"15Popped",
			"2Second",
			"FirstPop",
			"NubbyDies",
			"5Summoned",
			"HitWall2"
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
			obj_ItemMGMT.InItemPool[get_item_number_from_id("acid")] = ITEMPOOL.CAFE;

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
			
			instance_create_layer(0, 0, "UnderCursor", agi("obj_FO_EinstonyHelper"));
		},
		on_step: function(this) {},
		on_destroy: function(this) {}
	}, supervisor_id);
}