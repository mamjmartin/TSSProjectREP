/// @description Insert description here
// You can write your code in this editor
sprite_index = items.itemsTable[# 3,itemIndex]

var ind = itemIndex
var alreadyHave = false

if(place_meeting(x,y,global.player)){
	with(global.player){
		//check if already have this item
		for(var i = 0; i<ds_grid_height(itemsHeld)-1; i++){
			//case: already this item before
			if(itemsHeld[# 0, i] == ind && itemsHeld[# 1, i] != 0){
				alreadyHave = true
				//if already have, check if less than capacity
				if(itemsHeld[# 1, i] < items.itemsTable[# 4,ind]){
					itemsHeld[# 1, i] += 1
				}
			}
		}
		//case: not have this item before
		if(alreadyHave == false){
			itemsNum +=1
			//find an empty place to add this item in the grid
			for(var k = 0; k<ds_grid_height(itemsHeld)-1; k++){
				if(itemsHeld[# 1,k] == 0){
					itemsHeld[# 0,k] = ind
					itemsHeld[# 1,k] = 1
					break
				}
			}
		}
	}
	audio_play_sound(sn_pickup,2,false)
	instance_destroy()
}