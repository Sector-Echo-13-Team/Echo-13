/obj/item/gun/ballistic/automatic/smg/smg_usl
	name = "\improper United Systems League SMG"
	desc = "A reliable and relatively robust SMG produced for and used by the USL and it's armed forces. Chambered in 9mm."
	icon = 'echo13_modular/icons/obj/guns/projectile.dmi'
	lefthand_file = 'echo13_modular/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'echo13_modular/icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "usl-smg"
	item_state = "usl-smg"
	mag_type = /obj/item/ammo_box/magazine/smgm9mm
	bolt_type = BOLT_TYPE_LOCKING
	mag_display = TRUE
	weapon_weight = WEAPON_LIGHT
	empty_indicator = TRUE

/obj/item/gun/ballistic/automatic/smg/smg_usl/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.15 SECONDS)
