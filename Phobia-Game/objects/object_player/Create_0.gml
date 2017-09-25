/// @description Basic Values

//debug
godMode = 0;
maxHealth = 500;
//Movement
horizontalSpeed = 0;
verticalSpeed = 0;
playerGravity = 0.3;
walkingSpeed = 2;
jumpStamina = 0;

//weapons
//melee_fist = 0;
melee_umbrella = 0;
gun = 1;
shotgun = 2;
lastWeapon = 0;

hasShotgun = 0;
hasgun = 0;

weapon = melee_umbrella;

weaponDamage[melee_umbrella] = 10;
weaponDamage[gun] =20;
weaponDamage[shotgun] =30;
attackCooldown = 30;
attackTimer = 0;

//states

idle = 0
walking = 1;
running = 2;
jumping = 3;
attack = 4;
reload = 5;

state = 0;

//
Health = maxHealth;
Fear = 0;
timer = 0;
fearCap = 100;
hit = 0;
immunityFrames = 0;
immunityTime = 60;


//input
triggerRight = false;

// guns

fireingDelay = 0;
recoil = 0;
controllerAngle = 0;
//revolver

gunAmmo = 8;
gunAmmoMax = 8;
//shotgun

shotgunAmmo = 4;
shotgunAmmoMax = 4;

died = 0;

global.gameScore = 0;
global.level = 0;