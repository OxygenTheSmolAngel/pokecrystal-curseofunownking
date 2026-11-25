	object_const_def
	; const MAPNAME_OBJECTNAME

EggRoom_MapScripts:
	def_scene_scripts
	; scene_script script, SCENE_MAPNAME_SCENE_NAME

	def_callbacks
	; callback type, script

EggRoomTreeScript:
	checkevent EVENT_GOT_EGG_FROM_MAN
	iftrue .AlreadyGotEgg
	opentext
	writetext EggManText
	yesorno
	writetext EggMan2Text
	waitbutton
	verbosegiveitem EGG_ITEM
	iffalse .NoRoomForEgg
	setevent EVENT_GOT_EGG_FROM_MAN
	closetext
	end

.AlreadyGotEgg
	opentext
	writetext EggManGoneText
	waitbutton
	closetext
	end

.NoRoomForEgg
	opentext
	writetext EggManNoRoomText
	waitbutton
	closetext
	end

EggRoomTreeAltScript:
	opentext
	writetext EggManBehindText
	waitbutton
	closetext
	end

EggManText:
text "Well, there is a"
line "man here."

para "He seems confused"
line "as to how he got"
cont "here."

para "But he doesn't"
line "seem to mind the"
cont "circumstances."

para "...He notices"
line "your uneasyness."

para "He ask if you are"
line "ready for whatever"
cont "happens to you"
cont "later on."
done

EggMan2Text:
text "Whether you are"
line "ready or not..."

para "The man still"
line "believes you can"
cont "perservere."

para "He offers you"
line "something for"
cont "good luck."
done

EggManGoneText:
	text "Well, there is not"
	line "a man here."
	done

EggManNoRoomText:
	text "Well, you don't"
	line "have any space"
	cont "in your BAG."

	para "He waits for you"
	line "to make space."
	done

EggManBehindText:
	text "He is behind the"
	line "tree."
	done

EggRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  14, 25, PLAYERS_HOUSE_2F, 1
    warp_event  15, 25, PLAYERS_HOUSE_2F, 1

	def_coord_events
	; coord_event x, y, scene_id, script

	def_bg_events
	bg_event 14, 10, BGEVENT_READ, EggRoomTreeScript
	bg_event 15, 10, BGEVENT_READ, EggRoomTreeScript
	bg_event 14, 11, BGEVENT_READ, EggRoomTreeAltScript
	bg_event 15, 11, BGEVENT_READ, EggRoomTreeAltScript

	def_object_events
	; object_event x, y, sprite, movement, rx, ry, h1, h2, palette, type, range, script, event_flag