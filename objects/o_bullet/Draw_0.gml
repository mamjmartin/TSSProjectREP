
var c = c_white
switch(element){
	case elements.fire:
		c = (c_orange)
		break;
	case elements.earth:
		c = (c_teal)
		break;
	case elements.water:
		c = (c_aqua)
		break;
	case elements.wood:
		c = (c_green)
		break;
	case elements.metal:
		c = (c_silver)
		break;
}

if(collided){
	var dis_anchorToCollision = point_distance(x,y,collisionX,collisionY)
}

if(collided && dis_anchorToCollision >= sprite_width){
	instance_destroy()
	exit
}

if(stepSinceFired*bSpeed < sprite_get_width(s_bullet) && collided){
	draw_sprite_general(s_bullet, 0, dis_anchorToCollision, 0, stepSinceFired*bSpeed-dis_anchorToCollision,
		sprite_get_height(s_bullet),collisionX,collisionY,1,1,180+bDirection,c,c,c,c,1)
} else if(stepSinceFired*bSpeed < sprite_get_width(s_bullet)){
	draw_sprite_general(s_bullet, 0, 0, 0, stepSinceFired*bSpeed, sprite_get_height(s_bullet),
		x,y,1,1,180+bDirection,c,c,c,c,1)
} else if(collided){
	draw_sprite_general(s_bullet, 0, dis_anchorToCollision, 0, sprite_width-dis_anchorToCollision,
		sprite_height,collisionX,collisionY,1,1,180+bDirection,c,c,c,c,1)
} else {
	draw_sprite_ext(s_bullet,0,x,y,1,1,180+bDirection,c,1)
}
draw_set_color(c_white)