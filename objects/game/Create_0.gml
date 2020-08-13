#macro million 1000000
#macro g -2000

surf = surface_create(1024, 1024);

global.enemyCount = 0;

lcList = ds_list_create();
lcList[| 0] = level_control_1;
lcList[| 1] = level_control_2;

enum elements{
	fire,
	water,
	earth,
	metal,
	wood
}

//fire water earth metal wood

global.vocabTable = ds_grid_create(2,5)
global.vocabTable[# 0, 0] = ["f","l","a","m","e"]
global.vocabTable[# 1, 0] = ["f","i","r","e"]
global.vocabTable[# 0, 1] = ["f","r","o","s","t"]
global.vocabTable[# 1, 1] = ["w","a","t","e","r"]
global.vocabTable[# 0, 2] = ["d","u","s","t"]
global.vocabTable[# 1, 2] = ["e","a","r","t","h"]
global.vocabTable[# 0, 3] = ["i","r","o","n"]
global.vocabTable[# 1, 3] = ["m","e","t","a","l"]
global.vocabTable[# 0, 4] = ["g","r","a","s","s"]
global.vocabTable[# 1, 4] = ["w","o","o","d"]
