
draw_sprite(items.itemsTable[# 2,0], 0, x, y+y_offset)
if(targetArrived){
	draw_set_alpha(0.3);
	draw_circle_color(x,y,200,c_white,c_white,false)
	draw_set_alpha(1);
}