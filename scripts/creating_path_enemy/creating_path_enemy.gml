/// @function                   creating_path_enemy(start_x, start_y, finish_x, finish_y);
/// @param  {real}  start_x     The start X position for the path
/// @param  {real}  start_y     The start Y position for the path
/// @param  {real}  finish_x    The finish X position for the path
/// @param  {real}  finish_y    The finish Y position for the path
/// @description                Create a path between two points using the path and MP grid
///                             stored in global variables.

var _sx = argument0;
var _sy = argument1;
var _fx = argument2;
var _fy = argument3;

if (!mp_grid_path(global.enemyGrid, pathEnemy, _sx, _sy, _fx, _fy, true)){
	log("ERROR: creating_path_enemy - No path created")
	return false
}else{
	path_set_kind(global.enemyGrid, 1)
	path_set_precision(global.enemyGrid, 8)
	return true
}