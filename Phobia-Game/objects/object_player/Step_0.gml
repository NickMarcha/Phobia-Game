/// @description Player Handling

key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right)|| keyboard_check(ord("D"));
key_up = keyboard_check_pressed(vk_up)|| keyboard_check_pressed(ord("W"));
key_down = keyboard_check_pressed(vk_down)|| keyboard_check_pressed(ord("S"));


var move = key_right - key_left
//movement

horizontalSpeed = move * walkingSpeed;

verticalSpeed += playerGravity;

//horizontal Collision
if(place_meeting(x+horizontalSpeed, y, object_wall)) {
	while(!place_meeting(x+sign(horizontalSpeed), y, object_wall)) {
	
		x += sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}


x += horizontalSpeed;

//vertical Collision


if(place_meeting(x, y+verticalSpeed, object_wall)) {
	while(!place_meeting(x,y+sign(verticalSpeed), object_wall)) {
	
		y += sign(verticalSpeed);
	}
	verticalSpeed = 0;
}


y += verticalSpeed;
