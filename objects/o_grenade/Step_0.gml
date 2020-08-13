/// @description Insert description here
// You can write your code in this editor
//move_bounce_solid(1)
if(targetArrived == false){
	x += 3 * dcos(dir)
	y -= 3 * dsin(dir)
}

if(targetArrived == true && boom == false){
	collision_circle_list(x,y,200,o_par_enemy,true,true,boomCollisionList,false)
	var yy = 0;
	repeat(ds_list_size(boomCollisionList)){
		var CollisionObj = boomCollisionList[| yy]
		var damage = self.damage
		with(CollisionObj){
			if (!is_undefined(Function[? "damaged"])){
				script_execute(Function[? "damaged"], damage)
			}
		}
		yy += 1
	}
	boom = true
}

