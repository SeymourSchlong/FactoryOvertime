
function scr_FO_pheebie_mode() {
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "brokenclock")] = 0;
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "clover")] = 0;
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "mothegg")] = 0;
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "bblock")] = 0;
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "turkey")] = 0;
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "flupper")] = 0;
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "bookworm")] = 0;
}

function scr_FO_pols_bane() {
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "bookworm")] = 0;
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "turkey")] = 0;
}

// ceo and short on change
function scr_FO_ceo() {
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "chocolatecoin")] = 0;
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "littlepea")] = 0;
}

function scr_FO_criminal() {
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "tophat")] = 4;
	obj_ItemMGMT.InItemPool[nnf_forgery_get_item_id(mod_id, "wackomole")] = 4;
}