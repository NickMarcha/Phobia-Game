/// @description Updates position

//Updates the Destination
if(!instance_exists(follow)) { //checks if object exists
	exit;
}
xTo = follow.x;
yTo = follow.y;

//Updates the camera controllers position

x += (xTo-x) /25; // Math for smoothness
y += (yTo-y) /25;

x = clamp(x,0+view_w_half,room_width-view_w_half);// clamps the viewport to the end of the room
y = clamp(y,0+view_h_half,room_height-view_h_half);

//Updates the viewport position

camera_set_view_pos(camera,x-view_w_half,y-view_h_half);