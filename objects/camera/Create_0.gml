
target = o_player

global.cameraWidth = camera_get_view_width(view_camera[0])
global.cameraHeight = camera_get_view_height(view_camera[0])

//ensure the player is not moved out of view when aiming
widthBound = global.cameraWidth*0.3
heightBound = global.cameraHeight*0.3

global.cameraShake = 0