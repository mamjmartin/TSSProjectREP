
stepSinceFired += 1

x += bSpeed * dcos(bDirection)
y -= bSpeed * dsin(bDirection)

if(!collided){
	//stored the collided objects
	var collision_list = ds_list_create()
	//whether there is collision with bullet in this step
	//var collision_found = false
	
	var collision_count = collision_line_list(x,y,xprevious,yprevious,all,true,true,
								collision_list,false)
	
	//make sure the collision isn't with the creator or with another bullet
	//also set the collision object if found
	//also do damage on the object(if possible)
	if(collision_count != 0){
		for(var i = 0; i<ds_list_size(collision_list); i++){
			if(collision_list[| i] != creator && collision_list[| i].object_index != o_bullet){
				collided = true
				collidedObject = collision_list[| i]
				
				var damage = self.damage
				with(collidedObject){
					if (!is_undefined(Function[? "damaged"])){
						script_execute(Function[? "damaged"], damage)
					}
				}
				break
			}
		}
	}
	
	//find the precise point of collision
	if(collided){//if there is only one collision, make sure it is not the creator or another bullet
		
		var startX = xprevious
		var startY = yprevious
		var endX = x
		var endY = y
		
		//repeat if collision is found until find the presice point of collision (less than 1 pixel error)
		//using binary search
		while(true){
			collision_count = collision_line_list(startX,startY,(startX+endX)/2,(startY+endY)/2,
									all,true,true,collision_list,false)
			if(collision_count == 0){
				startX = (startX+endX)/2
				startY = (startY+endY)/2
			} else {
				endX = (startX+endX)/2
				endY = (startY+endY)/2
			}
			
			if(point_distance(startX,startY,endX,endY) < 1)break;	
		}
		collisionX = startX
		collisionY = startY
		
		
		global.cameraShake = 6
	}
}