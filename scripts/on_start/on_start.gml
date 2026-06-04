#macro forgery global.forgery_9
#macro agi asset_get_index
#macro mod_id "fo"


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


#macro obj_ItemMGMT				asset_get_index("obj_ItemMGMT")
#macro obj_PerkMGMT				asset_get_index("obj_PerkMGMT")
#macro obj_LvlMGMT				asset_get_index("obj_LvlMGMT")
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
#macro obj_EventMGMT			asset_get_index("obj_EventMGMT")
#macro obj_ChallengesMGMT		asset_get_index("obj_ChallengesMGMT")

#macro au_FoodEffect			asset_get_index("au_FoodEffect")

//show_debug_log(true);

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
	item_pocketfrogs();
	item_toysoldier();
	item_wackomole();
	item_beetle();
	item_tophat();
	item_faultyrocket();
	item_piggypurse();
	//item_mysterybox();
	//item_pandorasbox();
	//item_arthur();		// does not function
	//item_ash();			// temporary
	
	
	// passive items
	//item_bookworm();
	item_mothegg();
	item_nubup();
	item_magicwand();
	item_bblock();
	item_brokenclock();
	item_clover();
	item_gloober();
	item_heartmonitor();
	item_boxofnails();
	item_piyopiyos();
	
	// food items
	item_chocolatecoin();
	//item_redpill();
	item_littlepea();
	//item_lunchbag();
	//item_geeks();
	
	
	// perks
	perk_pancake();
	perk_gmail();
	perk_jittery();
	perk_parry();
	perk_pingpong();
	perk_textbook();
	perk_treasure();
	perk_copycat();
	
	// challenges
	challenge_math();
	
	// supervisors
	supervisor_king();
	
}

function scr_FO_on_unload() {}



/*
{
    name: "item_name_flupper",
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
    desc: "item_desc_flupper", "\n", "\""),
    upgr: "item_upgr_flupper", "\n", "\""),
    weight: [3, 5, 5]
}
*/