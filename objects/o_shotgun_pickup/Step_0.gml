
if(place_meeting(x,y,global.player)){
	var weaponIndex = pickupWeaponInd
	with(global.player){
		pickup_weapon(weaponIndex)
	}
	audio_play_sound(sn_pickup,2,false)
	instance_destroy()
}