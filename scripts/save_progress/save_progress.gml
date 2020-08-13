///@desc this script saves the level's room index and player's weapon and hitpoint information
/// should be called by a level controller

var _root_map = ds_map_create()

_root_map[? "roomNumber"] = room

//ds_grid cannot be directly stored in ds_map; it has to be first converted to a string
var weaponsHeldString = ds_grid_write(global.player.weaponsHeld)
_root_map[? "weaponsInfo"] = weaponsHeldString

//other important methods in saving that will not be used here
//ds_map_add_list()
//ds_map_add_map()
//ds_list_mark_as_list()
//ds_list_mark_as_map()
_root_map[? "playerHP"] = global.player.hitpoint

//save the root map into a string
var _string = json_encode(_root_map)
save_string_to_file("progress.sav", _string)

//destroy all data
ds_map_destroy(_root_map)