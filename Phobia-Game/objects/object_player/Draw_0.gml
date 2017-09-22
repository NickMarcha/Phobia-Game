/// @description Insert description here
// You can write your code in this editor
draw_self();

if(immunityFrames != 0) {
	shader_set(shader_red);
	draw_self();
	shader_reset();
}