//draw current weapon and ammo in the gui

draw_sprite_ext(weaponSprite, 0, 880,660,4,4,0,c_white,1)
draw_text(900,600, string(ammoLeft))