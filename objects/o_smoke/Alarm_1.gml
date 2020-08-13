for(var i = 0; i<ds_list_size(smokeCollisionList); i++){
	if(instance_exists(smokeCollisionList[| i])){
		smokeCollisionList[| i].movingSpeed = global.normalEnemyMovingSpeed
		smokeCollisionList[| i].slowMSpeed = global.normalEnemySlowSpeed
	}
}
instance_destroy();