object_const_def
    const RUINS_OF_ALPH_UNOWNKING_WORD_ROOM1_POKE_BALL1

RuinsOfAlphUnownKingWordRoom1_MapScripts:
	def_scene_scripts

	def_callbacks
	
RuinsOfAlphUnownKingWordRoom1Tile:
	opentext
	writetext FoundCollectedTileText
	waitbutton
	closetext
	pause 10
	setevent EVENT_TILEPIECE1
	refreshmap
	verbosegiveitem PUZZLETILE_A
	pause 15
	warp RUINS_OF_ALPH_UNOWNKING_CHAMBER, 9, 25
	end

FoundCollectedTileText:
	text "Long ago, there"
	line "were four gods"
	cont "that were known"
	cont "for years."

	para "Three of those"
	line "gods helped form"
	cont "certain concepts."
	
	para "Those concepts"
	line "being Time, Space,"
	cont "and Antimatter."
	
	para "Alongside their"
	line "creator, they"
	cont "were able to"
	cont "form this world"
	cont "we know and love."
	
	para "However, there"
	line "was one god that"
	cont "was forgotten."
	
	para "He who feeds on"
	line "the flesh of any"
	cont "living being."
	
	para "The fabled god of"
	line "power and famine"
	cont "that was lost to"
	cont "time."
	
	para "This god was not"
	line "as well known as"
	cont "the others."
	
	para "He was only a"
	line "rumor amongst"
	cont "the residents"
	cont "of Johto."
	done

RuinsOfAlphUnownKingWordRoom1_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 10, RUINS_OF_ALPH_UNOWNKING_CHAMBER, 5
	warp_event 10, 10, RUINS_OF_ALPH_UNOWNKING_CHAMBER, 6
	
	def_coord_events

	def_bg_events

	def_object_events
    object_event  9, 3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphUnownKingWordRoom1Tile, EVENT_TILEPIECE1