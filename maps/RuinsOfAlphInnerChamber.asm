	object_const_def
	const RUINSOFALPHINNERCHAMBER_FISHER
	const RUINSOFALPHINNERCHAMBER_TEACHER
	const RUINSOFALPHINNERCHAMBER_GRAMPS

RuinsOfAlphInnerChamber_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphInnerChamberNoopScene,            SCENE_RUINSOFALPHINNERCHAMBER_NOOP
	scene_script RuinsOfAlphInnerChamberStrangePresenceScene, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphInnerChamberWallCallback

RuinsOfAlphInnerChamberWallCallback:
	checkevent EVENT_CRACK_IN_WALL
	iffalse .ClosedWall
	changeblock  8,  0, $38 ; closed wall
	changeblock  9,  0, $38 ; closed wall
	changeblock 10,  0, $39 ; closed wall
	changeblock 11,  0, $39 ; closed wall
	checkevent EVENT_UNOWNKING_AWAKENING
	iftrue .YesStairs
	changeblock 10, 13, $0D ; no stairs
	endcallback

.ClosedWall
    endcallback

.YesStairs
    endcallback

RuinsOfAlphInnerChamberNoopScene:
	end

RuinsOfAlphInnerChamberStrangePresenceScene:
	sdefer RuinsOfAlphInnerChamberStrangePresenceScript
	end

RuinsOfAlphInnerChamberStrangePresenceScript:
	opentext
	writetext RuinsOfAlphStrangePresenceText
	waitbutton
	closetext
	setscene SCENE_RUINSOFALPHINNERCHAMBER_NOOP
	setevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	end

RuinsOfAlphInnerChamberFisherScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberFisherText

RuinsOfAlphInnerChamberTeacherScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberTeacherText

RuinsOfAlphInnerChamberGrampsScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberGrampsText

RuinsOfAlphInnerChamberStatue:
	jumptext RuinsOfAlphInnerChamberStatueText

RuinsOfAlphInnerChamberLastStatue:
	checkevent EVENT_CRACK_IN_WALL
	iffalse .LastStatueEventCheckStart
	cry UNOWN
	end

.LastStatueEventCheckStart:
	opentext
	writetext RuinsOfAlphInnerChamberStatueText
	waitbutton
	closetext
    readvar VAR_HOUR
    ifequal 3, .LastStatueEventCheck
    end

.LastStatueEventCheck:
    checkpoke HO_OH
    iffalse .LastStatueEventCheckFailed
    checkpoke LUGIA
    iffalse .LastStatueEventCheckFailed
    checkpoke CELEBI
    iffalse .LastStatueEventCheckFailed
    checkpoke SUICUNE
    iffalse .LastStatueEventCheckFailed
    checkpoke MEWTWO
    iffalse .LastStatueEventCheckFailed
    checkpoke MEW
    iffalse .LastStatueEventCheckFailed
    special UnownRadioCheck
    iffalse .LastStatueEventCheckFailed
    special FadeOutMusic
    pause 40
    playmusic MUSIC_RUINS_OF_ALPH_INTERIOR_SLOW
    pause 15
	reanchormap
    pokepic MEW
    cry MEW
    pause 15
    closepokepic
    refreshscreen
    special SacrificeMewScript
    setval MEW
    special PlaySlowCry
    opentext
    writetext SacrificeMew
    waitbutton
    closetext
    pause 25
	reanchormap
    pokepic CELEBI
    cry CELEBI
    pause 15
    closepokepic
    refreshscreen
    special SacrificeCelebiScript
    setval CELEBI
    special PlaySlowCry
    opentext
    writetext SacrificeCelebi
    waitbutton
    closetext
    pause 25
	reanchormap
    pokepic HO_OH
    cry HO_OH
    pause 15
    closepokepic
    refreshscreen
    special SacrificeHoohScript
    setval HO_OH
    special PlaySlowCry
    opentext
    writetext SacrificeHo_oh
    waitbutton
    closetext
    pause 25
	reanchormap
    pokepic LUGIA
    cry LUGIA
    pause 15
    closepokepic
    refreshscreen
    special SacrificeLugiaScript
    setval LUGIA
    special PlaySlowCry
    opentext
    writetext SacrificeLugia
    waitbutton
    closetext
    pause 25
	reanchormap
    pokepic MEWTWO
    cry MEWTWO
    pause 15
    closepokepic
    refreshscreen
    special SacrificeMewtwoScript
    setval MEWTWO
    special PlaySlowCry
    opentext
    writetext SacrificeMewtwo
    waitbutton
    closetext
    pause 25
	reanchormap
    pokepic SUICUNE
    cry SUICUNE
    pause 15
    closepokepic
    refreshscreen
    special SacrificeSuicuneScript
    setval SUICUNE
    special PlaySlowCry
    opentext
    writetext SacrificeSuicune
    waitbutton
    closetext
    special FadeOutMusic
	special FadeOutToBlack
    applymovement PLAYER, HideObjectMovement2
    pause 30
	; Call assembly so the fourth sound will play
	callasm PlayUnownSound3 ; playsound SFX_INTRO_UNOWN_3
	pause 18
	callasm PlayUnownSound2 ; playsound SFX_INTRO_UNOWN_2
	pause 18
	callasm PlayUnownSound1 ; playsound SFX_INTRO_UNOWN_1
	pause 18
	callasm PlayUnownSound2 ; playsound SFX_INTRO_UNOWN_2
	pause 18
	callasm PlayUnownSound3 ; playsound SFX_INTRO_UNOWN_3
	pause 9
	callasm PlayUnownSound2 ; playsound SFX_INTRO_UNOWN_2
	pause 9
	callasm PlayUnownSound1 ; playsound SFX_INTRO_UNOWN_1
	pause 9
	callasm PlayUnownSound2 ; playsound SFX_INTRO_UNOWN_2
	waitsfx
	pause 9
    applymovement PLAYER, ShowObjectMovement2
	special FadeInFromBlack
	pause 60
    playsound SFX_EMBER
    earthquake 45
	changeblock  8,  0, $38 ; closed wall
	changeblock  9,  0, $38 ; closed wall
	changeblock 10,  0, $39 ; closed wall
	changeblock 11,  0, $39 ; closed wall
	changeblock 10, 13, $0D ; no stairs
    setevent EVENT_CRACK_IN_WALL
	refreshmap
    waitsfx
    pause 15
    cry UNOWNKING
    pause 5
    opentext
    writetext SacrificeSuccess
    waitbutton
    closetext
    special FadeOutToBlack
    applymovement PLAYER, HideObjectMovement2
    pause 120
    setval UNOWNKING
    special SetCaughtMon
    special SetSeenMon
    pause 5
    playsound SFX_POTION
    setval UNOWNKING
	reanchormap
    special ShowPokedexEntry
	closetext
    applymovement PLAYER, ShowObjectMovement2
	special RestartMapMusic
    end

