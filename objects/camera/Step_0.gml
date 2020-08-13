//follow target

if(instance_exists(target)){
	//set center of camera at 1/3 point between player and aiming circle
	global.cameraX = lerp(target.x, mouse_x, 1/3) - (global.cameraWidth/2)
	global.cameraY = lerp(target.y, mouse_y, 1/3) - (global.cameraHeight/2)
	
	//make sure the player does not go out of view when aiming
	global.cameraX = clamp(global.cameraX, target.x-(global.cameraWidth-widthBound), target.x-widthBound)
	global.cameraY = clamp(global.cameraY, target.y-(global.cameraHeight-heightBound), target.y-heightBound)

	//make sure the camera does not go out of room
	global.cameraX = clamp(global.cameraX, 0, room_width-global.cameraWidth)
	global.cameraY = clamp(global.cameraY, 0, room_height-global.cameraHeight)
}

//camera shake
global.cameraX += random_range(-global.cameraShake, global.cameraShake)
global.cameraY += random_range(-global.cameraShake, global.cameraShake)

if(global.cameraShake > 0){
	global.cameraShake -= 0.2
	if(global.cameraShake < 0)global.cameraShake = 0
}

camera_set_view_pos(view_camera[0], global.cameraX, global.cameraY)