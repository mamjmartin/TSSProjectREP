///@descrpition draw player's hitpoint and shield
// hitpoint bar span from 200,700 to 800,700


var hpColor = c_red
var shieldColor = $ffff00
var hitpointWidth = 20
//spacing between hp bar and shiled bar
var hpShieldSpacing = 5

var hitpointLengthRatio =  (600-hpShieldSpacing)/(maxHitpoint+maxShield)

if(hitpoint > 0){
draw_rectangle_color(200, 700, 200+hitpoint*hitpointLengthRatio, 700+hitpointWidth,
	hpColor, hpColor, hpColor, hpColor, false)
draw_text_color(200, 730, string(floor(hitpoint)), hpColor, hpColor, hpColor, hpColor, 1)
}
if(shield > 0){
draw_rectangle_color(200+hitpoint*hitpointLengthRatio+hpShieldSpacing, 700, 
	200+hitpoint*hitpointLengthRatio+hpShieldSpacing+shield*hitpointLengthRatio, 700+hitpointWidth,
	shieldColor, shieldColor, shieldColor, shieldColor, false)
draw_text_color(200+hitpoint*hitpointLengthRatio+hpShieldSpacing, 730, string(floor(shield)),
	shieldColor, shieldColor, shieldColor, shieldColor, 1)
}
