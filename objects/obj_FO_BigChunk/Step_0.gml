var _Tar = -1;

if (position_meeting(x, y + vspeed, obj_AnyPeg)) {
    _Tar = instance_position(x, y + vspeed, obj_AnyPeg);
    
    if (_Tar.PegDead == true)
        _Tar = -1;
}

if (instance_exists(_Tar) && _Tar != -1) {
    scr_DoublePeg(_Tar);
    instance_destroy();
}

if (y > room_height)
    instance_destroy();

if (global.GameMode == 0)
    instance_destroy();
