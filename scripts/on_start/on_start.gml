#macro forgery global.forgery_9
#macro agi asset_get_index
#macro mod_id "fo"

//show_debug_log(true);

// vanilla game stuff
#macro scr_Text					asset_get_index("scr_Text")
#macro scr_PopPeg				asset_get_index("scr_PopPeg")
#macro scr_AddNumber			asset_get_index("scr_AddNumber")
#macro scr_ForceTrigger			asset_get_index("scr_ForceTrigger")
#macro scr_Part_SunExplode		asset_get_index("scr_Part_SunExplode")
#macro scr_PartAmt				asset_get_index("scr_PartAmt")
#macro scr_BounceAndCol			asset_get_index("scr_BounceAndCol")
#macro scr_FlyingNumber			asset_get_index("scr_FlyingNumber")
#macro scr_GameEv				asset_get_index("scr_GameEv")
#macro scr_HalvePeg				asset_get_index("scr_HalvePeg")
#macro scr_DoublePeg			asset_get_index("scr_DoublePeg")
#macro scr_DoubleDoublePeg		asset_get_index("scr_DoubleDoublePeg")
#macro scr_FX_ItemExplosion		asset_get_index("scr_FX_ItemExplosion")
#macro scr_MutateItem			asset_get_index("scr_MutateItem")
#macro scr_FX_MultiplyScore		asset_get_index("scr_FX_MultiplyScore")
#macro scr_SummonEntity			asset_get_index("scr_SummonEntity")
#macro scr_LocalEqualFont		asset_get_index("scr_LocalEqualFont")
#macro scr_OutlineText			asset_get_index("scr_OutlineText")
#macro scr_UpdateSeed			asset_get_index("scr_UpdateSeed")
#macro scr_FoodEffect			asset_get_index("scr_FoodEffect")
#macro scr_UpgrFoodEffect		asset_get_index("scr_UpgrFoodEffect")
#macro scr_Part_NewLife			asset_get_index("scr_Part_NewLife")
#macro scr_TonyEmote			asset_get_index("scr_TonyEmote")

#macro obj_ItemMGMT				asset_get_index("obj_ItemMGMT")
#macro obj_PerkMGMT				asset_get_index("obj_PerkMGMT")
#macro obj_LvlMGMT				asset_get_index("obj_LvlMGMT")
#macro obj_UnqItemMGMT			asset_get_index("obj_UnqItemMGMT")
#macro obj_EventMGMT			asset_get_index("obj_EventMGMT")
#macro obj_ChallengesMGMT		asset_get_index("obj_ChallengesMGMT")
#macro obj_TonyMGMT				asset_get_index("obj_TonyMGMT")
#macro obj_ParPeg				asset_get_index("obj_ParPeg")
#macro obj_ParNubby				asset_get_index("obj_ParNubby")
#macro obj_GridCell				asset_get_index("obj_GridCell")
#macro obj_AnyPeg				asset_get_index("obj_AnyPeg")
#macro obj_SV4Manager			asset_get_index("obj_SV4Manager")
#macro obj_ItemParent			asset_get_index("obj_ItemParent")
#macro obj_ParPerk				asset_get_index("obj_ParPerk")
#macro obj_PerkSelMove			asset_get_index("obj_PerkSelMove")
#macro obj_CafeMouth			asset_get_index("obj_CafeMouth")
#macro obj_CafeDialogue			asset_get_index("obj_CafeDialogue")
#macro obj_UnqItemMove			asset_get_index("obj_UnqItemMove")
#macro obj_Unq_SuspiciousKey	asset_get_index("obj_Unq_SuspiciousKey")
#macro obj_Cursor				asset_get_index("obj_Cursor")
#macro obj_Tony					asset_get_index("obj_Tony")

#macro draw_text_scribble		asset_get_index("draw_text_scribble")
#macro draw_text_scribble_ext	asset_get_index("draw_text_scribble_ext")

#macro au_FoodEffect			asset_get_index("au_FoodEffect")

// item enums
enum RARITY {
    COMMON,
    RARE,
    ULTRARARE
}
enum ITEMPOOL {
    NONE,
    SHOP,
    BLACKMARKET,
    CAFE
}

global.fo = {
	piggy_coins: 0,
	littlepeas: 0,
	clocktime: 0,
	scoremult: {
		heartmonitor: 1,
		gloober: 1,
		boxofnails: 1,
		piyopiyos: 1
	}
}


function scr_FO_on_load() {
	// items
	fo_item_pocketfrogs();
	fo_item_toysoldier();
	fo_item_wackomole();
	fo_item_beetle();
	fo_item_tophat();
	fo_item_faultyrocket();
	fo_item_piggypurse();
	//fo_item_mysterybox();
	//fo_item_pandorasbox();
	//fo_item_arthur();			// does not function
	//fo_item_ash();			// temporary
	
	
	// passive items
	fo_item_mothegg();
	fo_item_nubup();
	fo_item_magicwand();
	fo_item_bblock();
	fo_item_brokenclock();
	fo_item_clover();
	fo_item_gloober();
	fo_item_heartmonitor();
	fo_item_boxofnails();
	fo_item_piyopiyos();
	//fo_item_bookworm();
	
	// food items
	fo_item_chocolatecoin();
	fo_item_littlepea();
	fo_item_redpill();
	//fo_item_lunchbag();
	//fo_item_geeks();
	fo_item_turkey();
	
	// einstony items
	fo_item_catalyst();
	fo_item_acid();
	
	// perks
	fo_perk_pancake();
	fo_perk_gmail();
	fo_perk_jittery();
	fo_perk_parry();
	fo_perk_pingpong();
	fo_perk_textbook();
	fo_perk_treasure();
	fo_perk_copycat();
	
	// passive perks
	fo_perk_nubup();
	fo_perk_magicwand();
	fo_perk_brokenclock();
	fo_perk_clover();
	
	// challenges
	fo_challenge_math();
	
	// supervisors
	fo_supervisor_king();
	fo_supervisor_einstony();
	
}

function scr_FO_on_unload() {}



/*
{
    name: "item_name_FO_flupper",
    spr: spr_FO_I_Flupper,
    sprupgr: spr_FO_I_S_Flupper,
    type: 0,
    rarity: RARITY.RARE,
    augment: "none",
    category: "misc",
    pool: ITEMPOOL.SHOP,
    price: 10,
    trig: "NubbyLaunchItem",
    alttrig: "",
    desc: "item_desc_FO_flupper", "\n", "\""),
    upgr: "item_upgr_FO_flupper", "\n", "\""),
    weight: [3, 5, 5]
}
*/