if (array_length(queue) == 0) {
	instance_destroy();
	exit;
}

var _perk_to_give = array_pop(queue);
scr_FO_GivePerk(_perk_to_give);

alarm_set(0, 10);