if DEF(FAITHFUL)
	db  80, 105,  65,  70, 100,  70 ; 490 BST
	;   hp  atk  def  spd  sat  sdf
else
	db  80, 115,  65,  70, 110,  80 ; 510 BST
	;   hp  atk  def  spd  sat  sdf
endc

	db GRASS, POISON ; type
	db 45 ; catch rate
if DEF(FAITHFUL)
	db 191 ; base exp
else
	db 199 ; base exp
endc
	db ALWAYS_ITEM_2 ; item 1
	db BIG_ROOT ; item 2
	dn GENDER_F50, 3 ; gender ratio, step cycles to hatch
	INCBIN "gfx/pokemon/victreebel/front.dimensions"
	abilities_for VICTREEBEL, EFFECT_SPORE, EFFECT_SPORE, GLUTTONY
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	ev_yield   0,   0,   0,   0,   0,   0
	;         hp  atk  def  spd  sat  sdf

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLAR_BEAM, RETURN, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ENERGY_BALL, POISON_JAB, GIGA_IMPACT, FLASH, SWORDS_DANCE, CUT, BODY_SLAM, DOUBLE_EDGE, EARTH_POWER, ENDURE, KNOCK_OFF, SEED_BOMB, SLEEP_TALK, SUCKER_PUNCH, SWAGGER
	; end
