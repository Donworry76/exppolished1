	db  40,  40,  45,  70,  50, 100 ; 335 BST
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 190 ; catch rate
	db 105 ; base exp
	db NO_ITEM ; item 1
	db POISON_BARB ; item 2
	dn GENDER_F50, 3 ; gender ratio, step cycles to hatch
	INCBIN "gfx/pokemon/tentacool/front.dimensions"
	abilities_for TENTACOOL, TANGLING_HAIR, LIQUID_OOZE, CLEAR_BODY
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	ev_yield   0,   0,   0,   0,   0,   0
	;         hp  atk  def  spd  sat  sdf

	; tm/hm learnset
	tmhm CURSE, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, RETURN, DOUBLE_TEAM, SLUDGE_BOMB, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, DAZZLINGLEAM, LEECH_LIFE, SCALD, WATER_PULSE, POISON_JAB, SWORDS_DANCE, CUT, SURF, WHIRLPOOL, WATERFALL, DOUBLE_EDGE, ENDURE, ICY_WIND, KNOCK_OFF, SLEEP_TALK, SWAGGER
	; end
