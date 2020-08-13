/// @description Insert description here
// You can write your code in this editor
event_inherited()

#region init variables


//for attack
attackInterval = 0.3
timeSinceLastFire = attackInterval + 1
//attackBackswing = 
bulletSpeed = 100
weaponSpread = 30
weaponDamage = 15

sprite_radius = 16


//shield and hitpoint
maxHitpoint = 120
hitpoint = maxHitpoint
maxShield = 40
shield = maxShield
shiledRegeInterval = 3
lastHit = 0
regeSpeed = 20 //per second

//for searching
lastSawPlayerX = 0
lastSawPlayerY = 0


#endregion