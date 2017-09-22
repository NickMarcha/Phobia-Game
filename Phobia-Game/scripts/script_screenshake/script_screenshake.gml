//Screenshake(camera, shake, duration)

view_x = camera_get_view_x(argument0);

shake = argument2;


while(shake > 0) {
	shake--;
}

if(shake ==0) {
	var ran_x = random_range(-argument1, argument1);
	var ran_y = random_range(-argument1, argument1);
	camera_set_view_pos(argument0,object_cameraController.x-object_cameraController.view_w_half+ran_x, object_cameraController.y-object_cameraController.view_h_half+ ran_y);
	view_x = camera_get_view_x(argument0);
	view_y = camera_get_view_y(argument0);
}