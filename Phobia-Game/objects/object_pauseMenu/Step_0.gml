/// @description Insert description here
// You can write your code in this editor
buttonStart = gamepad_button_check_pressed(0,gp_start);

if(room != 0 &&max(buttonStart, keyboard_check_pressed(vk_escape), 0)) {
	if(global.pause == 0) {
		global.pause = 1;
	} else {
		global.pause = 0;
	}
}

if(global.pause && gamepad_button_check_pressed(0,gp_select)) {
	global.pause = 0;
	room_goto(0);
}