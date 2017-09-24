/// @description Insert description here
// You can write your code in this editor
buttonStart = gamepad_button_check_pressed(0,gp_start);
buttonA = gamepad_button_check_pressed(0,gp_face1);

if(max(buttonStart, keyboard_check_pressed(vk_escape), 0 , buttonA, keyboard_check_pressed(vk_enter))) {
	room_goto(global.room_startMenu);
}