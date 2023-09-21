for (var i = 0; i < 3; i++) {
    draw_sprite_ext(spr_hearts, 0, 64 + 72 * i, 64, 4, 4, 0, c_white, 1);
}

draw_text(32, 120, "F1 to lower the BGM pitch");
draw_text(32, 140, "F2 to reset the BGM pitch");
draw_text(32, 160, "F3 to raise the BGM pitch");

draw_text(32, 200, "F5 to lower the SE volume");
draw_text(32, 220, "F6 to reset the SE volume");
draw_text(32, 240, "F7 to raise the SE volume");

if (talking) {
    //draw_nineslice(spr_nineslice, 0, 0, window_get_height() - 128, window_get_width(), window_get_height());
    draw_sprite_stretched(spr_nineslice, 0, 0, window_get_height() - 128, window_get_width(), 128);
    
    draw_set_font(fnt_game);
    draw_text_colour(32, window_get_height() - 96, string_copy(talking.text, 1, talking_t), c_black, c_black, c_black, c_black, 1);
    
    if (talking_t < string_length(talking.text)) {
        talking_t++;
    } else {
        if (keyboard_check_pressed(vk_space)) {
            talking = noone;
            talking_t = 0;
        }
    }
}