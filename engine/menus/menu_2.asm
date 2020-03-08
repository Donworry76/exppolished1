PlaceMenuItemName:
; places a star near the name if registered
	push hl
	push de
	dec de
	dec de
	ld a, " "
	ld [de], a
	ld a, [wMenuSelection]
	pop de
	pop hl
PlaceMartItemName:
	push de
	ld a, [wMenuSelection]
	cp a, -1 ; special case for Cancel in Key Items pocket
	ld de, ScrollingMenu_CancelString ; found in scrolling_menu.asm
	ld [wNamedObjectIndexBuffer], a
	call nz, GetItemName
	pop hl
	jp PlaceString

PlaceMenuTMHMName:
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndexBuffer], a
	call GetTMHMName
	pop hl
	jp PlaceString

PlaceMenuApricornQuantity:
	ld a, [wMenuSelection]
	ld [wCurItem], a
	and a
	ret nz
	ld l, e
	ld h, d
	jr _PlaceMenuQuantity

PlaceMenuItemQuantity: ; 0x24ac3
	ld a, [wMenuSelection]
	ld [wCurItem], a
	push de
	pop hl
_PlaceMenuQuantity:
	ld de, $15
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wMenuSelectionQuantity
	lb bc, 1, 2
	jp PrintNum

PlaceMoneyTopRight: ; 24ae8
	ld hl, MenuDataHeader_0x24b15
	call CopyMenuDataHeader
	jr PlaceMoneyDataHeader

PlaceMoneyBottomLeft: ; 24af0
	ld hl, MenuDataHeader_0x24b1d
	call CopyMenuDataHeader
	jr PlaceMoneyDataHeader

PlaceMoneyAtTopLeftOfTextbox: ; 24af8
	ld hl, MenuDataHeader_0x24b15
	lb de, 0, 11
	call OffsetMenuDataHeader

PlaceMoneyDataHeader: ; 24b01
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH + 1
	add hl, de
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 7
	jp PrintNum

MenuDataHeader_0x24b15: ; 0x24b15
	db $40 ; flags
	db 00, 10 ; start coords
	db 02, 19 ; end coords
	dw NULL
	db 1 ; default option

MenuDataHeader_0x24b1d: ; 0x24b1d
	db $40 ; flags
	db 11, 00 ; start coords
	db 13, 09 ; end coords
	dw NULL
	db 1 ; default option

PlaceBlueCardPointsTopRight:
	hlcoord 11, 0
	lb bc, 1, 7
	call TextBox
	hlcoord 12, 1
	ld de, wBlueCardBalance
	lb bc, 1, 3
	call PrintNum
	ld de, .PointsString
	jp PlaceString

.PointsString:
	db " Pts@"

PlaceBattlePointsTopRight:
	hlcoord 12, 0
	lb bc, 1, 6
	call TextBox
	hlcoord 13, 1
	ld de, wBattlePoints
	lb bc, 1, 3
	call PrintNum
	ld de, .BPString
	jp PlaceString

.BPString:
	db " BP@"

Special_DisplayCoinCaseBalance: ; 24b25
	; Place a text box of size 1x7 at 11, 0.
	hlcoord 11, 0
	lb bc, 1, 7
	call TextBox
	hlcoord 12, 0
	ld de, CoinString
	call PlaceString
	ld de, wCoins
	lb bc, 2, 5
	hlcoord 13, 1
	jp PrintNum

Special_DisplayMoneyAndCoinBalance: ; 24b4e
	hlcoord 5, 0
	lb bc, 3, 13
	call TextBox
	hlcoord 6, 1
	ld de, MoneyString
	call PlaceString
	hlcoord 11, 1
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 7
	call PrintNum
	hlcoord 6, 3
	ld de, CoinString
	call PlaceString
	hlcoord 14, 3
	ld de, wCoins
	lb bc, 2, 5
	jp PrintNum

MoneyString: ; 24b83
	db "Money@"
CoinString: ; 24b89
	db "Coin@"

StartMenu_DrawBugContestStatusBox: ; 24bdc
	hlcoord 0, 0
	lb bc, 5, 17
	jp TextBox

StartMenu_PrintBugContestStatus: ; 24be7
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call StartMenu_DrawBugContestStatusBox
	hlcoord 1, 5
	ld de, .Balls
	call PlaceString
	hlcoord 8, 5
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	hlcoord 1, 1
	ld de, .Caught
	call PlaceString
	ld a, [wContestMon]
	and a
	ld de, .None
	jr z, .no_contest_mon
	ld [wd265], a
	call GetPokemonName

.no_contest_mon
	hlcoord 8, 1
	call PlaceString
	ld a, [wContestMon]
	and a
	jr z, .skip_level
	hlcoord 1, 3
	ld de, .Level
	call PlaceString
	ld a, [wContestMonLevel]
	ld h, b
	ld l, c
	inc hl
	ld c, 3
	call Print8BitNumRightAlign

.skip_level
	pop af
	ld [wOptions1], a
	ret

.Caught: ; 24c4b
	db "Caught@"
.Balls: ; 24c52
	db "Balls:@"
.None: ; 24c59
	db "None@"
.Level: ; 24c5e
	db "Level@"
