///@desc this script load the saved level

if (file_exists("progress.sav")){
	var _root_map = load_JSON_from_file("progress.sav")
	
	
	with(global.player){
		var weaponsHeldString = _root_map[? "weaponsInfo"]
		ds_grid_read(weaponsHeld, weaponsHeldString)
		change_weapon()
		hitpoint = _root_map[? "playerHP"]
	}
	room_goto(_root_map[? "roomNumber"])
} else {
	audio_play_sound(sn_no_ammo, 2, false)
	log("no saves found")
}