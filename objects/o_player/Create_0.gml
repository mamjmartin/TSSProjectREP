entering = false
password_entered = array_create(5)
currentDigit = 0
passwordWrong = array_create(5)
currentDigit = array_create(5)

#region init globals
global.player = self

global.playerX = x
global.playerY = y
#endregion

#region init variables

//shield and hitpoint
maxHitpoint = 100
hitpoint = maxHitpoint
maxShield = 50
shield = maxShield
shiledRegeInterval = 3
lastHit = 0
regeSpeed = 20 //per second

weaponDamage = 20
firingInterval = 0.2
weaponSpread = 10
numOfShots = 1
magazineSize = 24
bulletSpeed = 80
weaponSprite = s_assault_rifle

magazineLeft = 24
ammoLeft = 100000

//for reloading
reloading = false
reloadTime = 3
reloadCounter = 0
lastReloadSnd = noone
bulletElement = elements.fire
difficultyTier = 0
qteWordsTable = noone

//for shooting
timeSinceLastFire = firingInterval+1
player_radius = 16


//for items
itemsNum = 0
itemSelected = 1
itemSize = 4
//columns: item sprite, item contain number
itemsHeld = ds_grid_create(2,4)
itemsHeld[# 0,0] = -1




//current h/v direction of moving(alter between 1 and -1)
hDirection = 0
vDirection = 0
//original speed
oSpeed = 5
pSpeed = oSpeed


//for dashing
dashingInterval = 1.5
timeSinceLastDash = dashingInterval+1
dashing = false
dashingSpeed = oSpeed*5
dashingTime = 0.2
dashingCounter = 0


#endregion

#region init functions
Function = ds_map_create()
Function[? "damaged"] = player_damaged
Function[? "destroyed"] = player_destroyed
#endregion