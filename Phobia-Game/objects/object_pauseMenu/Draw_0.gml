/// @description Insert description here
// You can write your code in this editor
if(global.pause) {
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(camera_get_view_x(view_camera[0]) ,camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]),0);
	draw_set_halign(fa_center);
	draw_set_font(font_comicSansMS);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]))/ 2,camera_get_view_y(view_camera[0]) + (camera_get_view_height(view_camera[0])) /2, "Game Paused");
	draw_set_font(font_comicSansMS_small);
	draw_text(camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0]))/ 2,camera_get_view_y(view_camera[0]) +100+ (camera_get_view_height(view_camera[0])) /2, "Press select for start menu");
	draw_set_color(c_black);
}