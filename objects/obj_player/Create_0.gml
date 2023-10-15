event_inherited();

talking = noone;
talking_t = 0;

running = false;
casting_frame = 0;

emitter_bgm = audio_emitter_create();
emitter_se = audio_emitter_create();

bus_bgm = audio_bus_create();
audio_emitter_bus(emitter_bgm, bus_bgm);

bus_bgm.effects[0] = audio_effect_create(AudioEffectType.Reverb1, {
    size: 0.75,
    damp: 0.1,
    mix: 0.75
});

if (!audio_is_playing(bgm_idle_with_accordions)) {
    //audio_play_sound(bgm_idle_with_accordions, 100, true);
    audio_play_sound_on(emitter_bgm, bgm_idle_with_accordions, true, 100);
}

show_debug_overlay(true);