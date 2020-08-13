var smoke_angle = point_direction(x, y, mouse_x, mouse_y)
		smoke1 = instance_create_layer( x+2*player_radius*dcos(smoke_angle), y-2*player_radius*dsin(smoke_angle),
		"Instances", o_smoke)