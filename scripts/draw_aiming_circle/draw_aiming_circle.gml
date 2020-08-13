///@descriptions draw the aiming circle on GUI

var wMouseX = window_mouse_get_x()
var wMouseY = window_mouse_get_y()

draw_circle(wMouseX,wMouseY,20,true)
draw_line(wMouseX+6, wMouseY, wMouseX+14, wMouseY)
draw_line(wMouseX-6, wMouseY, wMouseX-14, wMouseY)
draw_line(wMouseX, wMouseY+6, wMouseX, wMouseY+14)
draw_line(wMouseX, wMouseY-6, wMouseX, wMouseY-14)

if(reloading){
	var reloadRatio = reloadCounter/reloadTime
	var segments = floor(40*(1-reloadRatio))
	draw_arc(wMouseX, wMouseY, 35, 360*(1-reloadRatio), 90+360*reloadRatio, segments, $aaaa00, 6)
}