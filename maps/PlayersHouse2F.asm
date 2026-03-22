	object_const_def
	const PLAYERSHOUSE2F_CONSOLE
	const PLAYERSHOUSE2F_DOLL_1
	const PLAYERSHOUSE2F_DOLL_2
	const PLAYERSHOUSE2F_BIG_DOLL

PlayersHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, PlayersHouse2FInitializeRoomCallback
	callback MAPCALLBACK_TILES, PlayersHouse2FSetUpTileDecorationsCallback

PlayersHouse2FNoopScene: ; unreferenced
	end

PlayersHouse2FInitializeRoomCallback:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd InitializeEventsScript
	endcallback

.SkipInitialization:
	endcallback

PlayersHouse2FSetUpTileDecorationsCallback:
	special ToggleMaptileDecorations
	endcallback

	db 0, 0, 0 ; unused

PlayersHouseDoll1Script::
	describedecoration DECODESC_LEFT_DOLL

PlayersHouseDoll2Script:
	describedecoration DECODESC_RIGHT_DOLL

PlayersHouseBigDollScript:
	describedecoration DECODESC_BIG_DOLL

PlayersHouseGameConsoleScript:
	describedecoration DECODESC_CONSOLE

PlayersHousePosterScript:
	conditional_event EVENT_PLAYERS_ROOM_POSTER, .Script

.Script:
	describedecoration DECODESC_POSTER

PlayersHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayersRadioText1
	pause 45
	writetext PlayersRadioText2
	pause 45
	writetext PlayersRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayersRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end

.NormalRadio:
	jumpstd Radio1Script

.AbbreviatedRadio:
	opentext
	writetext PlayersRadioText4
	pause 45
	closetext
	end

PlayersHouseBookshelfScript:
	jumpstd PictureBookshelfScript

PlayersHousePCScript:
	checkevent EVENT_UNOWNKING_AWAKENING
	iftrue .BrokenPlayerPC
	opentext
	special PlayersHousePC
	iftrue .Warp
	closetext
	end
.Warp:
	warp NONE, 0, 0
	end
.BrokenPlayerPC:
    checkevent EVENT_BROKEN_PC
    iftrue .PCAlreadyBroken
    opentext
    playsound SFX_BOOT_PC 
    writetext PlayersPCTurnOnAltText
    waitbutton
    closetext
	playsound SFX_SHUT_DOWN_PC
    pause 10
    opentext
    writetext HasMonBehindMonitor
    waitbutton
    closetext
    pause 5
	getmonname STRING_BUFFER_3, STARYU
	opentext
	writetext ReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke STARYU, 20
	closetext
	pause 5
	getmonname STRING_BUFFER_3, SANDSHREW
	opentext
	writetext ReceivedMonText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke SANDSHREW, 6
	closetext
	pause 10
	opentext
	writetext NothingElseToDoText
	waitbutton
	closetext
	setevent EVENT_BROKEN_PC
    end

.PCAlreadyBroken:
    opentext
    writetext PCBrokenText
    waitbutton
    closetext
    end

BedtimeScript:
    opentext
    writetext PlayersBedText1
	yesorno 
	iffalse .BedDoNothing
	closetext
    pause 15
    refreshscreen
    refreshmap
    callasm SlowFadeOut
    applymovement PLAYER, HideObjectMovement
    special ResetClockScript
    special SetDayOfWeek
    special FadeOutMusic
    pause 20
    playmusic MUSIC_HEAL
    pause 60
    pause 90
    playsound SFX_CALL
    waitsfx
    pause 10
    playsound SFX_CALL
    waitsfx
    pause 10
    playsound SFX_CALL
    waitsfx
    pause 10
    playsound SFX_CALL
    waitsfx
    pause 10
    playsound SFX_CALL
    waitsfx
    pause 10
    playsound SFX_CALL
    pause 10
    playsound SFX_ENTER_DOOR
    pause 60
    reloadmap
    applymovement PLAYER, ShowObjectMovement
    opentext
    writetext PlayersBedText2
    waitbutton
    closetext
    end

.BedDoNothing
    closetext
    end

ShowObjectMovement:
	show_object
	step_end

HideObjectMovement:
	hide_object
	step_end

SlowFadeOut:
	call RotateFourPalettesLeft
	ret

PlayersRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

PlayersRadioText2:
	text "#MON CHANNEL!"
	done

PlayersRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

PlayersRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

PlayersPCTurnOnAltText:
	text "<PLAYER> tried to"
	line "turn on the PC."

	para "…"

	para "It's broken…"
	line "Huh…"
	done


HasMonBehindMonitor:
    text "There seems to be"
    line "two POKE BALLS"
    cont "hiding behind the"
    cont "monitor."

    para "<PLAYER> took the"
    line "#MON with him."
    done

ReceivedMonText:
	text "<PLAYER> got"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

NothingElseToDoText:
    text "………"

    para "Looks like there"
    line "is nothing else"
    cont "to do here."
    done

PCBrokenText:
    text "The PC is "
    line "unusable."
    done

PlayersBedText1:
	text "This bed looks"
	line "very comfy."

	para "Set up an alarm"
	line "and go to sleep?"
	done

PlayersBedText2:
	text "<PLAYER>'s party"
	line "feels refreshed."
	done


PlayersHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, PLAYERS_HOUSE_1F, 3

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_UP, PlayersHousePCScript
	bg_event  3,  1, BGEVENT_READ, PlayersHouseRadioScript
	bg_event  5,  1, BGEVENT_READ, PlayersHouseBookshelfScript
	bg_event  6,  0, BGEVENT_IFSET, PlayersHousePosterScript
	bg_event  0,  4, BGEVENT_READ, BedtimeScript
	bg_event  0,  4, BGEVENT_READ, BedtimeScript

	def_object_events
	object_event  4,  2, SPRITE_CONSOLE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseGameConsoleScript, EVENT_PLAYERS_HOUSE_2F_CONSOLE
	object_event  4,  4, SPRITE_DOLL_1, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseDoll1Script, EVENT_PLAYERS_HOUSE_2F_DOLL_1
	object_event  5,  4, SPRITE_DOLL_2, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseDoll2Script, EVENT_PLAYERS_HOUSE_2F_DOLL_2
	object_event  0,  1, SPRITE_BIG_DOLL, SPRITEMOVEDATA_BIGDOLL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PlayersHouseBigDollScript, EVENT_PLAYERS_HOUSE_2F_BIG_DOLL
