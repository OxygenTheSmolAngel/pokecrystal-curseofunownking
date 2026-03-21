Script_BattleWhiteout::
	callasm BattleBGMap
	sjump Script_Whiteout

OverworldWhiteoutScript::
	reanchormap
	callasm OverworldBGMap

Script_Whiteout:
	checkflag ENGINE_UNOWNKING_TRIGGER
	iffalse .NormalBattle
	writetext .GameOverText
	waitbutton
	special FadeOutMusic
	callasm SlowFadeOut
	pause 10
	callasm HideSpritesScript
	callasm LoadTrainerPicScript
	pause 20
	special FadeInFromWhite
	pause 35
	writetext .FinalSpeechText
	pause 30
	callasm FadeOutWhite
	pause 120
	callasm DeleteSave
	special Reset
	endall

.NormalBattle:
	writetext .WhitedOutText
	waitbutton
	special FadeOutToWhite
	pause 40
	special HealParty
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .bug_contest
	callasm HalveMoney
	callasm GetWhiteoutSpawn
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	newloadmap MAPSETUP_WARP
	endall

.bug_contest
	jumpstd BugContestResultsWarpScript

.WhitedOutText:
	text_far _WhitedOutText
	text_end

.GameOverText:
	text_far _WhitedOutUnkiText
	text_end

.FinalSpeechText:
	text_far _FinalSpeechText
	text_end

HideSpritesScript:
	hlcoord 0, 0
	lb bc, 8, 21
	call ClearBox
	call ClearTilemap
	ret

LoadTrainerPicScript:
	xor a
	ld [wCurPartySpecies], a
	ld a, POKEMON_PROF
	ld [wTrainerClass], a
	ld de, vTiles2
	callfar GetTrainerPic
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ret

SlowFadeOut:
	call RotateFourPalettesLeft
	ret

SlowFadeIn:
	call RotateFourPalettesRight
	ret

FadeOutWhite:
	call RotateThreePalettesRight
	ret

DeleteSave:
	farcall EmptyAllSRAMBanks
	ret

OverworldBGMap:
	call ClearPalettes
	call ClearScreen
	call WaitBGMap2
	call HideSprites
	call RotateThreePalettesLeft
	ret

BattleBGMap:
	ld b, SCGB_BATTLE_GRAYSCALE
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	ret

HalveMoney:
	farcall StubbedTrainerRankings_WhiteOuts

; Halve the player's money.
	ld hl, wMoney
	ld a, [hl]
	srl a
	ld [hli], a
	ld a, [hl]
	rra
	ld [hli], a
	ld a, [hl]
	rra
	ld [hl], a
	ret

GetWhiteoutSpawn:
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	farcall IsSpawnPoint
	ld a, c
	jr c, .yes
	xor a ; SPAWN_HOME

.yes
	ld [wDefaultSpawnpoint], a
	ret

