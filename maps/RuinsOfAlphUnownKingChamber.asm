	object_const_def
    const RUINSOFALPHUNOWNKINGCHAMBER_UNOWNKING
    const RUINSOFALPHUNOWNKINGCHAMBER_UNOWN1
    const RUINSOFALPHUNOWNKINGCHAMBER_UNOWN2
    const RUINSOFALPHUNOWNKINGCHAMBER_UNOWN3

RuinsOfAlphUnownKingChamber_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphUnownKingChamberFinalSealCallback
	callback MAPCALLBACK_TILES, RuinsOfAlphUnownKingChamberHole1Callback
	callback MAPCALLBACK_TILES, RuinsOfAlphUnownKingChamberHole2Callback

RuinsOfAlphUnownKingChamberFinalSealCallback:
	checkevent EVENT_SOLVED_UNOWNKING_PUZZLE
	iftrue .SealOpen
	changeblock  9, 16, $3c ; left statue
	changeblock  9, 17, $3c ; left statue2
	changeblock 10, 16, $3d ; right statue
	changeblock 10, 17, $3d ; right statue2
	endcallback
	
.SealOpen:
	endcallback

RuinsOfAlphUnownKingChamberHole1Callback:
	checkevent EVENT_TILEPIECE1
	iftrue .HoleClosed
	changeblock  5, 17, $34 ; left hole
	changeblock  6, 17, $35 ; left hole2
	endcallback
	
.HoleClosed:
	endcallback

RuinsOfAlphUnownKingChamberHole2Callback:
	checkevent EVENT_TILEPIECE2
	iftrue .HoleClosed2
	changeblock  13, 17, $34 ; right hole
	changeblock  14, 17, $35 ; right hole2
	endcallback

.HoleClosed2:
	endcallback

RuinsOfAlphUnownKingChamberPuzzle:
	checkevent EVENT_TILEPIECE1
	iftrue .NextTileCheck
	opentext
	writetext RuinsOfAlphUnownKingChamberMissingTilesText
	waitbutton
	closetext
	changeblock  5, 17, $34 ; left hole
	changeblock  6, 17, $35 ; left hole2
	refreshmap
	pause 5
	end
	
.NextTileCheck
	checkevent EVENT_TILEPIECE2
	iftrue .TileCheckComplete
	opentext
	writetext RuinsOfAlphUnownKingChamberMissingTilesText
	waitbutton
	closetext
	changeblock  13, 17, $34 ; right hole
	changeblock  14, 17, $35 ; right hole2
	refreshmap
	end
	
.TileCheckComplete
	checkevent EVENT_PUZZLEREADY
	iftrue .PuzzleReady
	opentext
	writetext RuinsOfAlphUnownKingChamberMissingTilesAltText
	waitbutton
	closetext
	setevent EVENT_PUZZLEREADY
	end

.PuzzleReady
	checkevent EVENT_SOLVED_UNOWNKING_PUZZLE
	iftrue .PuzzleAlreadyComplete
	reanchormap
	setval UNOWNPUZZLE_UNOWNS
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	pause 30
	playsound SFX_ENTER_DOOR
	earthquake 5
	changeblock  9, 16, $3e ; left statue
	changeblock  9, 17, $3e ; left statue2
	changeblock 10, 16, $3f ; right statue
	changeblock 10, 17, $3f ; right statue2
    setevent EVENT_SOLVED_UNOWNKING_PUZZLE
	refreshmap
	waitsfx
    opentext
    writetext BrokenSealText
    waitbutton
    closetext
    end

.PuzzleAlreadyComplete
    opentext
    writetext AlreadyBrokenSealText
    waitbutton
    closetext
    end

RuinsOfAlphUnownKingScript:
	special FadeOutMusic
	pause 30
	opentext
	writetext UnkiCry
	cry UNOWNKING
	waitbutton
	closetext
	special FadeOutToBlack 
	pause 5
	disappear RUINSOFALPHUNOWNKINGCHAMBER_UNOWNKING
	disappear RUINSOFALPHUNOWNKINGCHAMBER_UNOWN1
    disappear RUINSOFALPHUNOWNKINGCHAMBER_UNOWN2
    disappear RUINSOFALPHUNOWNKINGCHAMBER_UNOWN3
	playsound SFX_RUN
    pause 30
	special FadeInFromBlack
	opentext
	writetext UnkiFlee
	waitbutton
	closetext
    setevent EVENT_UNOWNKING_AWAKENING
    setevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
    setevent EVENT_GUIDE_GENT_IN_HIS_HOUSE
    setevent EVENT_ELMS_AIDE_IN_LAB
    setevent EVENT_VIOLET_CITY_EARL
    setevent EVENT_ROUTE_30_YOUNGSTER_JOEY
    setevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
    setevent EVENT_ROUTE_32_REPEL
    setevent EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
    setevent EVENT_ROUTE_32_GREAT_BALL
    setevent EVENT_SLOWPOKE_WELL_ROCKETS
    setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
    setevent EVENT_PLAYERS_HOUSE_MOM_2
    setevent EVENT_OPENED_MT_SILVER
    setevent EVENT_FOUGHT_SNORLAX
    clearevent EVENT_UNOWNKING_ROADBLOCKS
    setflag ENGINE_UNOWNKING_TRIGGER
	special RestartMapMusic
	specialphonecall SPECIALCALL_EMERGENCY
	reanchormap
	opentext
	special TryQuickSave
	closetext
	pause 10
    wildoff
	end

