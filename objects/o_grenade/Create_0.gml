Function = ds_map_create()
targetArrived = false
dir = point_direction(o_player.x, o_player.y, mouse_x, mouse_y)
boomTime = 1
destroyTime = 0.2
boomCollisionList = ds_list_create()
boom = false
damage = 40
alarm[0] = room_speed * boomTime
