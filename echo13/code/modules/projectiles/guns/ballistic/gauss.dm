/obj/item/gun/ballistic/automatic/powered/gauss/gp_usl
	name = "USL Gauss Pistol"
	desc = "Bang bang."
	icon = 'echo13/icons/obj/guns/projectile.dmi'
	lefthand_file = 'echo13/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'echo13/icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "gausspistol"
	item_state = "gausspistol5"
	slot_flags = ITEM_SLOT_BELT
	mob_overlay_icon = 'echo13/icons/mob/clothing/belt.dmi'
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
	var/inhand_charge_sections = 5

/obj/item/gun/ballistic/automatic/powered/gauss/gp_usl/proc/get_charge_ratio_inhand() //not enough sprite for 6 charge sections so im just doing this lol
	if(!cell)
		return FALSE
	return CEILING(clamp(cell.charge / cell.maxcharge, 0, 1) * inhand_charge_sections, 1)

/obj/item/gun/ballistic/automatic/powered/gauss/gp_usl/update_icon_state() //god I love how many features of energy weapons are just not here
	var/inhand_ratio = get_charge_ratio_inhand()
	var/new_item_state = ""
	new_item_state = "[icon_state][inhand_ratio]"
	item_state = new_item_state
