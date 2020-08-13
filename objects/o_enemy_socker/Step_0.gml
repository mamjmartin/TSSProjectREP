/// @description Insert description here
// You can write your code in this editor
var dts = delta_time / million
event_inherited()
if(state != states.attack){
	movingSpeed = global.sockerMovingSpeed
	slowMSpeed = global.sockerSlowSpeed
}

if(state == states.attack){
	#region attack
	
	if(check_line_of_sight(self,global.player,o_collision)){
		if(timeSinceLastFire >= attackInterval && attacking == false){
			var attack_angle = point_direction(x, y, global.playerX, global.playerY)
			attacking = true
			timeSinceLastFire = 0
			
			audio_play_sound(sn_fire, 2, false)
		}
	} else {
		state = states.chasing
		alertStateCountdown = alertDuration
	}
	
	if(distance_to_object(global.player)> attackRange) state = states.chasing
	
	#endregion
}
if(attacking == true){
	movingSpeed = 0
	slowMSpeed = 0
	attackTime -= dts
	log("attack")
	if(attackTime <= 0){
		attacking = false
		attackTime = 1
		log("refresh")
	}
}