function get_object_from_id(item_id) {
    var index = forgery.registries_exchange(
		global.registry,
		global.index_registry,
		forgery.resources.item,
		"fo:"+item_id
	);
    return obj_ItemMGMT.ItemObj[index];
}

function get_item_number_from_id(item_id) {
    var index = forgery.registries_exchange(
		global.registry,
		global.index_registry,
		forgery.resources.item,
		"fo:"+item_id
	);
    return index;
}

function get_perk_from_id(item_id) {
    var index = forgery.registries_exchange(
		global.registry,
		global.index_registry,
		forgery.resources.perk,
		"fo:"+item_id
	);
    return obj_PerkMGMT.PerkObj[index];
}

function get_perk_number_from_id(item_id) {
    var index = forgery.registries_exchange(
		global.registry,
		global.index_registry,
		forgery.resources.perk,
		"fo:"+item_id
	);
    return index;
}

function get_challenge_number_from_id(item_id) {
    var index = forgery.registries_exchange(
		global.registry,
		global.index_registry,
		forgery.resources.challenge,
		"fo:"+item_id
	);
    return index;
}

function get_manager_number_from_id(item_id) {
    var index = forgery.registries_exchange(
		global.registry,
		global.index_registry,
		forgery.resources.supervisor,
		"fo:"+item_id
	);
    return index;
}

function scr_FO_DrawPeas()
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
	
	var _x = 556;
	var _y = 421;
	var _frame = global.JitterFrame;
	repeat (global.fo.littlepeas) {
		draw_sprite(agi("spr_FO_Pea"), _frame, _x, _y);
		_x -= 5;
		_frame = (_frame + 1) % 4;
	}
}

function scr_FO_GetItemID(arg0)
{
    for (var _i = 0; _i < array_length(obj_ItemMGMT.ItemObj); _i++)
    {
        if (obj_ItemMGMT.ItemObj[_i] == arg0)
            return _i;
    }
}

function scr_FO_GetPerkID(arg0)
{
    for (var _i = 0; _i < array_length(obj_PerkMGMT.PerkObj); _i++)
    {
        if (obj_PerkMGMT.PerkObj[_i] == arg0)
            return _i;
    }
}

function scr_FO_vanilla_items() {
	with (obj_ItemMGMT) {
		// make noodle common
		ItemTier[1] = RARITY.COMMON;
		ItemTier[153] = RARITY.COMMON;
	
		// corrupt seal
		ItemAugment[35] = "corrupted";
		ItemAugment[103] = "corrupted";
	
		// uncorrupt pointer and make rare
		ItemAugment[34] = "none";
		ItemAugment[102] = "none";
		ItemTier[34] = RARITY.RARE;
		ItemTier[102] = RARITY.RARE;
	
		// change dolphin trigger
		ItemTrig[56] = "HalfSecond";
		ItemTrig[124] = "HalfSecond";
	
		// mutant tony alts
		// plastic fish
		MutantTrig[27] = "HalfSecond";
		MutantTrig[95] = "HalfSecond";
		// wingless fly
		MutantTrig[47] = "3Second";
		MutantTrig[115] = "3Second";
		// fish man
		MutantTrig[54] = "PegFullPop";
		MutantTrig[122] = "PegFullPop";
		// inflatable dolphin
		MutantTrig[56] = "PassGoal";
		MutantTrig[124] = "PassGoal";
		// e-block
		MutantTrig[67] = "PegFullPop";
		MutantTrig[135] = "PegFullPop";
		// t-block
		MutantTrig[149] = "PassGoal";
		MutantTrig[150] = "PassGoal";
	
		var _ids = [27, 95, 47, 115, 54, 122, 56, 124, 67, 135, 149, 150];
		for (var _i = 0; _i < array_length(_ids); _i++) {
			MutantTrigText[_ids[_i]] = scr_Text(MutantTrig[_ids[_i]]);
		}
	}
}

function scr_FO_is_challenge(challenge_name) {
	return get_challenge_number_from_id(challenge_name) == obj_LvlMGMT.ChallengeMode;
}

function scr_FO_is_manager(manager_name) {
	return get_manager_number_from_id(manager_name) == obj_LvlMGMT.SVID;
}



