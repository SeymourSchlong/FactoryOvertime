// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function perk_pingpong(){
	var perk_id = "pingpong";
	var data = {
	    name: "perk_name_pingpong",
	    spr: "spr_Perk_PingPong",
	    trig: "HitWall2",
	    rarity: 0,
	    type: 0,
	    pool: 1,
	    colour: 0,
	    augmenteffect: 0,
	    desc: "perk_desc_pingpong"
	}

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
		on_create: function() {},
		on_trigger: function(this) {
			with (this) {
				var _Left = false;
			    var _Right = false;
    
			    with (obj_ParNubby) {
			        if (x < 960)
			            _Left = true;
			        else
			            _Right = true;
			    }
    
			    if (_Left)
			        scr_ForceTrigger(2, 1);
    
			    if (_Right)
			        scr_ForceTrigger(6, 1);
			}
		}
	}, perk_id);
}