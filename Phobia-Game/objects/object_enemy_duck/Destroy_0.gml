/// @description Insert description here
// You can write your code in this editor
array[0] = object_healthPillbox;
array[1] = object_fearPillbox;
array[2] = object_nothing;

instance_create_layer(x,y-2,"Pickups", array[round(random_range(0,2))]);