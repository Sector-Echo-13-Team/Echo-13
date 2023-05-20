/obj/item/gun/ballistic/automatic/powered/gauss/usl_gauss_pistol
	name = "USL Gauss Pistol"
	desc = "Bang bang."
	icon = 'echo13/icons/obj/guns/projectile.dmi'
	icon_state = "gausspistol"
	item_state = "arg"
	cell_type = /obj/item/stock_parts/cell/gun/mini
	small_gun = TRUE
	bolt_type = BOLT_TYPE_OPEN
	mag_type = /obj/item/ammo_box/magazine/gauss4mm
	fire_sound = 'sound/weapons/gun/gauss/gauss_shoot.ogg'
	vary_fire_sound = TRUE
	load_sound = 'sound/weapons/gun/pistol/mag_insert.ogg'
	rack_sound = 'sound/weapons/gun/gauss/pistol_reload.ogg'
	rack_sound_vary = FALSE
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'
	pickup_sound = 'sound/items/handling/gun_pickup.ogg'
	can_suppress = FALSE
	fire_delay = 2
	spread = 0
	recoil = 0.1
	actions_types = list()
	mag_display = TRUE
	empty_indicator = TRUE
	empty_alarm = TRUE
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL
	shaded_charge = 1
	charge_sections = 6
