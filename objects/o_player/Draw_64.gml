if(room == rm_main_menu) exit

draw_rectangle_color(310,630,350,660,c_white,c_white,c_white,c_white,false)
draw_text_color(320,640,string(magazineLeft),c_black,c_black,c_black,c_black,1)

draw_hp()
draw_aiming_circle()

draw_weapon()

draw_items_bar()


if(entering){
	//below should be in draw event

	draw_sprite_ext(s_console_entrance, 0, 100,100,5,5,0,c_white,1)
	for(var j = 0; j<5; j++){
		for(var i = 0; i< array_length_1d(qteWordsTable[j]); i++){
			
			var c = c_white;
			if(array_get(password_entered[j],i) == 1){c = c_orange}	
			else if(array_get(password_entered[j],i) == -1){c = c_gray}
			var text_length = sprite_get_width(s_console_entrance) - 20
			var text_sep = 50
			draw_set_font(fnt_consolas_12)
			draw_text_color(300 - text_length/2 + i*text_sep, 120+j*20, array_get(qteWordsTable[j],i), c, c, c, c, 1)
			draw_set_font(fnt_arial_12)
		}
	}
}

#region draw items
var xx = 26
var c = c_white
if(itemsHeld[# 0,0] != -1){
	for (var i = 0; i<itemsNum; i++){
		var indexInItemsTable =  itemsHeld[# 0, i]
		if(itemsHeld[# 1,i] != 0){
		draw_sprite(items.itemsTable[# 2,indexInItemsTable],0,xx,714)
		draw_text_color(xx-6,670,string(itemsHeld[# 1,i]),c,c,c,c,1)
		}
		xx += 32
	}
}
#endregion