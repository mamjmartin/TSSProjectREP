///@descrpitions pick up a weapon from the map
///this function should be called with o_player as the caller
///@arg weapon_index (in the weaponTable)
///@ret return 1 if the pickup is a new weapon; return 0 if the picked-up weapon is alrealdy in hand and only picked up its ammo

var weaponIndex = argument[0]

//first check is the weapon already in hand. If so, simply pickup all the ammo
for(var i = 0; i<ds_grid_height(weaponsHeld); i++){
	if(weaponIndex == weaponsHeld[# 0, i]){
		weaponsHeld[# 2, i] += weapons.weaponTable[# 6, weaponIndex]
		refresh_ammoleft()
		return 0
	}
}

//if not in hand, add a new weapon with full magazine and full ammo, and switch the current weapon to it
ds_grid_resize(weaponsHeld, ds_grid_width(weaponsHeld), ds_grid_height(weaponsHeld)+1)

var row = ds_grid_height(weaponsHeld)-1
weaponsHeld[# 0, row] = weaponIndex
weaponsHeld[# 1, row] = weapons.weaponTable[# 5, weaponIndex]
weaponsHeld[# 2, row] = weapons.weaponTable[# 6, weaponIndex]

weaponInd = row
change_weapon()
return 1