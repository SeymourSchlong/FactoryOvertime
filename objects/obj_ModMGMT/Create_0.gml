show_debug = false;
show_debug_log(show_debug);
instance_create_layer(621, 286, "Prompts", obj_MOD_StatusRenderer);
ScoreMult_Gloober = 1;
ScoreMult_BoxOfNails = 1;
ScoreMult_HeartMonitor = 1;
ScoreMult_PiyoPiyos = 1;

function GetLowestPeg()
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

function GetHighestPeg()
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

function BookWormEffect()
{
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
        
        repeat (_perks_to_give)
        {
            ds_list_shuffle(_ValidPerkList);
            obj_ModMGMT.GivePerk(ds_list_find_value(_ValidPerkList, 0));
        }
        
        ds_list_destroy(_ValidPerkList);
    }
}

function KingTonyUpgrade(arg0)
{
    if (obj_ItemMGMT.ItemLevel[arg0] == 1)
    {
        if (instance_exists(obj_SV10Manager))
        {
            var _will_upgrade = obj_ModMGMT.RandomWithLuck(random(100), obj_SV10Manager.UpgradeChance, true);
            
            if (_will_upgrade)
                arg0 = obj_ItemMGMT.ItemPair[arg0];
        }
    }
    
    return arg0;
}

function PassiveSparkle(arg0, arg1)
{
    instance_create_depth(arg0, arg1, depth, obj_MOD_PassiveFX);
}

function GeeksParticles(arg0, arg1, arg2)
{
    arg0 += (irandom_range(round(arg2 / 2), arg2) * choose(1, -1));
    arg1 += (irandom_range(round(arg2 / 2), arg2) * choose(1, -1));
    part_particles_create(obj_ParticleSetupOv.PartSystemOver, arg0, arg1, obj_ParticleSetupOv.PartTypeGeeks, 1);
}

function RandomWithLuck(arg0, arg1, arg2 = true)
{
    var _count_reg = 0;
    var _count_upgr = 0;
    
    if (instance_exists(obj_MOD_I_LuckyClover))
    {
        with (obj_MOD_I_LuckyClover)
        {
            if (DisableItem == false)
                _count_reg += 0.1;
        }
    }
    
    if (instance_exists(obj_MOD_I_S_LuckyClover))
    {
        with (obj_MOD_I_LuckyClover)
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
            with (obj_MOD_I_LuckyClover)
            {
                if (DisableItem == false)
                    scr_FO_PassiveSparkle(x, y);
            }
            
            with (obj_MOD_I_S_LuckyClover)
            {
                if (DisableItem == false)
                    scr_FO_PassiveSparkle(x, y);
            }
        }
        
        return true;
    }
}

function IncreasedTriggerCount(arg0)
{
    var WhatSlot = arg0;
    var _trigger_count = 1;
    
    if (instance_exists(obj_SV5Manager))
        _trigger_count++;
    
    if (WhatSlot > 1)
    {
        var _bblock_reg = obj_ModMGMT.GetItemID(obj_MOD_I_BBlock);
        var _bblock_upg = obj_ModMGMT.GetItemID(obj_MOD_I_S_BBlock);
        
        if (obj_ItemMGMT.ItemInst[WhatSlot - 1] != -1 && instance_exists(obj_ItemMGMT.ItemInst[WhatSlot - 1]))
        {
            if (obj_ItemMGMT.ItemInst[WhatSlot - 1].DisableItem == false)
            {
                if (obj_ItemMGMT.Item[WhatSlot - 1] == _bblock_reg || obj_ItemMGMT.Item[WhatSlot - 1] == _bblock_upg)
                    _trigger_count++;
                
                if (obj_ItemMGMT.Item[WhatSlot - 1] == _bblock_upg)
                {
                    if (obj_ModMGMT.RandomWithLuck(random(100), 25))
                        _trigger_count++;
                }
            }
        }
    }
    
    return _trigger_count;
}

function UpCloverCount()
{
    var _count_upgr = 0.2 * instance_number(obj_MOD_I_S_LuckyClover);
    var _value = 1 + _count_upgr;
    return _value;
}

function UpCloverCountWithSparkle()
{
    with (obj_MOD_I_S_LuckyClover)
        scr_FO_PassiveSparkle(x, y);
    
    return UpCloverCount();
}

function ItemRarityPicker()
{
    var _Picker = random(1000);
    var _HitPool = 0;
    
    if (instance_exists(obj_SV10Manager))
        return 0;
    
    if (_Picker < (obj_LvlMGMT.RareOdds * UpCloverCountWithSparkle()))
        _HitPool = 1;
    
    if (_Picker < (obj_LvlMGMT.UltraRareOdds * UpCloverCountWithSparkle()))
        _HitPool = 2;
    
    return _HitPool;
}

function ItemRarityPickerBM()
{
    var _Picker = random(1000);
    var _HitPool = 0;
    
    if (instance_exists(obj_SV10Manager))
        return 0;
    
    if (_Picker < (obj_LvlMGMT.RareOdds * UpCloverCountWithSparkle()))
        _HitPool = 1;
    
    return _HitPool;
}

function PerkRarityPicker()
{
    var _Picker = random(1000);
    var _HitPool = 0;
    
    if (instance_exists(obj_SV10Manager))
        return 0;
    
    if (_Picker < (obj_LvlMGMT.PerkRareOdds * UpCloverCountWithSparkle()))
        _HitPool = 1;
    
    if (_Picker < (obj_LvlMGMT.PerkUltraRareOdds * UpCloverCountWithSparkle()))
        _HitPool = 2;
    
    return _HitPool;
}

