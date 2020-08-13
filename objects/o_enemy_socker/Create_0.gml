/// @description Insert description here
// You can write your code in this editor
event_inherited()
#region init variables
//initialize state
state = states.idle

//for moving
movingSpeed = global.sockerMovingSpeed
slowMSpeed = global.sockerSlowSpeed

//view ranges
suspicionRange = 600
alertRange = 200
attackRange = 20
hearingRange = 400

//alert level
fullAlertLevel = 100
suspicionLevel = 50
currentAlertLevel = 0
alRisingSpeed = 20 //alert level rising speed in points per second
alLoweringSpeed = 10
//how long it will stay alert if not seen the player
alertDuration = 3
alertStateCountdown = alertDuration

//for attack
attackInterval = 1.5
timeSinceLastFire = attackInterval + 1
//attackBackswing = 
bulletSpeed = 80
weaponSpread = 15
hitpointDamage = 10
attackTime = 1
attacking = false
shieldDamage = 25
weaponDamage = 20

sprite_radius = 16


//shield and hitpoint
maxHitpoint = 40
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