/// @description Player Handling
if(global.pause) exit;
if(state != jumping) {
	move = 0;
}
leftJoyInput = gamepad_axis_value(0,gp_axislh);


//input
if(abs(leftJoyInput)> 0.2) &&((state == idle|| state == running||state == walking)|| weapon == gun) {
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
buttonShoulderLeft = gamepad_button_check_pressed(0,gp_shoulderl);
buttonShoulderRight = gamepad_button_check_pressed(0,gp_shoulderr);

//weapon switching
if( buttonShoulderLeft) {
	weapon --;
	state = idle;
} else if ( buttonShoulderRight) {
	weapon ++;
	state = idle;
}
if(weapon < 0) {
	weapon = lastWeapon;
} else if(weapon >lastWeapon){
	weapon = 0;
}


//attack button check
if(gamepad_button_check_pressed(0,gp_shoulderrb)) {
	triggerRight = true;
} else if(gamepad_button_check_released(0,gp_shoulderrb)) {
	triggerRight = false;
}
//checks if able to attack
if(triggerRight &&(state == idle|| state == running||state == walking|| state == attack) && attackTimer ==0) {
	state = attack;
	if(weapon == melee_umbrella) {
		attackTimer = attackCooldown;
	}
} 

//handles attacking based on weapon
if(state == attack) {
	switch(weapon) {
		case gun:
		//fire bullet
			with(object_gun) {
				fireingDelay --;
				recoil = max (0, recoil -1);

				if( object_player.weapon == object_player.gun &&object_player.triggerRight  && fireingDelay < 0) {
					fireingDelay = 6;
					recoil = 4;
	
					with(instance_create_layer(x,y,"Bullets",object_bullet)) {
						speed = 25;
						direction = other.image_angle + random_range(-3,3);
						image_angle = direction;
		
					}
	
					with(object_player) {
						//hspI = (hsp - lengthdir_x(other.recoil,other.image_angle));
						//verticalSpeed = (verticalSpeed - lengthdir_y(other.recoil,other.image_angle))*0.5;
					}
				}

				x = x - lengthdir_x(recoil,image_angle);
				y = y - lengthdir_y(recoil,image_angle);

			}
			
		break;
		
		case melee_umbrella:
			if(image_index > 4 && image_index < 8) {
			
				with (instance_create_layer(x,y,"Player",object_hitbox_meleeUmbrella)) {
					image_xscale = other.image_xscale;
					with (instance_place(x,y,parent_enemy)) {
						if(hit == 0 && immunityFrames == 0) {
							hit = 1;
							verticalSpeed = -4;
							move = sign(x -other.x) * 2;
							attackTimer = attackCooldown;
							image_xscale = sign(horizontalSpeed);
						}
					}
				}
			}else if (image_index > 8) {
				state = idle;
			}	
			move = 0.5 * sign(image_xscale);
					
		break;
		
		case melee_fist:
			state = idle;
		break;
		
		default:
			state = idle;
	}
}

//controls jumping
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

// taking damage

if( hit) {
	immunityFrames = immunityTime;
	hit = 0;
	script_screenshake(view_camera[0],6,120);

}

if( immunityFrames != 0) {
	immunityFrames = max(immunityFrames-1, 0);
	
} 
//checks if dead
timer ++;
if(attackTimer > 0) {
	attackTimer--;
}
if(Health < 1 && Fear > fearCap) {
	room_restart();
}
if(timer % 120 == 0 && Fear > 0) {
	Fear--;
}

//animations
switch (state) {
	case attack:
		if(weapon == melee_umbrella) {
			sprite_index = sprite_playerMeleeAttack;
			
		} else if(horizontalSpeed !=0) {
			sprite_index = sprite_playerWalking;
		} else {
			sprite_index = sprite_playerIdle;
		}
		break;
		
	/*Forsøkte å legge til jumping animation, så tuklet litt med case'ene under.
	  Fungerte svært dårlig, men ødelagte ikke koden. Se om du får det til å fungere.
	  Har lagt til shitty-McDippy half-assed jumping animation.
	*/
	
	case running:
	case jumping:
		sprite_index = sprite_playerJumping;
	case walking:
		if(weapon = melee_fist) {
		sprite_index = sprite_playerWalking;
		} else if( weapon = melee_umbrella) {
			sprite_index = sprite_playerWalkingWMelee;
		} else if( weapon = melee_umbrella && verticalSpeed != 0) {
			sprite_index = sprite_playerJumping;
		} else {
			sprite_index = sprite_playerWalking;
		}
		break;
	case idle:
	default:
		sprite_index = sprite_playerIdle;
		break;
}
