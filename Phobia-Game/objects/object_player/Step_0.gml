/// @description Player Handling

key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right)|| keyboard_check(ord("D"));
key_up = keyboard_check_pressed(vk_up)|| keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(vk_down)|| keyboard_check_pressed(ord("S"));


var move = key_right - key_left
//movement