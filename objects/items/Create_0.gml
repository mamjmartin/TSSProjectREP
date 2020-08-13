enum item{
	smokeShell,
	repair,
	grenade
}


itemsTable = ds_grid_create(5,3)
//name, function, items sprite, items pick up sprite, max numbers

//smoke shell
ds_grid_add(itemsTable,0,0,"smoke shell")
ds_grid_add(itemsTable,1,0,smoke_shell_function)
ds_grid_add(itemsTable,2,0,s_smoke_shell)
ds_grid_add(itemsTable,3,0,s_smoke_shell_pickup)
ds_grid_add(itemsTable,4,0,3)

//repair
ds_grid_add(itemsTable,0,1,"repair")
ds_grid_add(itemsTable,1,1,repair_function)
ds_grid_add(itemsTable,2,1,s_repair)
ds_grid_add(itemsTable,3,1,s_repair_pickup)
ds_grid_add(itemsTable,4,1,3)

//grenade
ds_grid_add(itemsTable,0,2,"grenade")
ds_grid_add(itemsTable,1,2,grenade_function)
ds_grid_add(itemsTable,2,2,s_grenade)
ds_grid_add(itemsTable,3,2,s_grenade_pickup)
ds_grid_add(itemsTable,4,2,3)