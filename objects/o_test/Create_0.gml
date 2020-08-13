/// @description Insert description here
// You can write your code in this editor
Function = ds_map_create()
global.test = mp_grid_create(0, 0, room_width / 32, room_height /32, 32, 32)
mp_grid_add_instances(global.test,o_collision,true)
path = path_add();