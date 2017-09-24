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
gun = 2;
lastWeapon = 2;

weapon = melee_umbrella;

weaponDamage[melee_umbrella] = 10;
weaponDamage[gun] = 5;

attackCooldown = 30;
attackTimer = 0;

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
timer = 0;
fearCap = 100;
hit = 0;
immunityFrames = 0;
immunityTime = 60;


//input
triggerRight = false;

// gun

fireingDelay = 0;
recoil = 0;
controllerAngle = 0;


