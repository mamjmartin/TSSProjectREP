
var dts = delta_time / million
if(!targetArrived){

	var CollisionCheck = instance_place(x + dts * vH * dcos(dir), 
	y - dts * vH * dsin(dir), o_collision)
	if(CollisionCheck != noone){
		
		#region point A
		var collisionA = collision_point_position(x + 2*dcos(dir+90),
		y - 2*dsin(dir+90),x + 2*dcos(dir+90)+dcos(dir)*2*vH,
		y - 2*dsin(dir+90)-dsin(dir)*2*vH)
		#endregion
		
		#region point B
		var collisionB = collision_point_position(x,y,x+dcos(dir)*2*vH,y-dsin(dir)*2*vH)
		#endregion
		
		#region point C
		var collisionC = collision_point_position(x - 2*dcos(dir+90),
		y + 2*dsin(dir+90),x - 2*dcos(dir+90) + dcos(dir)*2*vH,
		y + 2*dsin(dir+90)-dsin(dir)*2*vH)
		#endregion
		
		var directionBA = point_direction(collisionB[0],collisionB[1],collisionA[0],collisionA[1])
		var directionBC = point_direction(collisionB[0],collisionB[1],collisionC[0],collisionC[1])
		var directionNormal = (directionBC + directionBA) * 0.5
		dir = (2 * directionNormal - 180 - dir) mod 360
		vH = vH  * (1-(1-bounceLostProportion)/2)
	}
	

	x += dts * vH * dcos(dir)
	y -= dts * vH * dsin(dir)
	if(!bounceStopped){
		v += dts * g
		s += dts * v
		y_offset = -s
		if(v < 0 && s < 0){
			v = -v * bounceLostProportion - bounceLostConstant
			vH = vH  * (1-(1-bounceLostProportion)/2)
			if(v<0) bounceStopped = true
		}
	}else{
		vH -= frictionAcc * dts
	}
	if( vH <0) {
		targetArrived = true
		collision_circle_list(x,y,200,o_par_enemy,true,true,smokeCollisionList,false)
		var yy = 0
		repeat(ds_list_size(smokeCollisionList)){
		smokeCollisionList[| yy].movingSpeed = 2
		smokeCollisionList[| yy].slowMSpeed = 0.5
		yy += 1
		}
		alarm[1] = room_speed * destroyTime
	}
}