	object_const_def
	const CELADONMANSIONROOFHOUSE_SUPER_NERD
	const CELADONMANSIONROOFHOUSE_POKE_BALL1

CeladonMansionRoofHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CeladonMansionRoofHouseOxygenScript:
	faceplayer
	opentext
	showemote EMOTE_SHOCK, CELADONMANSIONROOFHOUSE_SUPER_NERD, 5
	checkevent EVENT_TALKED_TO_OXYGEN
	iftrue .OxygenTalked
	writetext CeladonMansionRoofHouseOxygenIntroText
	waitbutton
	closetext
	pause 20
	opentext
	writetext CeladonMansionRoofHouseOxygenDialogueText
	promptbutton
	disappear CELADONMANSIONROOFHOUSE_POKE_BALL1
	setevent EVENT_GOT_UNOWNKING
	writetext ReceivedUnownKingText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke UNOWNKING, 80
	writetext CeladonMansionRoofHouseOxygenGiftText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_OXYGEN
	end

.OxygenTalked:
	writetext CeladonMansionRoofHouseOxygenAfterText
	waitbutton
	closetext
	end

UnownKingPokeBallScript:
	showemote EMOTE_HEART, CELADONMANSIONROOFHOUSE_POKE_BALL1, 20
	reanchormap
	pokepic UNOWNKING
	cry UNOWNKING
	waitbutton
	closepokepic
	opentext
	writetext UnownKingPokeBallText
	waitbutton
	closetext
	end

CeladonMansionRoofHousePC:
	jumptext CeladonMansionRoofHousePCText

CeladonMansionRoofHouseOxygenIntroText:
	text "Awawa!?"

	para "W-What are you"
	line "doing here!?"

	para "I swear I'm not"
	line "writing a fanfic"
	cont "where I'm kissing"
	cont "the UNOWN KI-"
	done

CeladonMansionRoofHouseOxygenDialogueText:
	text "Uhhhhhhhhh…"

	para "E-Excuse my poor"
	line "manners. I didn't"
	cont "notice you there."

	para "My name is Oxygen!"
	line "I am the developer"
	cont "of the ROM Hack"
	cont "you're playing."

	para "I was just, uhh..."

	para "I was just working"
	line "on some new stuff,"
	cont "that's all."

	para "I hope you've"
	line "enjoyed what I"
	cont "worked on so far."

	para "This was not easy"
	line "to make at all."

	para "But I really hope"
	line "that my hard work"
	cont "was worth it."

	para "Now, I was going"
	line "to go back to what"
	cont "I'm working on."

	para "But you know what?"
	line "I'm feeling quite"
	cont "generous today."

	para "Think of it as a"
	line "bonus reward for"
	cont "straying from the"
	cont "main path."
	
	para "I'll let you keep"
	line "my UNOWN KING as"
	cont "thanks for your"
	cont "help and support."

	para "It means a lot to"
	line "be able to share"
	cont "my passion project"
	cont "to everyone."

	para "Do note that his"
	line "back sprite is"
	cont "outdated."

	para "He wasn't meant to"
	line "be used outside of"
	cont "his battle."

	para "Buuuuut whatever."
	line "I'm sure it's"
	cont "fine."

	para "Anyways, here you"
	line "go!"
	done

CeladonMansionRoofHouseOxygenGiftText:
	text "Unki is such a big"
	line "lovable darling."
	cont "I love him with"
	cont "all my heart."

	para "I was able to tame"
	line "him when I was the"
	cont "one to free him."

	para "Please take good"
	line "care of him. And"
	cont "feed him lots of"
	cont "berries."

	para "But anyways, I'll"
	line "go back to work on"
	cont "my, uhhhh, work."

	para "Bye bye! :3"
	done

CeladonMansionRoofHouseOxygenAfterText:
	text "Oh, uhh, hey!"

	para "Sorry, I'm still"
	line "busy."

	para "…Unless you want"
	line "to commission me"
	cont "some art?"

	para "You know, so I"
	line "can get some"
	cont "quick money."

	para "Oh, you don't?"
	line "That's alright."

	para "Either way, I"
	line "still have to"
	cont "pack my stuff."

	para "I will be"
	line "returning to my"
	cont "world after all."
	done

UnownKingPokeBallText:
	text "It's the UNOWN"
	line "KING inside of"
	cont "a MASTER BALL."

	para "He's staring"
	line "at OXYGEN's"
	cont "notebook."
	done

ReceivedUnownKingText:
	text "<PLAYER> received"
	line "the UNOWN KING!"
	done

CeladonMansionRoofHousePCText:
	text "<PLAYER> checked"
	line "out OXYGEN's PC."

	para "It has a notepad"
	line "open with code"
	cont "written on an asm"
	cont "file."

	para "On another tab,"
	line "this exact room"
	cont "is being shown"
	cont "on a map editor."

	para "And lastly, a"
	line "messaging app is"
	cont "open on the third"
	cont "tab."

	para "It shows a chat"
	line "between OXYGEN"
	cont "and his partner."

	para "<PLAYER> closed the"
	line "tab as to not"
	cont "invade OXYGEN's"
	cont "privacy."
	done


CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CeladonMansionRoofHousePC

	def_object_events
	object_event  3,  5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHouseOxygenScript, -1
	object_event  4,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnownKingPokeBallScript, EVENT_GOT_UNOWNKING
