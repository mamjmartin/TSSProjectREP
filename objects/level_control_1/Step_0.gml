//objective 1: kill all enemyies
if(global.enemyCount == 0){
	portalPassable = true
	o_portal.passable = true
}
//objectvie 2: pass through the portal
if(portalPassable){	
	with(o_portal){
		if(place_meeting(x,y,global.player)){
			room_goto_next()
		}
	}
}