/// @description Insert description here
// You can write your code in this editor
if(global.pause) exit;
if(immunityFrames > 0) {
	move =0;
}
// damage taken
if( Health < 0) {
	instance_destroy(self);
}

if( immunityFrames > 0) {
	immunityFrames = max(immunityFrames-1, 0);
}


// AI
distanceToPlayer = point_distance(x,y,object_player.x,object_player.y);

if((immunityFrames > 0||distanceToPlayer < traceRange) && state == idle && attackTimer ==0) {
	state = tracing;
	
}
if(attackTimer > 0) {
	attackTimer --;
}

if(distanceToPlayer < attackRange && state == tracing&& attackTimer ==0 && immunityFrames == 0) {
	attackTimer = attackCooldown;
	state = attack;
	verticalSpeed = -3;
	directionAttack = 0.7* sign(horizontalSpeed);
}

if(state == tracing && immunityFrames > 0) {
	move = sign(object_player.x -x);
}

if(state == attack&& immunityFrames > 0) {

	move = directionAttack;
	with(object_player) {
	
		if(place_meeting(x,y,other)&& immunityFrames == 0) {
			show_debug_message("hasHit");
			hit = 1;
			Health -= other.attackDamage;
			other.state = idle;
			Fear += other.fearDamage;

		}
	}
	if(place_meeting(x, y+verticalSpeed, object_wall)) {
		state = idle;
	}
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
}


y += verticalSpeed;
if(hit) {
	hit = 0;
	immunityFrames =20;
	Health -= object_player.weaponDamage[object_player.weapon];
}



//animation

if(horizontalSpeed != 0) {
	sprite_index = sprite_enemy_spiderWalking;
	if(abs(horizontalSpeed) > 0.1) {
		image_xscale = sign(-move);
	}
} else {
	sprite_index = sprite_enemy_spider;
}