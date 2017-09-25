/// @description Insert description here
// You can write your code in this editor
buttonB = gamepad_button_check_pressed(0,gp_face2);
if(global.level == 1 && buttonB) {
	with(object_player) {
	if( place_meeting(x, y, object_stairsStart)) {
		x = object_stairsEnd.x;
		y = object_stairsEnd.y;
		}
	}
}	