object_const_def
    const RUINS_OF_ALPH_UNOWNKING_WORD_ROOM2_POKE_BALL1

RuinsOfAlphUnownKingWordRoom2_MapScripts:
	def_scene_scripts

	def_callbacks
	
RuinsOfAlphUnownKingWordRoom2Tile:
	opentext
	writetext FoundCollectedTile2Text
	waitbutton
	closetext
	pause 10
	refreshmap
	verbosegiveitem PUZZLETILE_B
	iffalse .NoRoom2
	setevent EVENT_TILEPIECE2
	pause 15
	warp RUINS_OF_ALPH_UNOWNKING_CHAMBER, 9, 25
	end

.NoRoom2:
	writetext TileNoRoom2
	waitbutton
	closetext
	end

FoundCollectedTile2Text:
	text "This god was"
	line "once feared"
	cont "in the past"
	cont "despite his"
	cont "calm nature."

	para "But whenever he"
	line "gets hungry, he"
	cont "hunts down any"
	cont "living being he"
	cont "comes across."

    para "He then kills and"
    line "devours his prey"
	cont "mercilessly."

	para "He was given this"
	line "trait to keep a"
	cont "balance in the"
	cont "population."
	
	para "But one day..."
	line "He was feeling"
	cont "neglected by the"
	cont "four gods."
	
    para "He feels as if"
	line "they treated him"
	cont "as disposable"
	cont "and worthless."

	para "In a fit of rage,"
	line "he planned to do"
	cont "something to get"
	cont "his revenge."
	
	para "He planned to"
	line "exterminate the"
	cont "human race and"
	cont "leave Johto and"
	cont "Kanto in ruin."

	para "Through this"
	line "rampage would he"
	cont "hope to prove his"
	cont "strenght to his"
	cont "superiors."
	done

TileNoRoom2:
	text "..."
	done


RuinsOfAlphUnownKingWordRoom2_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 10, RUINS_OF_ALPH_UNOWNKING_CHAMBER, 7
	warp_event 10, 10, RUINS_OF_ALPH_UNOWNKING_CHAMBER, 8
	
	def_coord_events

	def_bg_events

	def_object_events
    object_event  9, 3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphUnownKingWordRoom2Tile, EVENT_TILEPIECE2