.LastStatueEventCheckFailed:
    end

PlayUnownSound1:
	ld de, SFX_INTRO_UNOWN_1
	push de
	call SFXChannelsOff
	pop de
	call PlaySFX
	ret

PlayUnownSound2:
	ld de, SFX_INTRO_UNOWN_2
	push de
	call SFXChannelsOff
	pop de
	call PlaySFX
	ret

PlayUnownSound3:
	ld de, SFX_INTRO_UNOWN_3
	push de
	call SFXChannelsOff
	pop de
	call PlaySFX
	ret

ShowObjectMovement2:
	show_object
	step_end

HideObjectMovement2:
	hide_object
	step_end

RuinsOfAlphStrangePresenceText:
	text "There is a strange"
	line "presence here…"
	done

RuinsOfAlphInnerChamberFisherText:
	text "This is a big"
	line "room, but there's"
	cont "nothing here."
	done

RuinsOfAlphInnerChamberTeacherText:
	text "This place has a"
	line "mystical quality"
	cont "to it."

	para "It feels sort of"
	line "ethereal even."
	done

RuinsOfAlphInnerChamberGrampsText:
	text "Ancient buildings"
	line "are often tombs of"
	cont "kings."

	para "Like the pyramids,"
	line "for instance."
	done

RuinsOfAlphInnerChamberStatueText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

SacrificeMew:
    text "MEW has"
    line "perished."
    done

SacrificeCelebi:
    text "CELEBI has"
    line "perished."
    done

SacrificeHo_oh:
    text "HO-OH has"
    line "perished."
    done

SacrificeLugia:
    text "LUGIA has"
    line "perished."
    done

SacrificeMewtwo:
    text "MEWTWO has"
    line "perished."
    done

SacrificeSuicune:
    text "SUICUNE has"
    line "perished."
    done

SacrificeSuccess:
    text "With the sacrifice"
    line "of your team, the"
    cont "UNOWN KING is now"
    cont "even closer to"
    cont "liberation."
    done

RuinsOfAlphInnerChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 13, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event  3, 15, RUINS_OF_ALPH_HO_OH_CHAMBER, 3
	warp_event  4, 15, RUINS_OF_ALPH_HO_OH_CHAMBER, 4
	warp_event 15,  3, RUINS_OF_ALPH_KABUTO_CHAMBER, 3
	warp_event 16,  3, RUINS_OF_ALPH_KABUTO_CHAMBER, 4
	warp_event  3, 21, RUINS_OF_ALPH_OMANYTE_CHAMBER, 3
	warp_event  4, 21, RUINS_OF_ALPH_OMANYTE_CHAMBER, 4
	warp_event 15, 24, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 3
	warp_event 16, 24, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 4
	warp_event  8,  0, RUINS_OF_ALPH_UNOWNKING_CHAMBER,  1
	warp_event  9,  0, RUINS_OF_ALPH_UNOWNKING_CHAMBER,  2
	warp_event 10,  0, RUINS_OF_ALPH_UNOWNKING_CHAMBER,  3
	warp_event 11,  0, RUINS_OF_ALPH_UNOWNKING_CHAMBER,  4


	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 24, BGEVENT_READ, RuinsOfAlphInnerChamberLastStatue
	bg_event  5, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue

	def_object_events
	object_event  3,  7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberFisherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 14, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberTeacherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 11, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberGrampsScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
