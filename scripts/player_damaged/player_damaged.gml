///descrpitions 
///@arg damage

var damage = argument[0]

if(shield > 0){
	if(shield - damage > 0){
		//shield exists and can take the damage
		shield -= damage
	} else {
		//shield exists but will be destroyed
		hitpoint -= damage - shield
		shield = 0
	}
		
} else {
	//shield already destroyed
	if(hitpoint - damage > 0){
		hitpoint -= damage
	} else {
		hitpoint = 0
		script_execute(Function[? "destroyed"])
	}
}

lastHit = 0

//log("hp: " + string(hitpoint) + "  shiled: " + string(shield))