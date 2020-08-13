///@description check if the stright line between two objects is blocked
///@arg from
///@arg to
///@arg blocker
///@return true if not blocked false if otherwise

var from = argument[0]
var to = argument[1]
var blocker = argument[2]

return (collision_line(from.x,from.y,to.x,to.y,blocker,false,true) == noone)