WanderingUnownScript:
	cry UNOWN
	end

RuinsOfAlphUnownKingChamberAncientReplica:
	jumptext RuinsOfAlphUnownKingChamberAncientReplicaText

RuinsOfAlphUnownKingChamberDescriptionSign:
	jumptext RuinsOfAlphUnownKingChamberDescriptionText


UnkiCry:
    text "Kiiiiing!!"
    done

UnkiFlee:
    text "The UNOWN KING"
    line "left the chamber"

    para "You have freed"
    line "the BEAST."
    done

RuinsOfAlphUnownKingChamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."

	para "It looks quite"
	line "intimidating…"
	done

RuinsOfAlphUnownKingChamberDescriptionText:
	text "WARNING!!!"

	para "This puzzle acts"
	line "as the final seal"
	cont "to this chamber."

	para "Please do not"
	line "break the seal!"
	done

RuinsOfAlphUnownKingChamberMissingTilesText:
	text "It's a tile puzzle."

	para "There seems to be"
	line "two missing tiles…"
	done

RuinsOfAlphUnownKingChamberMissingTilesAltText:
	text "It's a tile puzzle."

	para "There seems to be"
	line "two missing tiles…"
	
	para "SUSEJ places the"
	line "tiles on the"
	cont "puzzle."
	
	para "Now the puzzle"
	line "can be solved."
	done

BrokenSealText:
	text "The seal has been"
	line "broken."

	para "Suddenly, ancient"
	line "text appeared on"
	cont "the panel."

	para "You tried to read"
	line "it..."
	done

AlreadyBrokenSealText:
	text "The seal was"
	line "broken…"
	done

RuinsOfAlphUnownKingChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 39, RUINS_OF_ALPH_INNER_CHAMBER, 10
	warp_event  9, 39, RUINS_OF_ALPH_INNER_CHAMBER, 11
	warp_event 10, 39, RUINS_OF_ALPH_INNER_CHAMBER, 12
	warp_event 11, 39, RUINS_OF_ALPH_INNER_CHAMBER, 13
	warp_event  5, 17, RUINS_OF_ALPH_UNOWNKING_WORD_ROOM1, 1
	warp_event  6, 17, RUINS_OF_ALPH_UNOWNKING_WORD_ROOM1, 2
	warp_event 13, 17, RUINS_OF_ALPH_UNOWNKING_WORD_ROOM2, 1
	warp_event 14, 17, RUINS_OF_ALPH_UNOWNKING_WORD_ROOM2, 2


	def_coord_events

	def_bg_events
	bg_event  8, 35, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event 11, 35, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event  6, 27, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event 13, 27, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event  8, 21, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event 11, 21, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event  9, 17, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event 10, 17, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event  6, 13, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event 13, 13, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event  4,  9, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event 15,  9, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event 13,  5, BGEVENT_READ, RuinsOfAlphUnownKingChamberAncientReplica
	bg_event  9, 20, BGEVENT_UP, RuinsOfAlphUnownKingChamberPuzzle
	bg_event 10, 20, BGEVENT_UP, RuinsOfAlphUnownKingChamberDescriptionSign

	def_object_events
    object_event  9,  9, SPRITE_UNKI, SPRITEMOVEDATA_UNKI_BLINK, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphUnownKingScript, EVENT_UNOWNKING_AWAKENING
	object_event  4,  5, SPRITE_UNOWN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WanderingUnownScript, EVENT_UNOWNKING_AWAKENING
	object_event 13,  2, SPRITE_UNOWN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WanderingUnownScript, EVENT_UNOWNKING_AWAKENING
	object_event 11, 14, SPRITE_UNOWN, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, WanderingUnownScript, EVENT_UNOWNKING_AWAKENING