function scr_FO_GetLowestPeg()
{
    var _Lowest = -1;
    var _Tar = 0;
    
    for (var i = 1; i < 22; i += 1)
    {
        var _iTar = instance_position(obj_LvlMGMT.GridX[i], obj_LvlMGMT.GridY[i], obj_ParPeg);
        
        if (instance_exists(_iTar) && _iTar.PegDead == false)
        {
            if (_Lowest == -1)
            {
                _Lowest = _iTar.PegNum;
                _Tar = _iTar;
            }
            
            if (_iTar.PegNum < _Lowest)
            {
                _Lowest = _iTar.PegNum;
                _Tar = _iTar;
            }
        }
    }
    
    return _Tar;
}

function scr_FO_GetHighestPeg()
{
    var _Highest = -1;
    var _Tar = 0;
    
    for (var i = 1; i < 22; i += 1)
    {
        var _iTar = instance_position(obj_LvlMGMT.GridX[i], obj_LvlMGMT.GridY[i], obj_ParPeg);
        
        if (instance_exists(_iTar) && _iTar.PegDead == false)
        {
            if (_Lowest == -1)
            {
                _Highest = _iTar.PegNum;
                _Tar = _iTar;
            }
            
            if (_iTar.PegNum > _Highest)
            {
                _Highest = _iTar.PegNum;
                _Tar = _iTar;
            }
        }
    }
    
    return _Tar;
}



function scr_FO_PassiveSparkle(arg0, arg1) {
    instance_create_depth(arg0, arg1, 1, agi("obj_FO_PassiveFX"));
}

