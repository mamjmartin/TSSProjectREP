exit

if !surface_exists(surf)
    {
    surf = surface_create(1024, 1024);
	}

    surface_set_target(surf);
        var _vx = camera_get_view_x(view_camera[1]);
        var _vy = camera_get_view_y(view_camera[1]);
        draw_sprite(s_player, 0, o_player.x - _vx, o_player.y - _vy);
    surface_reset_target();


if(surface_exists(surf)){
    draw_surface(surf, 0, 0)
}