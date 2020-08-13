enum weapon{
	pistol,
	assualtRiffle,
	shotgun
}
weaponTable = ds_grid_create(9,4)
//name, damage, firing_interval (inverse to rate of fire), spread, bullets_per_shot, magazine, ammo, speed, sprite_index

//pistol
ds_grid_add(weaponTable,0,0,"pistol")
ds_grid_add(weaponTable,1,0,20)
ds_grid_add(weaponTable,2,0,0.25)
ds_grid_add(weaponTable,3,0,8)
ds_grid_add(weaponTable,4,0,1)
ds_grid_add(weaponTable,5,0,8)
ds_grid_add(weaponTable,6,0,32)
ds_grid_add(weaponTable,7,0,60)
ds_grid_add(weaponTable,8,0,s_pistol)

//assualt riffle
ds_grid_add(weaponTable,0,1,"assault rifle")
ds_grid_add(weaponTable,1,1,10)
ds_grid_add(weaponTable,2,1,0.1)
ds_grid_add(weaponTable,3,1,12)
ds_grid_add(weaponTable,4,1,1)
ds_grid_add(weaponTable,5,1,24)
ds_grid_add(weaponTable,6,1,96)
ds_grid_add(weaponTable,7,1,80)
ds_grid_add(weaponTable,8,1,s_assault_rifle)

//shotgun
ds_grid_add(weaponTable,0,2,"shotgun")
ds_grid_add(weaponTable,1,2,5)
ds_grid_add(weaponTable,2,2,0.3)
ds_grid_add(weaponTable,3,2,25)
ds_grid_add(weaponTable,4,2,10)
ds_grid_add(weaponTable,5,2,8)
ds_grid_add(weaponTable,6,2,24)
ds_grid_add(weaponTable,7,2,80)
ds_grid_add(weaponTable,8,2,s_shotgun)

//shotgun
ds_grid_add(weaponTable,0,3,"shotgun")
ds_grid_add(weaponTable,1,3,5)
ds_grid_add(weaponTable,2,3,0.3)
ds_grid_add(weaponTable,3,3,25)
ds_grid_add(weaponTable,4,3,10)
ds_grid_add(weaponTable,5,3,8)
ds_grid_add(weaponTable,6,3,24)
ds_grid_add(weaponTable,7,3,80)
ds_grid_add(weaponTable,8,3,s_shotgun)

