// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_FO_gmail_description() {
	var _slots = [-1, 0, 0, 0, 0, 0, 0, 0];
    var _number_string = string(global.CurrentRnd);
    var _number_length = string_length(_number_string);
            
    for (var _i = 0; _i < _number_length; _i++)
    {
        var _num = string_char_at(_number_string, real(_i) + 1);
                
        if (_num > 0 && _num <= 7)
        {
            _slots[_num]++;
        }
    }
            
    var _text = "";
            
    for (var _i = 1; _i <= 7; _i++)
    {
        if (_slots[_i] > 0)
        {
            if (string_length(_text) > 0)
            {
                _text += ", ";
            }
                    
            _text += string(_i);
        }
    }
	
	var _gmail_id = get_perk_number_from_id("gmail");
	
    var _Part1 = obj_PerkMGMT.PerkTrigText[_gmail_id];
    var _Part2 = scr_Text("perk_desc_gmail", "\n", _text);
    var _UpdatedDesc = string_concat(_Part1, _Part2);
    obj_PerkMGMT.PerkDesc[_gmail_id] = _UpdatedDesc;
            
    if (instance_exists(obj_PerkMGMT.PerkObj[_gmail_id]))
    {
        with (obj_PerkMGMT.PerkObj[_gmail_id])
        {
            MyDesc = _UpdatedDesc;
        }
    }
}


function perk_gmail(){
	var perk_id = "gmail";
	var data = {
	    name: "perk_name_gmail",
	    spr: "spr_FO_Perk_Gmail",
	    trig: "PegFullPop",
	    rarity: 1,
	    type: 0,
	    pool: 1,
	    colour: 0,
	    augmenteffect: 0,
	    desc: "perk_desc_gmail"//, "\n", 1)
	}
	
	forgery.subscribe_to_game_event("RoundIncrease", function(this) {
		scr_FO_gmail_description();
	});

	forgery.register_perk({
		display_name: data.name,
		description: data.desc,
		sprite: agi(data.spr),
		game_event: data.trig,
		tier: data.rarity,
		type: data.type,
		pool: data.pool,
		trigger_fx_color: int64(data.colour),
		additional_info_type: 0,
		on_create: function(this) {
			forgery.run_delayed(1, this, function() {
				scr_FO_gmail_description();
			});
		},
		on_trigger: function(this) {
			with (this) {
				var _slots = [-1, 0, 0, 0, 0, 0, 0, 0];
			    var _number_string = string(global.CurrentRnd);
			    var _number_length = string_length(_number_string);
    
			    for (var _i = 0; _i < _number_length; _i++) {
			        var _num = string_char_at(_number_string, real(_i) + 1);
        
			        if (_num > 0 && _num <= 7)
			            _slots[_num]++;
			    }
    
			    for (var _i = 1; _i <= 7; _i++) {
			        if (_slots[_i] > 0)
			            scr_ForceTrigger(_i, _slots[_i]);
			    }
			}
		}
	}, perk_id);
}