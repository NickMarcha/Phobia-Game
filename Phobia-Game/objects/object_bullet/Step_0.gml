/// @description Insert description here
// You can write your code in this editor

if(global.pause) exit;

if(place_meeting(x,y,object_wall)) {
	instance_destroy(self);
}
if(place_meeting(x,y,parent_enemy)) {
	with (instance_place(x,y,parent_enemy)) {
		if(hit == 0 && immunityFrames == 0) {
							hit = 1;
							verticalSpeed = -3;
							horizontalSpeed = sign(x -other.x) * 4;
							attackTimer = attackCooldown;
							image_xscale = sign(horizontalSpeed);
		}
	}

	instance_destroy(self);
}