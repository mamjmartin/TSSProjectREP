#region init variables
//initialize state
state = states.idle

//for moving
movingSpeed = global.normalEnemyMovingSpeed
slowMSpeed = global.normalEnemySlowSpeed

//view ranges
suspicionRange = 600
alertRange = 200
attackRange = 350
hearingRange = 400

//alert level
fullAlertLevel = 100
suspicionLevel = 50
currentAlertLevel = 0
alRisingSpeed = 20 //alert level rising speed in points per second
alLoweringSpeed = 10
//how long it will stay alert if not seen the player
alertDuration = 3
alertStateCountdown = alertDuration

//for attack
attackInterval = 1.5
timeSinceLastFire = attackInterval + 1
//attackBackswing = 
bulletSpeed = 80
weaponSpread = 15
weaponDamage = 20

sprite_radius = 16


//shield and hitpoint
maxHitpoint = 100
hitpoint = maxHitpoint
maxShield = 50
shield = maxShield
shiledRegeInterval = 3
lastHit = 0
regeSpeed = 20 //per second

//for searching
lastSawPlayerX = 0
lastSawPlayerY = 0

//for motion planning a*
cellsize = 32
global.enemyGrid = mp_grid_create(0, 0, room_width / cellsize, room_height /cellsize, cellsize, cellsize)
//mp_grid_add_instances(global.enemyGrid,o_player,true)
//mp_grid_add_instances(global.enemyGrid,o_par_enemy,true)
mp_grid_add_instances(global.enemyGrid,o_collision,true)

direEnemy = 0
pathEnemy = path_add();
path_set_kind(global.enemyGrid, 1)
path_set_precision(global.enemyGrid, 8)
x_cur = 0
y_cur = 0
x_next = 0
y_next = 0
//x_goto = path_get_point_x(pathEnemy, PathPointNum);
//y_goto = path_get_point_y(pathEnemy, PathPointNum);
#endregion

//init Function
Function = ds_map_create()
Function[? "damaged"] = enemy_damaged
Function[? "destroyed"] = enemy_destroyed

global.enemyCount += 1