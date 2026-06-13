with (obj_ItemMGMT) {
	for (var i = 1; i <= 7; i++) {
		if (Item[i] == -1) continue;
		if (!instance_exists(ItemInst[i])) continue;
		if (ItemTrig[Item[i]] == "Passive") continue;
					
		with (ItemInst[i]) {
			EvType = global.fo.einstony_triggers[i];
			MyDesc = scr_FO_remake_description(MyItemID, EvType);
		}
	}
}