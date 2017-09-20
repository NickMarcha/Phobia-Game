/// @description Basic Values
//Movement
horizontalSpeed = 0;
verticalSpeed = 0;
playerGravity = 0.3;
walkingSpeed = 2;
jumpStamina = 0;

//weapons
melee_fist = 0;
melee_umbrella = 1;
gun = 3;


weapon = gun;

weapons[1] = object_weaponUmbrella;

//states

idle = 0
walking = 1;
running = 2;
jumping = 3;
attack = 4;

state = 0;

//
Health = 100;
Fear = 0;
fearCap = 100;


//input
triggerRight = false;