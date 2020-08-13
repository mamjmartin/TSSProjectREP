///@descrpition return true if the object is clicked this step

if(mouse_check_button_released(mb_left)){
	if(collision_point(mouse_x,mouse_y,self,true,false) == self){
		return true
	}
}

return false