	db  95,  65,  65,  60, 120, 140 ; 525 BST
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY ; type
	db 45 ; catch rate
	db 196 ; base exp
	db NO_ITEM ; item 1
	db PINK_BOW ; item 2
	dn GENDER_F12_5, 6 ; gender ratio, step cycles to hatch
	INCBIN "gfx/pokemon/sylveon/front.dimensions"
if DEF(FAITHFUL)
	abilities_for SYLVEON, CUTE_CHARM, CUTE_CHARM, PIXILATE
else
	abilities_for SYLVEON, PIXILATE, SERENE_GRACE, PIXILATE
endc
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	ev_yield   0,   0,   0,   0,   0,   0
	;         hp  atk  def  spd  sat  sdf

	; tm/hm learnset
	tmhm CURSE, CALM_MIND, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SWIFT, SUBSTITUTE, FACADE, REST, ATTRACT, DAZZLINGLEAM, FLASH, CUT, DOUBLE_EDGE, ENDURE, HYPER_VOICE, PAY_DAY, SKILL_SWAP, SLEEP_TALK, SWAGGER
	; end
