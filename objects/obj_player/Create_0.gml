event_inherited();

talking = noone;
talking_t = 0;

running = false;
casting_frame = 0;

emitter_bgm = audio_emitter_create();
emitter_se = audio_emitter_create();

if (!audio_is_playing(bgm_idle_with_accordions)) {
    //audio_play_sound(bgm_idle_with_accordions, 100, true);
    audio_play_sound_on(emitter_bgm, bgm_idle_with_accordions, true, 100);
}

show_debug_overlay(true);