function scr_FO_NubUpCount()
{
    var _count_reg = 0;
    var _count_upgr = 0;
	
	var _reg_obj = agi(get_object_from_id("nubup"));
	var _upg_obj = agi(get_object_from_id("nubup_upgrade"));
    
    if (instance_exists(_reg_obj))
    {
        with (_reg_obj)
        {
            if (DisableItem == false)
            {
                scr_FO_PassiveSparkle(x, y);
                _count_reg += 1;
            }
        }
    }
    
    if (instance_exists(_upg_obj))
    {
        with (_upg_obj)
        {
            if (DisableItem == false)
            {
                _count_upgr += 1;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    return (_count_reg * 0.25) + (_count_upgr * 0.75);
}

function scr_FO_RandomWithLuck(arg0, arg1, arg2 = true) {
    var _count_reg = 0;
    var _count_upgr = 0;
	
	var _reg_obj = agi(get_object_from_id("clover"));
	var _upg_obj = agi(get_object_from_id("clover_upgrade"));
    
    if (instance_exists(_reg_obj))
    {
        with (_reg_obj)
        {
            if (DisableItem == false)
                _count_reg += 0.1;
        }
    }
    
    if (instance_exists(_upg_obj))
    {
        with (_upg_obj)
        {
            if (DisableItem == false)
                _count_upgr += 0.2;
        }
    }
    
    var _value = 1 + _count_reg + _count_upgr;
    
    if (arg0 < arg1)
    {
        return true;
    }
    else if (arg0 < (arg1 * _value))
    {
        if (arg2)
        {
            with (_reg_obj)
            {
                if (DisableItem == false)
                    scr_FO_PassiveSparkle(x, y);
            }
            
            with (_upg_obj)
            {
                if (DisableItem == false)
                    scr_FO_PassiveSparkle(x, y);
            }
        }
        
        return true;
    }
}


function scr_FO_UpCloverCount()
{
	var _upg_obj = agi(get_object_from_id("clover_upgrade"));
    var _count_upgr = 0.2 * instance_number(_upg_obj);
    var _value = 1 + _count_upgr;
    return _value;
}

function scr_FO_UpCloverCountWithSparkle()
{
	var _upg_obj = agi(get_object_from_id("clover_upgrade"));
    with (_upg_obj)
        scr_FO_PassiveSparkle(x, y);
    
    return scr_FO_UpCloverCount();
}

function scr_FO_ItemRarityPicker()
{
    var _Picker = random(1000);
    var _HitPool = 0;
    
    if (scr_FO_is_manager("king"))
        return 0;
    
    if (_Picker < (obj_LvlMGMT.RareOdds * scr_FO_UpCloverCountWithSparkle()))
        _HitPool = 1;
    
    if (_Picker < (obj_LvlMGMT.UltraRareOdds * scr_FO_UpCloverCountWithSparkle()))
        _HitPool = 2;
    
    return _HitPool;
}

function scr_FO_ItemRarityPickerBM()
{
    var _Picker = random(1000);
    var _HitPool = 0;
    
    if (scr_FO_is_manager("king"))
        return 0;
    
    if (_Picker < (obj_LvlMGMT.RareOdds * scr_FO_UpCloverCountWithSparkle()))
        _HitPool = 1;
    
    return _HitPool;
}

function scr_FO_PerkRarityPicker()
{
    var _Picker = random(1000);
    var _HitPool = 0;
    
    if (scr_FO_is_manager("king"))
        return 0;
    
    if (_Picker < (obj_LvlMGMT.PerkRareOdds * scr_FO_UpCloverCountWithSparkle()))
        _HitPool = 1;
    
    if (_Picker < (obj_LvlMGMT.PerkUltraRareOdds * scr_FO_UpCloverCountWithSparkle()))
        _HitPool = 2;
    
    return _HitPool;
}

function scr_FO_KingTonyUpgrade(arg0)
{
    if (obj_ItemMGMT.ItemLevel[arg0] == 1)
    {
        if (scr_FO_is_manager("king"))
        {
            var _will_upgrade = scr_FO_RandomWithLuck(random(100), 20, true);
            
            if (_will_upgrade)
                arg0 = obj_ItemMGMT.ItemPair[arg0];
        }
    }
    
    return arg0;
}

function scr_FO_IncreasedTriggerCount(arg0)
{
    var WhatSlot = arg0;
    var _trigger_count = 1;
    
    if (instance_exists(agi("obj_SV5Manager")))
        _trigger_count++;

    if (WhatSlot > 1)
    {
        var _bblock_reg = get_item_number_from_id("bblock");
        var _bblock_upg = get_item_number_from_id("bblock_upgrade");
        
        if (obj_ItemMGMT.ItemInst[WhatSlot - 1] != -1 && instance_exists(obj_ItemMGMT.ItemInst[WhatSlot - 1]))
        {
            if (obj_ItemMGMT.ItemInst[WhatSlot - 1].DisableItem == false)
            {
                if (obj_ItemMGMT.Item[WhatSlot - 1] == _bblock_reg || obj_ItemMGMT.Item[WhatSlot - 1] == _bblock_upg)
                    _trigger_count++;
                
                if (obj_ItemMGMT.Item[WhatSlot - 1] == _bblock_upg)
                {
                    if (scr_FO_RandomWithLuck(random(100), 25))
                        _trigger_count++;
                }
            }
        }
    }
    
    return _trigger_count;
}

function scr_FO_ClockCount()
{
	var _reg_obj = agi(get_object_from_id("brokenclock"));
	var _upg_obj = agi(get_object_from_id("brokenclock_upgrade"));
    var _count_reg = 0;
    var _count_upgr = 0;
    
    if (instance_exists(_reg_obj))
    {
        with (_reg_obj)
        {
            if (DisableItem == false)
            {
                scr_FO_PassiveSparkle(x, y);
                _count_reg += 1;
            }
        }
    }
    
    if (instance_exists(_upg_obj))
    {
        with (_upg_obj)
        {
            if (DisableItem == false)
            {
                _count_upgr += 1;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    var _total_reduction = (_count_reg * 2) + (_count_upgr * 5);
    return min(_total_reduction, 29);
}

function scr_FO_ClockPlusTime()
{
	var _upg_obj = agi(get_object_from_id("brokenclock_upgrade"));
    var _count_upgr = 0;
    
    if (instance_exists(_upg_obj))
    {
        with (_upg_obj)
        {
            if (DisableItem == false)
                _count_upgr += 1;
        }
    }
    
    global.fo.clocktime = 30 * _count_upgr;
}

function scr_FO_WandCount()
{
	// for squid
	var _wand_id = get_item_number_from_id("magicwand");
	var _reg_obj = agi(get_object_from_id("magicwand"));
	var _upg_obj = agi(get_object_from_id("magicwand_upgrade"));
    var _count_reg = instance_number(_reg_obj);
    var _count_upgr = instance_number(_upg_obj);
    
    with (_reg_obj)
        scr_FO_PassiveSparkle(x, y);
    
    with (_upg_obj)
        scr_FO_PassiveSparkle(x, y);
    
    var _last_wand = false;
    
    for (var i = 1; i < array_length(obj_ItemMGMT.Item); i++)
    {
        if (_last_wand == true)
        {
            if (obj_ItemMGMT.Item[i] == 31)
            {
                _last_wand = true;
                _count_reg++;
            }
            else if (obj_ItemMGMT.Item[i] == obj_ItemMGMT.ItemPair[31])
            {
                _last_wand = true;
                _count_upgr++;
            }
            else
            {
                _last_wand = false;
            }
        }
        
        if (obj_ItemMGMT.Item[i] == _wand_id || obj_ItemMGMT.Item[i] == obj_ItemMGMT.ItemPair[_wand_id])
            _last_wand = true;
    }
    
    var _value = _count_reg + (2 * _count_upgr);
    var _hyper = 1 + (2 * (0.8 - power(0.8, 1 + _value)));
    return min(_hyper, 2.5);
}

function scr_FO_BookWormEffect()
{
	return;
	
	var _reg_obj = agi(get_object_from_id("bookworm"));
	var _upg_obj = agi(get_object_from_id("bookworm_upgrade"));
	
    var _perks_to_give = 0;
    
    if ((global.CurrentRnd % 10) == 0)
    {
        if (instance_exists(_reg_obj))
        {
            with (_reg_obj)
                _perks_to_give++;
        }
    }
    
    if ((global.CurrentRnd % 5) == 0)
    {
        if (instance_exists(_upg_obj))
        {
            with (_upg_obj)
                _perks_to_give++;
        }
    }
    
    if (_perks_to_give > 0)
    {
        var _ValidPerkList = ds_list_create();
        ds_list_clear(_ValidPerkList);
        
        for (var i = 0; i < array_length(obj_PerkMGMT.PerkTrigger); i += 1)
        {
            if (obj_PerkMGMT.InPerkItemPool[i] == 1 && i != 1 && i != 20)
                ds_list_add(_ValidPerkList, i);
        }
        
        ds_list_add(_ValidPerkList, 2);
        ds_list_add(_ValidPerkList, 30);
        
        ds_list_shuffle(_ValidPerkList);
		var _selected_perk = ds_list_find_value(_ValidPerkList, 0);
		
		//forgery.run_delayed(1, undefined, scr_FO_GivePerk(_selected_perk));
		//forgery.run_delayed(10, undefined, scr_FO_GivePerk(_selected_perk));
        //repeat (_perks_to_give)
        //{
        //    scr_FO_GivePerk(_selected_perk);
        //}
        
        //repeat (_perks_to_give)
        //{
        //    ds_list_shuffle(_ValidPerkList);
        //    scr_FO_GivePerk(ds_list_find_value(_ValidPerkList, 0));
        //}
        
        ds_list_destroy(_ValidPerkList);
    }
}


function scr_FO_GivePerk(arg0, arg1 = 950, arg2 = 540)
{
    var new_perk = instance_create_layer(arg1, arg2, "UnderCursor", obj_PerkSelMove);
    new_perk.HeldPerk = arg0;
    var perk_stacked = 0;
    var duped_id = -1;
    
    if (instance_exists(obj_ParPerk))
    {
        for (var i = 0; i < ds_list_size(obj_PerkMGMT.PerkInst); i += 1)
        {
            if (ds_list_find_value(obj_PerkMGMT.PerkInst, i).MyPerkID == new_perk.HeldPerk)
            {
                perk_stacked = true;
                duped_id = ds_list_find_value(obj_PerkMGMT.PerkInst, i);
                break;
            }
        }
    }
    
    if (perk_stacked == false)
    {
        if (ds_list_size(obj_PerkMGMT.PerkDispList) < 8)
        {
            new_perk.TarX = obj_PerkMGMT.PerkX + (59 * ds_list_size(obj_PerkMGMT.PerkDispList));
            new_perk.TarY = obj_PerkMGMT.PerkY;
            new_perk.CountAsDispUp = true;
        }
        else
        {
            var _TtlSize = ds_list_size(obj_PerkMGMT.PerkDispList) + 1;
            var _Spacing = round((obj_PerkMGMT.PerkEndSpace - obj_PerkMGMT.PerkX) / _TtlSize);
            new_perk.TarY = obj_PerkMGMT.PerkY;
            var _TarX = obj_PerkMGMT.PerkX + (_Spacing * _TtlSize);
            new_perk.TarX = _TarX;
            new_perk.CountAsDispUp = true;
        }
    }
    else
    {
        new_perk.TarX = duped_id.x;
        new_perk.TarY = duped_id.y;
        new_perk.CountAsDispUp = false;
    }
    
    new_perk.sprite_index = object_get_sprite(obj_PerkMGMT.PerkObj[arg0]);
    new_perk.image_alpha = 1;
}


function scr_FO_MothEggRandomSummon()
{
	var _reg_obj = agi(get_object_from_id("mothegg"));
	var _upg_obj = agi(get_object_from_id("mothegg_upgrade"));
    var _count_reg = 0;
    var _count_upgr = 0;
    
    if (instance_exists(_reg_obj))
    {
        with (_reg_obj)
        {
            if (DisableItem == false)
            {
                _count_reg += 1;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    if (instance_exists(_upg_obj))
    {
        with (_upg_obj)
        {
            if (DisableItem == false)
            {
                _count_upgr += 1;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    var _odds = min((_count_reg * 5) + (_count_upgr * 15), 65);
    
    if (!scr_FO_RandomWithLuck(random(100), _odds))
        exit;
    
    var _is_upgraded = scr_FO_RandomWithLuck(random(100), _count_upgr * 20);
    var _summon_list =			choose(1, 3, 5, 7, 9, 11, 15);
    var _summon_list_upgraded = choose(1, 4, 6, 8, 10, 12, 16);
    var _random_index = _summon_list;
    
    if (_is_upgraded)
        _random_index = _summon_list_upgraded;
    
    scr_SummonEntity(_random_index, 0);
}



function scr_FO_ResetMults() {
	global.fo.scoremult.heartmonitor = 1;
	global.fo.scoremult.gloober = 1;
	global.fo.scoremult.boxofnails = 1;
	global.fo.scoremult.piyopiyos = 1;
}

function scr_FO_GlooberIncrease()
{
	var _reg_obj = agi(get_object_from_id("gloober"));
	var _upg_obj = agi(get_object_from_id("gloober_upgrade"));
	
    if (instance_exists(_reg_obj))
    {
        with (_reg_obj)
        {
            if (DisableItem == false)
            {
                global.fo.scoremult.gloober += 0.01;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    if (instance_exists(_upg_obj))
    {
        with (_upg_obj)
        {
            if (DisableItem == false)
            {
                global.fo.scoremult.gloober += 0.03;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
}

function scr_FO_HeartMonitorIncrease()
{
	var _reg_obj = agi(get_object_from_id("heartmonitor"));
	var _upg_obj = agi(get_object_from_id("heartmonitor_upgrade"));
	
    if (instance_exists(_reg_obj))
    {
        with (_reg_obj)
        {
            if (DisableItem == false)
            {
                global.fo.scoremult.heartmonitor += 0.03;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    if (instance_exists(_upg_obj))
    {
        with (_upg_obj)
        {
            if (DisableItem == false)
            {
                global.fo.scoremult.heartmonitor += 0.1;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
}

function scr_FO_BoxOfNailsIncrease()
{
	var _reg_obj = agi(get_object_from_id("boxofnails"));
	var _upg_obj = agi(get_object_from_id("boxofnails_upgrade"));
	
    if (instance_exists(_reg_obj))
    {
        with (_reg_obj)
        {
            if (DisableItem == false)
            {
                global.fo.scoremult.boxofnails += 0.05;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    if (instance_exists(_upg_obj))
    {
        with (_upg_obj)
        {
            if (DisableItem == false)
            {
                global.fo.scoremult.boxofnails += 0.15;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
}

function scr_FO_PiyoPiyosIncrease()
{
	var _reg_obj = agi(get_object_from_id("piyopiyos"));
	var _upg_obj = agi(get_object_from_id("piyopiyos_upgrade"));
	
    if (instance_exists(_reg_obj))
    {
        with (_reg_obj)
        {
            if (DisableItem == false)
            {
                global.fo.scoremult.piyopiyos = 1;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    if (instance_exists(_upg_obj))
    {
        with (_upg_obj)
        {
            if (DisableItem == false)
            {
                global.fo.scoremult.piyopiyos = 1;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
}

function scr_FO_GetMultIncrease()
{
    return global.fo.scoremult.gloober * global.fo.scoremult.boxofnails * global.fo.scoremult.heartmonitor * global.fo.scoremult.piyopiyos;
}