/// @description Insert description here
// You can write your code in this editor
timer ++;
x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);

if(timer > timerCount) {
	room_speed = room_speed *10;

	room_goto(global.room_endScreen);
}
