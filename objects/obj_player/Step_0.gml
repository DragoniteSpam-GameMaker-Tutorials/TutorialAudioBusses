var dx = 0, dy = 0;

running = false;

if (casting_frame == 0) {
    if (!talking) {
        if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
            dx = -1;
        }
        if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
            dx = 1;
        }
        if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
            dy = -1;
        }
        if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
            dy = 1;
        }
        if (keyboard_check(ord("C"))) {
            casting_frame = sprite_get_number(spr_duckling_cast) / 4;
        }
    }
    
    if (dx != 0 || dy != 0) {
        var mag = point_distance(0, 0, dx, dy);
        if (keyboard_check(vk_shift)) {
            running = true;
            mag /= 1.5;
        }
        dx /= mag;
        dy /= mag;
        anim_frame = (anim_frame + 0.125) % 4;
        anim_dir = point_direction(0, 0, dx, dy) / 90;
    } else {
        anim_frame = 0;
    }
    
    x += dx * 2;
    y += dy * 2;
    
    if (keyboard_check_pressed(vk_space) && !talking) {
        var facing = collision_point(x + 24 * dcos(anim_dir * 90), y - 24 * dsin(anim_dir * 90), par_thingy, false, true);
        if (facing) {
            talking = facing;
            talking_t = 0;
        }
        //audio_play_sound(se_coin, 110, false);
        audio_play_sound_on(emitter_se, se_coin, false, 110);
    }
    
    if (dx != 0 || dy != 0) {
        if (!audio_is_playing(se_footstep)) {
            //audio_play_sound(se_footstep, 100, false);
            audio_play_sound_on(emitter_se, se_footstep, false, 100);
        }
    }
} else {
    casting_frame = max(0, casting_frame - 0.25);
}

if (keyboard_check(vk_f1)) {
    audio_emitter_pitch(emitter_bgm, 0.8);
}
if (keyboard_check(vk_f2)) {
    audio_emitter_pitch(emitter_bgm, 1);
}
if (keyboard_check(vk_f3)) {
    audio_emitter_pitch(emitter_bgm, 1.2);
}

if (keyboard_check(vk_f5)) {
    audio_emitter_gain(emitter_se, 0.2);
}
if (keyboard_check(vk_f6)) {
    audio_emitter_gain(emitter_se, 1);
}
if (keyboard_check(vk_f7)) {
    audio_emitter_gain(emitter_se, 1.5);
}