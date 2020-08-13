var indexInWeaponTable =  weaponsHeld[# 0, weaponInd]

weaponName = weapons.weaponTable[# 0, indexInWeaponTable]
weaponDamage = weapons.weaponTable[# 1, indexInWeaponTable]
firingInterval = weapons.weaponTable[# 2, indexInWeaponTable]
weaponSpread = weapons.weaponTable[# 3, indexInWeaponTable]
numOfShots = weapons.weaponTable[# 4, indexInWeaponTable]
magazineSize = weapons.weaponTable[# 5, indexInWeaponTable]
bulletSpeed = weapons.weaponTable[# 7, indexInWeaponTable]
weaponSprite = weapons.weaponTable[# 8, indexInWeaponTable]

magazineLeft = weaponsHeld[# 1, weaponInd]
ammoLeft = weaponsHeld[# 2, weaponInd]



reloading = false
reloadCounter = 0
audio_stop_sound(sn_reload)