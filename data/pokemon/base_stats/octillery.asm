	db  95, 75,  75,  95, 125,  75 ; 480 BST
	;   hp  atk  def  spd  sat  sdf

if DEF(FAITHFUL)
	db WATER, WATER ; type
else
	db WATER, FIRE ; type
endc
	db 75 ; catch rate
	db 164 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn GENDER_F50, 3 ; gender ratio, step cycles to hatch
	INCBIN "gfx/pokemon/octillery/front.dimensions"
	abilities_for OCTILLERY, MEGA_LAUNCHER, SNIPER, MOODY
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_2 ; egg groups

	ev_yield   0,   0,   0,   0,   0,   0
	;         hp  atk  def  spd  sat  sdf

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, PSYCHIC, DOUBLE_TEAM, FLASH_CANNON, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, THIEF, ENERGY_BALL, SCALD, WATER_PULSE, GIGA_IMPACT, THUNDER_WAVE, SURF, WHIRLPOOL, WATERFALL, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, ICY_WIND, SEED_BOMB, SEISMIC_TOSS, SLEEP_TALK, SWAGGER
	; end