function ClockCount()
{
    var _count_reg = 0;
    var _count_upgr = 0;
    
    if (instance_exists(obj_MOD_I_BrokenClock))
    {
        with (obj_MOD_I_BrokenClock)
        {
            if (DisableItem == false)
            {
                scr_FO_PassiveSparkle(x, y);
                _count_reg += 1;
            }
        }
    }
    
    if (instance_exists(obj_MOD_I_S_BrokenClock))
    {
        with (obj_MOD_I_S_BrokenClock)
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

function ClockPlusTime()
{
    var _count_upgr = 0;
    
    if (instance_exists(obj_MOD_I_S_BrokenClock))
    {
        with (obj_MOD_I_S_BrokenClock)
        {
            if (DisableItem == false)
                _count_upgr += 1;
        }
    }
    
    obj_LvlMGMT.ClockExtraTime = 30 * _count_upgr;
}

function WandCount()
{
    var _wand_id = obj_ModMGMT.GetItemID(obj_MOD_I_MagicWand);
    var _count_reg = instance_number(obj_MOD_I_MagicWand);
    var _count_upgr = instance_number(obj_MOD_I_S_MagicWand);
    
    with (obj_MOD_I_MagicWand)
        scr_FO_PassiveSparkle(x, y);
    
    with (obj_MOD_I_S_MagicWand)
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

function NubUpCount()
{
    var _count_reg = 0;
    var _count_upgr = 0;
    
    if (instance_exists(obj_MOD_I_NubUp))
    {
        with (obj_MOD_I_NubUp)
        {
            if (DisableItem == false)
            {
                scr_FO_PassiveSparkle(x, y);
                _count_reg += 1;
            }
        }
    }
    
    if (instance_exists(obj_MOD_I_S_NubUp))
    {
        with (obj_MOD_I_S_NubUp)
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

function GetItemID(arg0)
{
    for (var _i = 0; _i < array_length(obj_ItemMGMT.ItemObj); _i++)
    {
        if (obj_ItemMGMT.ItemObj[_i] == arg0)
            return _i;
    }
}

function GetPerkID(arg0)
{
    for (var _i = 0; _i < array_length(obj_PerkMGMT.PerkObj); _i++)
    {
        if (obj_PerkMGMT.PerkObj[_i] == arg0)
            return _i;
    }
}

function GivePerk(arg0, arg1 = 950, arg2 = 540)
{
    var new_perk = instance_create_depth(arg1, arg2, depth - 1, obj_PerkSelMove);
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

function MothEggRandomSummon()
{
    var _count_reg = 0;
    var _count_upgr = 0;
    
    if (instance_exists(obj_MOD_I_MothEgg))
    {
        with (obj_MOD_I_MothEgg)
        {
            if (DisableItem == false)
            {
                _count_reg += 1;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    if (instance_exists(obj_MOD_I_S_MothEgg))
    {
        with (obj_MOD_I_S_MothEgg)
        {
            if (DisableItem == false)
            {
                _count_upgr += 1;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    var _odds = min((_count_reg * 5) + (_count_upgr * 15), 65);
    
    if (!RandomWithLuck(random(100), _odds))
        exit;
    
    var _is_upgraded = RandomWithLuck(random(100), _count_upgr * 20);
    var _summon_list = choose(1, 3, 5, 7, 9, 11, 15, 17);
    var _summon_list_upgraded = choose(1, 4, 6, 8, 10, 12, 16, 18);
    var _random_index = _summon_list;
    
    if (_is_upgraded)
        _random_index = _summon_list_upgraded;
    
    scr_SummonEntity(_random_index, self);
}

function GlooberIncrease()
{
    if (instance_exists(obj_MOD_I_Gloober))
    {
        with (obj_MOD_I_Gloober)
        {
            if (DisableItem == false)
            {
                other.ScoreMult_Gloober += 0.01;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    if (instance_exists(obj_MOD_I_S_Gloober))
    {
        with (obj_MOD_I_S_Gloober)
        {
            if (DisableItem == false)
            {
                other.ScoreMult_Gloober += 0.03;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
}

function HeartMonitorIncrease()
{
    if (instance_exists(obj_MOD_I_HeartMonitor))
    {
        with (obj_MOD_I_HeartMonitor)
        {
            if (DisableItem == false)
            {
                other.ScoreMult_HeartMonitor += 0.03;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    if (instance_exists(obj_MOD_I_S_HeartMonitor))
    {
        with (obj_MOD_I_S_HeartMonitor)
        {
            if (DisableItem == false)
            {
                other.ScoreMult_HeartMonitor += 0.1;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
}

function BoxOfNailsIncrease()
{
    if (instance_exists(obj_MOD_I_BoxOfNails))
    {
        with (obj_MOD_I_BoxOfNails)
        {
            if (DisableItem == false)
            {
                other.ScoreMult_BoxOfNails += 0.05;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    if (instance_exists(obj_MOD_I_S_BoxOfNails))
    {
        with (obj_MOD_I_S_BoxOfNails)
        {
            if (DisableItem == false)
            {
                other.ScoreMult_BoxOfNails += 0.15;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
}

function PiyoPiyosIncrease()
{
    if (instance_exists(obj_MOD_I_PiyoPiyos))
    {
        with (obj_MOD_I_PiyoPiyos)
        {
            if (DisableItem == false)
            {
                other.ScoreMult_PiyoPiyos += 0.01;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
    
    if (instance_exists(obj_MOD_I_S_PiyoPiyos))
    {
        with (obj_MOD_I_S_PiyoPiyos)
        {
            if (DisableItem == false)
            {
                other.ScoreMult_PiyoPiyos += 0.03;
                scr_FO_PassiveSparkle(x, y);
            }
        }
    }
}

function GetMultIncrease()
{
    return ScoreMult_Gloober * ScoreMult_BoxOfNails * ScoreMult_HeartMonitor * ScoreMult_PiyoPiyos;
}
