
function scr_FO_pheebie_mode() {
	obj_ItemMGMT.InItemPool[get_item_number_from_id("brokenclock")] = 0;
	obj_ItemMGMT.InItemPool[get_item_number_from_id("clover")] = 0;
	obj_ItemMGMT.InItemPool[get_item_number_from_id("mothegg")] = 0;
	obj_ItemMGMT.InItemPool[get_item_number_from_id("bblock")] = 0;
	obj_ItemMGMT.InItemPool[get_item_number_from_id("turkey")] = 0;
	//obj_ItemMGMT.InItemPool[get_item_number_from_id("bookworm")] = 0;
}

function scr_FO_pols_bane() {
	//obj_ItemMGMT.InItemPool[get_item_number_from_id("bookworm")] = 0;
	obj_ItemMGMT.InItemPool[get_item_number_from_id("turkey")] = 0;
}

function scr_FO_ceo() {
	obj_ItemMGMT.InItemPool[get_item_number_from_id("chocolatecoin")] = 0;
	obj_ItemMGMT.InItemPool[get_item_number_from_id("littlepea")] = 0;
}