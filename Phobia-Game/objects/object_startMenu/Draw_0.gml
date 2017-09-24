/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_left);
draw_set_valign(fa_middle)
draw_set_font(font_comicSansMS);
draw_set_color(c_black);

var m;

for(m = 0; m < array_length_1d(menu); m++) {
	draw_text(x+space, y+ (m * space), string(menu[m]));
}
draw_set_font(font_comicSansMSPlus);
draw_set_color(c_yellow);

draw_text(x+space, y+ (mpos * space), string(menu[mpos]));

draw_sprite(sprite_index, 0, x + 16, y + mpos * space);