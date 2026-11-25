Music_Man:
	channel_count 4
	channel 1, Music_Man_Ch1
	channel 2, Music_Man_Ch2
	channel 3, Music_Man_Ch3
	channel 4, Music_Man_Ch4

Music_Man_Ch1:
	volume 7, 7
	duty_cycle 2
	note_type 12, 6, 7
	octave 3
	vibrato 0, 0, 0
	tempo 160
.mainloop:
	duty_cycle 0
	octave 3
	note C_, 4
	note G_, 8
	note C_, 4
	note G_, 8
	note C_, 4
	note G_, 8
	note C_, 4
	note G_, 8
	octave 2
	note A#, 4
	octave 3
	note F_, 8
	octave 2
	note A#, 4
	octave 3
	note F_, 8
	octave 2
	note A#, 4
	octave 3
	note F_, 8
	octave 2
	note A#, 4
	octave 3
	note F_, 8
	sound_loop 0, .mainloop

Music_Man_Ch2:
	duty_cycle 1
	note_type 12, 10, 7
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	sound_ret

Music_Man_Ch3:
	note_type 12, 2, 0
.mainloop:
	vibrato 22, 2, 3
	rest 4
	octave 5
	volume_envelope 1, 0
	note E_, 4
	note D#, 4
	note B_, 4
	note F#, 4
	note A_, 4
	note G_, 8
	note F#, 4
	note G_, 12
	rest 4
	note D_, 4
	note C#, 4
	note A_, 4
	note E_, 4
	note G_, 4
	note F_, 8
	note E_, 4
	note F_, 12
	sound_loop 0, .mainloop

Music_Man_Ch4:
	toggle_noise 1
	drum_speed 12
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	sound_ret
