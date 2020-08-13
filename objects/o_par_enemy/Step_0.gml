var dts = delta_time / million
//mp_potential_settings(3, 10, 30, true)



if(state == states.idle){
	#region idle
	
	//if in view range and view not blocked, raise alert level
	if(distance_to_object(global.player) < suspicionRange && check_line_of_sight(self,global.player,o_collision)){
		currentAlertLevel += alRisingSpeed*dts
	}else{
		currentAlertLevel -= alLoweringSpeed*dts
		if(currentAlertLevel <= 0) currentAlertLevel = 0
	}
	
	//if passed the suspicion level, change state to suspicion
	if(currentAlertLevel >= suspicionLevel){
		state = states.suspicion
	}
	//if in a closer range, immediately fill the alert level and change to alert state
	if(distance_to_object(global.player) < alertRange && check_line_of_sight(self,global.player,o_collision)){
		currentAlertLevel = fullAlertLevel
		state = states.alert
		alertStateCountdown = alertDuration
	}
	#endregion
}

else if(state == states.suspicion){
	#region suspicion
	
	if(distance_to_object(global.player) < suspicionRange && check_line_of_sight(self,global.player,o_collision)){
		//if in sight, raises alert level and slowly move towards the player
		currentAlertLevel += alRisingSpeed*dts
		
		mp_potential_settings(30,10,slowMSpeed,true)
		if(mp_potential_path(pathEnemy,global.playerX-dcos(direEnemy)*(o_player.player_radius + o_par_enemy.sprite_radius)
		,global.playerY+dsin(direEnemy)*(o_player.player_radius + o_par_enemy.sprite_radius),slowMSpeed,4,false)){
			log("P")
		}else{
			mp_grid_path(global.enemyGrid,pathEnemy,x,y,global.playerX,global.playerY,1)
			log("G")
		}
		x_cur = path_get_point_x(pathEnemy,0)
		y_cur = path_get_point_y(pathEnemy,0)
		x_next = path_get_point_x(pathEnemy,1)
		y_next = path_get_point_y(pathEnemy,1)
		direEnemy = point_direction(x_cur,y_cur,x_next,y_next)
		mp_linear_step(x_next,y_next,slowMSpeed,false)
		//mp_potential_step(global.playerX, global.playerY, slowMSpeed, false)
	}else{
		//if out of sight, lowering the alert level
		currentAlertLevel -= alLoweringSpeed*dts
	}
	
	//if lowered enough, back to idle
	if(currentAlertLevel < suspicionLevel) state = states.idle
	
	//if alert tank is filled, change to alert state
	if(currentAlertLevel > fullAlertLevel){
		currentAlertLevel = fullAlertLevel
		state = states.alert
		alertStateCountdown = alertDuration
	}
	
	//if in a closer range, immediately fill the alert level and change to alert state
	if(distance_to_object(global.player) < alertRange && check_line_of_sight(self,global.player,o_collision)){
		currentAlertLevel = fullAlertLevel
		state = states.alert
		alertStateCountdown = alertDuration
	}
	#endregion
}

else if(state == states.alert){
	#region alert
	
	//if in line of sight, start chasing (regardless of distance)
	if(check_line_of_sight(self,global.player,o_collision)){
		state = states.chasing
		//reset countdown
		//actually, this countdown need to be reset every time the state is changed to alert state
		alertStateCountdown = alertDuration
	} else {
		//if not in sight, starts countdown, and change to suspicion when countdown finshed
		alertStateCountdown -= dts
		if(alertStateCountdown <= 0){
			state = states.suspicion
			currentAlertLevel -= alLoweringSpeed*dts
		}
	}
	
	
	#endregion
}

else if(state == states.chasing){
	#region chasing
	
	//if in range, change state to attack
	if(distance_to_object(global.player) < attackRange){
		state = states.attack
	}else{
		//move towards the player
		mp_potential_settings(30,10,movingSpeed,true)
		if(mp_potential_path(pathEnemy,global.playerX-dcos(direEnemy)*(o_player.player_radius + o_par_enemy.sprite_radius)
		,global.playerY+dsin(direEnemy)*(o_player.player_radius + o_par_enemy.sprite_radius),movingSpeed,4,false)){
			log("P")
		}else{
			mp_grid_path(global.enemyGrid,pathEnemy,x,y,global.playerX,global.playerY,1)
			log("G")
		}
		x_cur = path_get_point_x(pathEnemy,0)
		y_cur = path_get_point_y(pathEnemy,0)
		x_next = path_get_point_x(pathEnemy,1)
		y_next = path_get_point_y(pathEnemy,1)
		direEnemy = point_direction(x_cur,y_cur,x_next,y_next)
		mp_linear_step(x_next,y_next,movingSpeed,false)
		#region debug message
		/*
		log("point distance" + string(point_distance(x, y, x_goto, y_goto)))
		log("x" + string(x))
		log("y" + string(y))
		log("xg" + string(x_goto))
		log("yg" + string(y_goto))
		log("CCC" + string( PathPointNum))
		*/
		#endregion

	}
	//if player get out of sight, change state to searching
	if(!check_line_of_sight(self, global.player, o_collision)){
		state = states.searching
		lastSawPlayerX = global.playerX
		lastSawPlayerY = global.playerY
	}
	#endregion
}

else if(state == states.searching){
	#region searching
	
	//move to the place that saw the player last time
	mp_potential_settings(30,10,movingSpeed,true)
	if(mp_potential_path(pathEnemy,lastSawPlayerX, lastSawPlayerY,movingSpeed,4,false)){
		log("P")
	}else{
		mp_grid_path(global.enemyGrid,pathEnemy,x,y,lastSawPlayerX, lastSawPlayerY,1)
		log("G")
	}
	x_cur = path_get_point_x(pathEnemy,0)
	y_cur = path_get_point_y(pathEnemy,0)
	x_next = path_get_point_x(pathEnemy,1)
	y_next = path_get_point_y(pathEnemy,1)
	direEnemy = point_direction(x_cur,y_cur,x_next,y_next)
	mp_linear_step(x_next,y_next,movingSpeed,false)
	//if it gets close enough to the last seen location, change state to alert
	if(point_distance(x, y, lastSawPlayerX, lastSawPlayerY) <= movingSpeed){
		state = states.alert
		alertStateCountdown = alertDuration
	}
	//if player is in view(just not blocked 360 actually), starts to chase it
	if(check_line_of_sight(self, global.player, o_collision)){
		state = states.chasing
	}
	#endregion
}

else if(state == states.attack){
	#region attack
	
	//when in state attack, the path will stop
	if(check_line_of_sight(self,global.player,o_collision)){
		if(timeSinceLastFire >= attackInterval){
			var bullet_angle = point_direction(x, y, global.playerX, global.playerY)
			create_bullet(self, x+sprite_radius*dcos(bullet_angle), y-sprite_radius*dsin(bullet_angle), 
			bulletSpeed, bullet_angle, weaponSpread, weaponDamage)
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

#region shield regenerate

if (lastHit >= shiledRegeInterval){
	if(shield + regeSpeed*dts < maxShield){
		shield += regeSpeed*dts
	} else {
		shield = maxShield
	}
}
lastHit += dts

#endregion

timeSinceLastFire += dts