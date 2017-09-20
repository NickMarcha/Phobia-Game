/// @description Player Handling
if(global.pause) exit;
if(state != jumping) {
	move = 0;
}
leftJoyInput = gamepad_axis_value(0,gp_axislh);


//input
if(abs(leftJoyInput)> 0.2) &&(state == idle|| state == running||state == walking) {
	move = leftJoyInput;
	state = walking;
	image_speed = 1;
	if(abs(leftJoyInput)> 0.7) {
		move = move * 1.5;
		state = running;
		image_speed = 1.5;
	}
	image_xscale = sign(move);
	if(sign(object_crosshair.x-x) != sign(move) && weapon == gun) {
		move= move *0.5;
	}
	
}else if( state == walking)||(state == running){
	state = idle;
}

buttonA = gamepad_button_check_pressed(0,gp_face1);
buttonB = gamepad_button_check(0,gp_face2);
buttonX = gamepad_button_check(0,gp_face3);
buttonY = gamepad_button_check(0,gp_face4);


if(gamepad_button_check_pressed(0,gp_shoulderrb)) {
	triggerRight = true;
} else if(gamepad_button_check_released(0,gp_shoulderrb)) {
	triggerRight = false;
}

if(jumpStamina > 0) {
	jumpStamina = max(jumpStamina -1,0)
}

if(jumpStamina == 0 &&buttonA &&(state == walking || state == idle || state == running) )  {
	state = jumping;
	verticalSpeed = -3;
	horizontalSpeed = 1.2* sign(horizontalSpeed);
	jumpStamina = 30;
}

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
	if(state == jumping) {
		state = idle;
	}
}


y += verticalSpeed;

if(weapon == gun) {
	image_xscale = sign(object_crosshair.x-x);
}
//animations
switch (state) {
	case running:
	case walking:
		sprite_index = sprite_playerWalking;
	break;
	case idle:
	default:
		sprite_index = sprite_playerIdle;
}
