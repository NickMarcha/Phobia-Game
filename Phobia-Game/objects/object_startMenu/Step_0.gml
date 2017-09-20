/// @description Insert description here
// You can write your code in this editor
var move = 0;
move -= max(gamepad_button_check_pressed(0,gp_padu), keyboard_check_pressed(vk_up), 0);
move += max(gamepad_button_check_pressed(0,gp_padd), keyboard_check_pressed(vk_down), 0);

if(move != 0) {
	mpos += move;
	if(mpos < 0 ) {
		mpos = array_length_1d(menu)-1;
	} else if(mpos >= array_length_1d(menu)) {
		mpos = 0;
	}
}

var push;
push = max(gamepad_button_check_pressed(0,gp_face1), keyboard_check_pressed(vk_enter), keyboard_check_pressed(vk_space),0) {

}

if( push) {
	script_startMenu();
}