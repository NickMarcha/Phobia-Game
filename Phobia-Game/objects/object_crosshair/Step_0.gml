/// @description Insert description here
// You can write your code in this editor
if(global.pause) exit;
var controllerh = gamepad_axis_value(0,gp_axisrh);
var controllerv = gamepad_axis_value(0,gp_axisrv);

moveX = 0;
moveY = 0;

	
if( abs(controllerh) > 0.2) {
	moveX += controllerh*multiplier;
}
if( abs(controllerv) > 0.2) {
	moveY += controllerv*multiplier;
}

var temp = 0;
while((abs(posX + moveX) > maxH) || (camera_get_view_x(cam)>object_player.x + posX + moveX)|| (camera_get_view_x(cam)+ camera_get_view_width(cam)<object_player.x + posX + moveX))&& (moveX != 0) {
	temp ++;
	moveX = max(abs(moveX)-1,0)* sign(moveX);
	if(temp > 100) {
		temp = 0;
		return;
	}	
}

while((abs((posY + moveY)) > maxV) || (camera_get_view_y(cam)>object_player.y + posY + moveY)||(camera_get_view_y(cam)+ camera_get_view_height(cam)<object_player.y + posY + moveY)) &&(moveY != 0) {
	temp++;
	moveY = max(abs(moveY)-1,0)* sign(moveY);
	if(temp > 100) {
		temp = 0;
		return;
	}
}

posX += moveX;
posY += moveY;

x = object_player.x + posX;
y = object_player.y + posY;

camera_get_view_x(cam);