/// @description Insert description here
// You can write your code in this editor
x = object_player.x -sign(object_player.image_xscale) * 6;
y = object_player.y +4;

image_angle = point_direction(x,y,object_crosshair.x,object_crosshair.y);
	

if( image_angle > 90 && image_angle < 270) {
	image_yscale = abs(image_yscale) * -1;
	
} else {
	image_yscale = abs(image_yscale);
}
