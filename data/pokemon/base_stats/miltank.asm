	db  95,  80, 105, 100,  40,  70 ; 490 BST
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 200 ; base exp
	db NO_ITEM ; item 1
	db MOOMOO_MILK ; item 2
	dn GENDER_F100, 3 ; gender ratio, step cycles to hatch
	INCBIN "gfx/pokemon/miltank/front.dimensions"
	abilities_for MILTANK, THICK_FAT, REGENERATOR, REGENERATOR
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield   0,   0,   0,   0,   0,   0
	;         hp  atk  def  spd  sat  sdf

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, BULLDOZE, SOLAR_BEAM, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, SHADOW_BALL, ROCK_SMASH, DOUBLE_TEAM, SANDSTORM, SUBSTITUTE, FACADE, REST, ATTRACT, ROCK_SLIDE, FOCUS_BLAST, WATER_PULSE, GIGA_IMPACT, THUNDER_WAVE, GYRO_BALL, SURF, STRENGTH, WHIRLPOOL, BODY_SLAM, COUNTER, DEFENSE_CURL, DOUBLE_EDGE, ENDURE, FIRE_PUNCH, HEADBUTT, ICE_PUNCH, ICY_WIND, IRON_HEAD, ROLLOUT, SEISMIC_TOSS, SLEEP_TALK, SWAGGER, THUNDERPUNCH, ZAP_CANNON, ZEN_HEADBUTT
	; end
