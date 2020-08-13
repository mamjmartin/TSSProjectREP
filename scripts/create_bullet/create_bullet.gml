///@descriptions create a bullet in certain direction
///@arg origin_object  
///@arg x 
///@arg y 
///@arg speed
///@arg angle
///@arg spread
///@arg damage
///@arg element

var bulletFrom = argument[0]
var bulletX = argument[1]
var bulletY = argument[2]
var bulletSpeed = argument[3]
var bulletAngle = argument[4]
//fan-shaped spread in degrees
var bulletSpread = argument[5]
var bulletDamage = argument[6]
var bulletElement = argument[7]

//n controls the distribution the larger the n, the closer to the center the distribution
//even distribution when n = 1
var n = 4
repeat(n){
	bulletAngle += random_range(bulletSpread/2/n,-bulletSpread/2/n)
}

var bullet = instance_create_layer(bulletX, bulletY, "Instances",o_bullet)

bullet.bSpeed = bulletSpeed
bullet.bDirection = bulletAngle
bullet.lastPosX = bulletX
bullet.lastPosY = bulletY
bullet.creator = bulletFrom
bullet.damage = bulletDamage
bullet.element = bulletElement

//enemy hearing -> start chasing
with(o_par_enemy){
	if(point_distance(bulletX,bulletY,x,y) < hearingRange){
		state = states.chasing
	}
}