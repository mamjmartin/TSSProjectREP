var grenade_angle = point_direction(x, y, mouse_x, mouse_y)
		 grenade1 = instance_create_layer( x+2*player_radius*dcos(grenade_angle), y-2*player_radius*dsin(grenade_angle),
		"Instances", o_grenade)