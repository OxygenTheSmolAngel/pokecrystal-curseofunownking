	object_const_def
	const SOULHOUSE_MRFUJI
	const SOULHOUSE_MRFUJI2
	const SOULHOUSE_TEACHER
	const SOULHOUSE_LASS
	const SOULHOUSE_GRANNY

SoulHouse_MapScripts:
	def_scene_scripts

	def_callbacks

MrFuji:
	checkevent EVENT_UNOWNKING_AWAKENING
	iftrue .MrFujiBusy
	opentext
	writetext MrFujiText
	waitbutton
	closetext
	end

.MrFujiBusy:
	checkevent EVENT_UNKI_TALKED_TO_FUJI
	iftrue .MrFujiStillBusy
	faceplayer
	showemote EMOTE_SHOCK, SOULHOUSE_MRFUJI2, 10
	opentext
	writetext MrFujiBusyText
	waitbutton
	closetext
	pause 20
    applymovement SOULHOUSE_MRFUJI2, Movement_MrFujiTurnUp
	turnobject SOULHOUSE_MRFUJI2, UP
	opentext
	writetext MrFujiBusyText2
	waitbutton
	closetext
	pause 10
	faceplayer
	opentext
	writetext MrFujiBusyLeaveAloneText
	waitbutton
	closetext
	setevent EVENT_UNKI_TALKED_TO_FUJI
    applymovement SOULHOUSE_MRFUJI2, Movement_MrFujiTurnUp
	turnobject SOULHOUSE_MRFUJI2, UP
	end

.MrFujiStillBusy:
	opentext
	writetext MrFujiStillBusyText
	waitbutton
	closetext
	end

SoulHouseTeacherScript:
	jumptextfaceplayer SoulHouseTeacherText

SoulHouseLassScript:
	jumptextfaceplayer SoulHouseLassText

SoulHouseGrannyScript:
	jumptextfaceplayer SoulHouseGrannyText

Movement_MrFujiTurnUp:
	turn_head UP
	step_end

MrFujiText:
	text "MR.FUJI: Welcome."

	para "Hmm… You appear to"
	line "be raising your"

	para "#MON in a kind"
	line "and loving manner."

	para "#MON lovers"
	line "come here to pay"

	para "their respects to"
	line "departed #MON."

	para "Please offer con-"
	line "dolences for the"

	para "souls of the de-"
	line "parted #MON."

	para "I'm sure that will"
	line "make them happy."
	done

MrFujiBusyText:
	text "MR.FUJI: Ah!"
	line "Welcome, trainer."

	para "Why did you come"
	line "here? It's not"
	cont "safe, you know."

	para "Especially with"
	line "the BEAST roaming"
	cont "around."

	para "Huh? Why am I"
	line "here, then?"

	para "Well<……>"
	done

MrFujiBusyText2:
	text "…I've been very"
	line "busy lately."

	para "This place…"
	line "I've grown quite"
	cont "attached to it."

	para "It always makes me"
	line "happy to see so"
	cont "many people visit."

	para "They would pay"
	line "their respects for"
	cont "the #MON that"
	cont "passed away."

	para "It was very heart-"
	line "warming to see."

	para "I just hope these"
	line "cherished souls"
	cont "can still continue"
	cont "to rest in peace…"

	done

MrFujiBusyLeaveAloneText:
	text "But anyways,"
	line "that's enough"
	cont "talking."

	para "I must go back to"
	line "what I was doing."

	para "Good luck out"
	line "there…"
	done

MrFujiStillBusyText:
    text "<……>"
    done

SoulHouseTeacherText:
	text "There are other"
	line "graves of #MON"
	cont "here, I think."

	para "There are many"
	line "chambers that only"
	cont "MR.FUJI may enter."
	done

SoulHouseLassText:
	text "I came with my mom"
	line "to visit #MON"
	cont "graves…"
	done

SoulHouseGrannyText:
	text "The #MON that"
	line "lived with me…"

	para "I loved them like"
	line "my grandchildren…"
	done

SoulHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, LAVENDER_TOWN, 6
	warp_event  5,  7, LAVENDER_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, EVENT_UNOWNKING_AWAKENING
	object_event  4,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MrFuji, EVENT_UNOWNKING_ROADBLOCKS
	object_event  7,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseTeacherScript, EVENT_UNOWNKING_AWAKENING
	object_event  2,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseLassScript, EVENT_UNOWNKING_AWAKENING
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SoulHouseGrannyScript, EVENT_UNOWNKING_AWAKENING
