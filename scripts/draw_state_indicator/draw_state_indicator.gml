

var stateSignX = x
var stateSignY = y-40

if(state == states.idle){
	if(currentAlertLevel > 0){
		
		var alertRatio = currentAlertLevel/suspicionLevel
		var segments = floor(40*alertRatio)
		var arcColor = merge_color(c_green, c_yellow, alertRatio)
		
		draw_sprite_ext(s_suspicion_sign,0,stateSignX,stateSignY,1,1,0,c_white, alertRatio*0.5)
		draw_arc(stateSignX,stateSignY, 10, alertRatio*360, 90, segments, arcColor, 2)
	}
}

else if(state == states.suspicion){
	var alertRatio = (currentAlertLevel-suspicionLevel)/(fullAlertLevel-suspicionLevel)
	var segments = floor(40*alertRatio)
	var arcColor = c_red
		
	draw_sprite_ext(s_suspicion_sign,0,stateSignX,stateSignY,1,1,0,c_white, 1)
	draw_arc(stateSignX,stateSignY, 10, 360, 90, 40, c_yellow, 2)
	draw_arc(stateSignX,stateSignY, 10, alertRatio*360, 90, segments, arcColor, 2)
}

else if(state == states.alert || state == states.chasing || state == states.attack || state == states.searching){
	draw_sprite_ext(s_alert_sign,0,stateSignX,stateSignY,1,1,0,c_white, 1)
}