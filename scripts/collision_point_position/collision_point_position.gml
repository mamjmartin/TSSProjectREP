///@description collision_point_position() do a 2d raycast and return the position of the collision
///@arg startX
///@arg startY
///@arg endX
///@arg endY
///@return array[0] collision position X, array[1] collision position Y

var startX = argument[0]
var startY = argument[1]
var endX = argument[2]
var endY = argument[3]

while(true){
	var collision_count = collision_line(startX,startY,(startX+endX)/2,(startY+endY)/2,
							o_collision,true,true)
	if(collision_count == noone){
		startX = (startX+endX)/2
		startY = (startY+endY)/2
	} else {
		endX = (startX+endX)/2
		endY = (startY+endY)/2
	}
			
	if(point_distance(startX,startY,endX,endY) < 1)break;	
}


var arr
arr[0] = startX
arr[1] = startY

return arr
