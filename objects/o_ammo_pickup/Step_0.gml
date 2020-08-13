
if(place_meeting(x,y,global.player)){
	with(global.player){
		for(var i = 0; i<ds_grid_height(weaponsHeld); i++){
			weaponsHeld[# 2, i] += floor(weapons.weaponTable[# 6, weaponsHeld[# 0, i]] / 4)
		}
		refresh_ammoleft()
	}
	audio_play_sound(sn_pickup,2,false)
	instance_destroy()
}