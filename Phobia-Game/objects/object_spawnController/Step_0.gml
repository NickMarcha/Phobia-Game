/// @description Insert description here
// You can write your code in this editor
spawnTimer++;
if( spawnTimer % spawnRate == 0) {
	instance_create_layer(x,y,"Enemies",array[round(random_range(0,2))]);
}