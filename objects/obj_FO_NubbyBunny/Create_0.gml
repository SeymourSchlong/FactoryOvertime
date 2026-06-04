image_speed = 0;
NubbyScale = obj_LvlMGMT.NubbyScale * 0.75 * scr_FO_WandCount();
PartSpawnTime = 5;
PartTimer = PartSpawnTime;
global.TargetNubby = id;

NubbySkinSpr = agi("spr_FO_NubbyBunny");

StoreDir = 0;
DrawPainFlash = 0;
ForceKillNubby = 0;
GutsSpr = agi("spr_Part_NubbyGuts");
gravity = global.Gravity*0.8;

if (instance_number(obj_ParNubby) > 256)
    instance_destroy();