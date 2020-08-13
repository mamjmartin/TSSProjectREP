global.particles = self

partSys = part_system_create()

partTypeEnemyDestroy = part_type_create()
part_type_sprite(partTypeEnemyDestroy,s_enemy_debirs1,false,false,false)
part_type_life(partTypeEnemyDestroy,60,80)
part_type_alpha3(partTypeEnemyDestroy,0.8,0.8,0)
part_type_direction(partTypeEnemyDestroy,0,369,0,false)
part_type_orientation(partTypeEnemyDestroy,0,359,1,false,false)
part_type_speed(partTypeEnemyDestroy,2,2.4,-0.02,0)