/obj/item/gun/ballistic/automatic/smg/vector_usl
	name = "\improper Vector carbine"
	desc = "A reliable and relatively robust SMG produced for and used by the USL and it's armed forces. Seemingly based off of the Vector, which is found in the hands of many independent police forces. Chambered in 9mm."
	icon = 'echo13_modular/icons/obj/guns/projectile.dmi'
	lefthand_file = 'echo13_modular/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'echo13_modular/icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "vector-usl"
	item_state = "vector-usl"
	mag_type = /obj/item/ammo_box/magazine/smgm9mm
	bolt_type = BOLT_TYPE_LOCKING
	mag_display = TRUE
	weapon_weight = WEAPON_LIGHT
	empty_indicator = TRUE

/obj/item/gun/ballistic/automatic/smg/vector_usl/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.15 SECONDS)
