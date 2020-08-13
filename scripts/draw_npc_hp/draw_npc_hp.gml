//draw the hitpoint of npc on top of their head

var barLenth = 48
var barWidth = 6
var lineStartX = x - barLenth/2
var lineY = y - 24
var hpColor = c_red
var shieldColor = $ffff00
//spacing between hp bar and shiled bar
var hpShieldSpacing = 0

var hitpointLengthRatio =  (barLenth-hpShieldSpacing)/(maxHitpoint+maxShield)

if(hitpoint != 0){
	draw_line_width_color(lineStartX, lineY, lineStartX+hitpoint*hitpointLengthRatio,lineY,
		barWidth,hpColor,hpColor)
}

if(shield != 0){
	draw_line_width_color(lineStartX+hitpoint*hitpointLengthRatio+hpShieldSpacing, lineY,
		lineStartX+hitpoint*hitpointLengthRatio+hpShieldSpacing+shield*hitpointLengthRatio,
		lineY,barWidth,shieldColor,shieldColor)

}




