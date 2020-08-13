if(entering){
	
	if(keyboard_check_pressed(vk_anykey)){
/*		if(keyboard_check_pressed(vk_escape)){
			password_entered = array_create(5, 0);
			entering = false;
			obj_player.entering_password = false;
		}*/
	
		//if there's no match in any of the choices
		var allWrong = true
		for(var i = 0; i<5; i++){
			if(!passwordWrong[i]){
				if(keyboard_lastchar == array_get(qteWordsTable[i],currentDigit[i])){
					array_set(password_entered[i],currentDigit[i], 1)
					currentDigit[i] ++;
					allWrong = false
					if(currentDigit[i] >= array_length_1d(password_entered[i])){
						entering = false
						bulletElement = i
						magazineLeft = magazineSize		
					}
				}else{
					for(var j = 0; j<array_length_1d(password_entered[i]); j++){
						array_set(password_entered[i], j, -1)
					}
					passwordWrong[i] = 1
				}
			}
		}
		if(allWrong){
			bulletElement = irandom_range(0,4)
			magazineLeft = magazineSize
			entering = false
		}
		
	}

	exit
}



if(room == rm_main_menu) exit

var dts = delta_time / million// deltatime in second

#region input
input_dash = keyboard_check_pressed(vk_lshift)
input_shoot = mouse_check_button(mb_left)
input_reload = keyboard_check_pressed(ord("R"))
input_using_item = keyboard_check_pressed(ord("F"))
#endregion

#region switch item
var nextItem = keyboard_check_pressed(ord("E"))
var previousItem = keyboard_check_pressed(ord("Q"))

if(nextItem){
	if(itemSelected < itemSize ) itemSelected += 1
	else itemSelected = 1
}
if(previousItem){
	if(itemSelected > 1) itemSelected -= 1
	else itemSelected = itemSize
}
#endregion

#region dashing
if(input_dash){
	if(timeSinceLastDash >= dashingInterval){
		dashing = true
		timeSinceLastDash = 0
	}
}
if(dashing){
	dashingCounter += dts
	if(dashingCounter > dashingTime){
		dashing = false
		dashingCounter = 0
	}
}
timeSinceLastDash += dts
#endregion

#region setting speed
pSpeed = oSpeed

if(dashing)pSpeed = dashingSpeed
#endregion

#region direction input processing
//Horizontal Input
if(keyboard_check_pressed(ord("A"))){
	hDirection = -1
}
if(keyboard_check_released(ord("A"))){
	if(hDirection = -1) hDirection = 0
}
if(keyboard_check_pressed(ord("D"))){
	hDirection = 1
}
if(keyboard_check_released(ord("D"))){
	if(hDirection = 1) hDirection = 0
}
//Prevent the scenario where key is pressed but player is not moving
if(hDirection == 0 && keyboard_check(ord("D"))){
	hDirection = 1
}
if(hDirection == 0 && keyboard_check(ord("A"))){
	hDirection = -1
}


//Vertical Input
if(keyboard_check_pressed(ord("W"))){
	vDirection = -1
}
if(keyboard_check_released(ord("W"))){
	if(vDirection = -1) vDirection = 0
}
if(keyboard_check_pressed(ord("S"))){
	vDirection = 1
}
if(keyboard_check_released(ord("S"))){
	if(vDirection = 1) vDirection = 0
}
//Prevent the scenario where key is pressed but player is not moving
if(vDirection == 0 && keyboard_check(ord("S"))){
	vDirection = 1
}
if(vDirection == 0 && keyboard_check(ord("W"))){
	vDirection = -1
}

#endregion

#region collision processing and diagonal movement speed adjusting

//x and y after the supposing movement
var px = x + hDirection * pSpeed
var py = y + vDirection * pSpeed
	
if(!place_free(px,y)) hDirection = 0
if(!place_free(x,py)) vDirection = 0

//make sure diagonal movement has same speed
if(hDirection != 0 && vDirection != 0){
	pSpeed = pSpeed * 0.707
}


#endregion


#region shooting

if(input_shoot){
	if(timeSinceLastFire > firingInterval) {
		if(magazineLeft > 0){
			repeat(numOfShots){
				var bullet_angle = point_direction(x, y, mouse_x, mouse_y)
				//position of creation is at the edge of the player's sprite
				create_bullet(self, x+player_radius*dcos(bullet_angle), y-player_radius*dsin(bullet_angle), 
					bulletSpeed, bullet_angle, weaponSpread, weaponDamage,bulletElement)
			}
			//this sound shouldn't be played multiple times when using a shot gun, so it's not in the repeat loop
			audio_play_sound(sn_fire, 2, false)
			
			magazineLeft -= 1
			timeSinceLastFire = 0
		} else {
			audio_play_sound(sn_no_ammo, 2, false)
			timeSinceLastFire = 0
		}
	}
}
timeSinceLastFire += dts

#endregion


#region reloading

if(input_reload && magazineLeft != magazineSize && magazineLeft ==0){
	lastReloadSnd = audio_play_sound(sn_reload, 2, false)
	entering = true
	//Element 
	show_element_words()

} 

#endregion


#region using items
if(input_using_item && itemsHeld[# 1,itemSelected-1] > 0){
	var indInItemsTable = itemsHeld[# 0,itemSelected-1]
	script_execute(items.itemsTable[# 1, indInItemsTable])
	itemsHeld[# 1,itemSelected-1] -= 1
}
for(var i = 0; i<ds_grid_height(itemsHeld); i++){
	if(itemsHeld[# 1,i] == 0){
		itemsHeld[# 0,i] = 0
	}
}
#endregion

#region shield regenerate

if (lastHit >= shiledRegeInterval){
	if(shield + regeSpeed*dts < maxShield){
		shield += regeSpeed*dts
	} else {
		shield = maxShield
	}
}
lastHit += dts

#endregion

#region moving
x += hDirection * pSpeed
y += vDirection * pSpeed

global.playerX = x
global.playerY = y
#endregion