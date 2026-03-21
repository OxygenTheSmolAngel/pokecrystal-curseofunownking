Music_RuinsOfAlphInteriorSlow:
	channel_count 3
	channel 1, Music_RuinsOfAlphInteriorSlow_Ch1
	channel 2, Music_RuinsOfAlphInteriorSlow_Ch2
	channel 3, Music_RuinsOfAlphInteriorSlow_Ch3

Music_RuinsOfAlphInteriorSlow_Ch1:
	tempo 224
	volume 7, 7
	duty_cycle 0
	stereo_panning TRUE, FALSE
	note_type 12, 4, 4
	rest 1
	sound_jump Music_RuinsOfAlphInteriorSlow_branch_ebdc3

Music_RuinsOfAlphInteriorSlow_branch_ebdc3:
	tempo 448
	octave 2
	note A#, 4
	note G#, 4
	note B_, 2
	octave 3
	note C#, 2
	octave 2
	note A#, 2
	note G#, 2
	note A#, 4
	note G#, 4
	octave 3
	sound_jump Music_RuinsOfAlphInteriorSlow_branch_ebdc3

Music_RuinsOfAlphInteriorSlow_Ch2:
	pitch_offset 2
	duty_cycle 0
	stereo_panning FALSE, TRUE
	note_type 12, 10, 4
Music_RuinsOfAlphInteriorSlow_branch_ebdc4:
	octave 2
	note A#, 4
	note G#, 4
	note B_, 2
	octave 3
	note C#, 2
	octave 2
	note A#, 2
	note G#, 2
	note A#, 4
	note G#, 4
	octave 3
	sound_jump Music_RuinsOfAlphInteriorSlow_branch_ebdc4

Music_RuinsOfAlphInteriorSlow_Ch3:
	note_type 12, 1, 0
Music_RuinsOfAlphInteriorSlow_branch_ebdd8:
	octave 1
	note F#, 2
	note B_, 2
	octave 2
	note D_, 2
	octave 3
	rest 10
	sound_jump Music_RuinsOfAlphInteriorSlow_branch_ebdd8
