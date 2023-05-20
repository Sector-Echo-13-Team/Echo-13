/obj/item/ammo_box/magazine/gauss4mm
	name = "gauss pistol magazine (4mm flechette)"
	desc = "A single stack magazine designed to hold 4mm ferromagnetic flechette rounds, used in gauss weapons of pistol configuration."
	icon = 'echo13/icons/obj/ammo.dmi'
	icon_state = "gauss4mm"
	ammo_type = /obj/item/ammo_casing/caseless/gauss/g4mm
	caliber = "4mm"
	max_ammo = 12

/obj/item/ammo_box/magazine/gauss4mm/update_icon()
	..()
	if (ammo_count() == 1)
		icon_state = "gauss4mm-1"
	else
		icon_state = "gauss4mm-[round(ammo_count(),2)]"

/obj/item/ammo_box/magazine/gauss4mm/hicap
	name = "hi-cap gauss pistol magazine (4mm flechette)"
	desc = "A double stack high capacity magazine designed to hold 4mm ferromagnetic flechette rounds, used in gauss weapons of pistol configuration. Rumored to be more prone to malfunctions, it is definitely slightly more complex."
	icon_state = "gauss4mmhicap"
	max_ammo = 24

/obj/item/ammo_box/magazine/gauss4mm/hicap/update_icon()
	..()
	if (ammo_count() == 0)
		icon_state = "gauss4mmhicap-0"
	else
		icon_state = "gauss4mmhicap-1"
