/obj/item/clothing/suit/armor
	icon = 'icons/obj/clothing/suits/armor.dmi'
	mob_overlay_icon = 'icons/mob/clothing/suits/armor.dmi'
	allowed = null
	body_parts_covered = CHEST
	cold_protection = CHEST|GROIN
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	strip_delay = 60
	equip_delay_other = 40
	max_integrity = 250
	resistance_flags = NONE
	armor = list("melee" = 35, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	greyscale_colors = list(list(18, 19), list(13, 18), list(20, 15))
	greyscale_icon_state = "armor"

/obj/item/clothing/suit/armor/Initialize()
	. = ..()
	if(!allowed)
		allowed = GLOB.security_vest_allowed

/obj/item/clothing/suit/armor/vest
	name = "armor vest"
	desc = "A slim Type I armored vest that provides decent protection against most types of damage."
	icon_state = "armor"
	item_state = "armor"
	blood_overlay_type = "armor"
	dog_fashion = /datum/dog_fashion/back

/obj/item/clothing/suit/armor/vest/alt
	desc = "A Type I armored vest that provides decent protection against most types of damage."
	icon_state = "armor_alt"
	item_state = "armoralt"

/obj/item/clothing/suit/armor/vest/marine
	name = "light tactical armor vest"
	desc = "A set of the finest mass-produced stamped plasteel armor plates money can buy."
	icon_state = "marine_light"
	item_state = "armor"
	clothing_flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("melee" = 50, "bullet" = 50, "laser" = 30, "energy" = 25, "bomb" = 50, "bio" = 100, "fire" = 40, "acid" = 50)
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/suit/armor/vest/marine/medium
	name = "medium tactical armor vest"
	icon_state = "marine_medium"

/obj/item/clothing/suit/armor/vest/marine/heavy
	name = "large tactical armor vest"
	icon_state = "marine_heavy"

/obj/item/clothing/suit/armor/vest/old
	name = "degrading armor vest"
	desc = "Older generation Type 1 armored vest. Due to degradation over time the vest is far less maneuverable to move in."
	slowdown = 1

/obj/item/clothing/suit/armor/vest/blueshirt
	name = "large armor vest"
	desc = "A large, yet comfortable piece of armor, protecting you from some threats."
	icon_state = "armor_blueshift"
	item_state = "blueshift"
	custom_premium_price = 750

/obj/item/clothing/suit/armor/vest/duster
	name = "black duster"
	desc = "A long, intimidating black coat. This one is reinforced and ideal for protecting its wearer from rain, sun, dust, and bullets."
	icon_state = "armor_duster"
	item_state = "duster_sec"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/suit/armor/hos
	name = "armored greatcoat"
	desc = "A greatcoat enhanced with a special alloy for some extra protection and style for those with a commanding presence."
	icon_state = "armor_hos"
	item_state = "greatcoat"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list("melee" = 30, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 90)
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	strip_delay = 80

/obj/item/clothing/suit/armor/hos/trenchcoat
	name = "armored trenchcoat"
	desc = "A trenchcoat enhanced with a special lightweight kevlar. The epitome of tactical plainclothes."
	icon_state = "armor_hostrench"
	item_state = "hostrench"
	flags_inv = 0

/obj/item/clothing/suit/armor/vest/security/warden
	name = "warden's jacket"
	desc = "A black armored jacket with silver shoulder designations and '/Warden/' stitched into one of the chest pockets."

	icon_state = "armor_warden"
	item_state = "armor"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	strip_delay = 70
	resistance_flags = FLAMMABLE
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/security/warden/alt
	name = "warden's armored jacket"
	desc = "A white jacket with silver rank pips and body armor strapped on top."
	icon_state = "armor_warden_jacket"

/obj/item/clothing/suit/armor/vest/security/warden/alt/nt
	name = "warden's red armored jacket"
	desc = "A red jacket with silver rank pips and body armor strapped on top."
	icon_state = "armor_rwarden_jacket"

/obj/item/clothing/suit/armor/vest/leather
	name = "security overcoat"
	desc = "Lightly armored leather overcoat meant as casual wear for high-ranking officers. Bears the crest of Nanotrasen Security."
	icon_state = "armor_leathercoat-sec"
	item_state = "hostrench"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/capcarapace
	name = "captain's carapace"
	desc = "A fireproof armored chestpiece reinforced with ceramic plates and plasteel pauldrons to provide additional protection whilst still offering maximum mobility and flexibility. Issued only to NT's finest, although it does chafe your nipples."
	icon_state = "carapace_nt"
	item_state = "armor"
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 50, "bullet" = 40, "laser" = 50, "energy" = 50, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 90)
	dog_fashion = null
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armor/vest/capcarapace/syndicate
	name = "syndicate captain's vest"
	desc = "A sinister looking vest of advanced armor worn over a black and red fireproof jacket. The gold collar and shoulders denote that this belongs to a high ranking syndicate officer."
	icon_state = "carapace_syndie"

/obj/item/clothing/suit/armor/vest/capcarapace/alt
	name = "captain's parade jacket"
	desc = "For when an armoured vest isn't fashionable enough."
	icon_state = "carapace_ntformal"
	item_state = "capspacesuit"

/obj/item/clothing/suit/armor/vest/capcarapace/minutemen
	name = "colonial minutemen general coat"
	desc = "A very fancy coat used by generals of the Colonial Minutemen."
	icon_state = "carapace_minuteman"

/obj/item/clothing/suit/armor/vest/capcarapace/duster
	name = "captain's duster"
	desc = "A long, commanding coat worn over a surprisingly sleek set of armor and decorated with gold embroidery. Ideal for protecting its wearer from rain, sun, dust, mutineers, pirates, bears, hordes of angry legions, and so on."
	icon_state = "carapace_duster"
	item_state = "duster_captain"

/obj/item/clothing/suit/armor/riot
	name = "riot suit"
	desc = "A suit of semi-flexible polycarbonate body armor with heavy padding to protect against melee attacks. Helps the wearer resist shoving in close quarters."
	icon_state = "riot"
	item_state = "swat_suit"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("melee" = 50, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 80)
	clothing_flags = BLOCKS_SHOVE_KNOCKDOWN
	strip_delay = 80
	equip_delay_other = 60

/obj/item/clothing/suit/armor/riot/minutemen
	name = "black riot suit"
	desc = "Designed to protect against close range attacks. This one is painted black. Mainly used by the CM-BARD against hostile xenofauna, it also sees prolific use on some Minutemen member worlds."
	icon_state = "riot_minutemen"


/obj/item/clothing/suit/armor/bone
	name = "bone armor"
	desc = "A tribal armor plate, crafted from animal bone."
	icon_state = "armor_bone"
	item_state = "bonearmor"
	blood_overlay_type = "armor"
	armor = list("melee" = 35, "bullet" = 25, "laser" = 25, "energy" = 35, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS

/obj/item/clothing/suit/armor/vest/bulletproof
	name = "bulletproof armor"
	desc = "A Type III heavy bulletproof vest that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "bulletproof"
	armor = list("melee" = 15, "bullet" = 60, "laser" = 10, "energy" = 10, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	strip_delay = 70
	equip_delay_other = 50

/obj/item/clothing/suit/armor/vest/bulletproof/frontier
	name = "\improper Frontiersmen bulletproof armor"
	desc = "A scrap piece of armor made of disused protective plates. This one was used to protect the squishy bits of a Frontiersman, once."
	icon_state = "frontier_armor"

/obj/item/clothing/suit/armor/laserproof
	name = "reflector vest"
	desc = "A vest that excels in protecting the wearer against energy projectiles, as well as occasionally reflecting them."
	icon_state = "laserproof"
	item_state = "armor_reflec"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	armor = list("melee" = 10, "bullet" = 10, "laser" = 60, "energy" = 60, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	var/hit_reflect_chance = 50

/obj/item/clothing/suit/armor/laserproof/IsReflect(def_zone)
	if(!(def_zone in list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))) //If not shot where ablative is covering you, you don't get the reflection bonus!
		return FALSE
	if (prob(hit_reflect_chance))
		return TRUE

/obj/item/clothing/suit/armor/vest/det_suit
	name = "detective's armor vest"
	desc = "An armored vest with a detective's badge on it."
	icon_state = "armor_detective"
	resistance_flags = FLAMMABLE
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/det_suit/Initialize()
	. = ..()
	allowed = GLOB.detective_vest_allowed

/obj/item/clothing/suit/armor/vest/infiltrator
	name = "infiltrator vest"
	desc = "This vest is made of of highly flexible materials that absorb impacts with ease."
	icon_state = "armor_infiltrator"
	item_state = "infiltrator"
	armor = list("melee" = 40, "bullet" = 40, "laser" = 30, "energy" = 40, "bomb" = 70, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	strip_delay = 80

//All of the armor below is mostly unused

/obj/item/clothing/suit/armor/heavy
	name = "heavy armor"
	desc = "A heavily armored suit that protects against moderate damage."
	icon_state = "heavy"
	item_state = "swat_suit"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.9
	clothing_flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	slowdown = 3
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 50, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 90)

/obj/item/clothing/suit/armor/tdome
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	clothing_flags = THICKMATERIAL
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("melee" = 80, "bullet" = 80, "laser" = 50, "energy" = 50, "bomb" = 100, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 90)

/obj/item/clothing/suit/armor/tdome/red
	name = "thunderdome suit"
	desc = "Reddish armor."
	icon_state = "tdred"
	item_state = "tdred"

/obj/item/clothing/suit/armor/tdome/green
	name = "thunderdome suit"
	desc = "Pukish armor."	//classy.
	icon_state = "tdgreen"
	item_state = "tdgreen"


/obj/item/clothing/suit/armor/riot/knight
	name = "plate armour"
	desc = "A classic suit of plate armour, highly effective at stopping melee attacks."
	icon_state = "riot_knight_green"
	item_state = "riot_knight_green"
	allowed = list(/obj/item/nullrod, /obj/item/claymore, /obj/item/banner, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/oxygen, /obj/item/tank/internals/plasmaman)

/obj/item/clothing/suit/armor/riot/knight/yellow
	icon_state = "riot_knight_yellow"
	item_state = "riot_knight_yellow"

/obj/item/clothing/suit/armor/riot/knight/blue
	icon_state = "riot_knight_blue"
	item_state = "riot_knight_blue"

/obj/item/clothing/suit/armor/riot/knight/red
	icon_state = "riot_knight_red"
	item_state = "riot_knight_red"

/obj/item/clothing/suit/armor/riot/knight/greyscale
	name = "heavy plate armour"
	desc = "A suit of magical plate armour, able to be made from many different materials. The thick armor is far lighter than it otherwise would be."
	icon_state = "riot_knight_greyscale"
	item_state = "riot_knight_greyscale"
	material_flags = MATERIAL_ADD_PREFIX | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS//Can change color and add prefix
	armor = list("melee" = 45, "bullet" = 20, "laser" = 20, "energy" = 25, "bomb" = 35, "bio" = 10, "rad" = 10, "fire" = 40, "acid" = 40)
	slowdown = 0

/obj/item/clothing/suit/armor/vest/durathread
	name = "durathread vest"
	desc = "A vest made of durathread with strips of leather acting as trauma plates."
	icon_state = "armor_durathread"
	item_state = "durathread"
	strip_delay = 60
	equip_delay_other = 40
	max_integrity = 200
	resistance_flags = FLAMMABLE
	armor = list("melee" = 20, "bullet" = 10, "laser" = 30, "energy" = 40, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 40, "acid" = 50)

/obj/item/clothing/suit/armor/vest/russian
	name = "russian vest"
	desc = "A bulletproof vest with forest camo. Good thing there's plenty of forests to hide in around here, right?"
	icon_state = "armor_camo"
	item_state = "rus_armor"
	armor = list("melee" = 25, "bullet" = 30, "laser" = 0, "energy" = 10, "bomb" = 10, "bio" = 0, "rad" = 20, "fire" = 20, "acid" = 50)

/obj/item/clothing/suit/armor/vest/russian_coat
	name = "russian battle coat"
	desc = "Used in extremly cold fronts, made out of real bears."
	icon_state = "armor_coat"
	item_state = "rus_coat"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	armor = list("melee" = 25, "bullet" = 20, "laser" = 20, "energy" = 30, "bomb" = 20, "bio" = 50, "rad" = 20, "fire" = -10, "acid" = 50)

/obj/item/clothing/suit/armor/hos/inteq
	name = "inteq battle coat"
	desc = "A luxurious brown coat with an crossweave of Kevlar and fur from genuine wolves, as protective as it is stylish."
	icon_state = "armor_inteq_battlecoat"
	item_state = "inteq_battlecoat"
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/suit/armor/inteq/corpsman
	name = "inteq corpsman vest"
	desc = "A shortened brown labcoat with an armor vest under it, for the IRMG's support division medical staff."
	icon_state = "armor_inteq_labcoat"
	item_state = "inteq_labcoat"
	allowed = list(
		/obj/item/analyzer,
		/obj/item/stack/medical,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/hypospray,
		/obj/item/healthanalyzer,
		/obj/item/flashlight/pen,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/pill,
		/obj/item/storage/pill_bottle,
		/obj/item/melee/classic_baton/telescopic,
		/obj/item/soap,
		/obj/item/sensor_device,
		/obj/item/tank/internals/emergency_oxygen,
		/obj/item/tank/internals/plasmaman,
		/obj/item/ammo_box,
		/obj/item/gun/ballistic,
		/obj/item/gun/energy,
		/obj/item/melee/baton,
	)

/obj/item/clothing/suit/armor/roumain
	name = "saint-roumain duster"
	desc = "A coat made from hard leather. Meant to withstand long hunts in harsh wilderness."
	icon_state = "armor_rouma"
	item_state = "rouma_coat"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS

/obj/item/clothing/suit/armor/roumain/shadow
	name = "saint-roumain shadow duster"
	desc = "A coat made from hard leather. Its rough, barely-treated finish is typical of one of the Saint-Roumain Militia's trainees."
	icon_state = "armor_rouma_shadow"
	item_state = "rouma_shadow_coat"

/obj/item/clothing/suit/armor/hos/roumain/montagne
	name = "saint-roumain montagne coat"
	desc = "A stylish red coat to indicate that you are, in fact, a Hunter Montagne. Made of extra hard exotic leather, treated with bullet-resistant materials, and lined with the fur of some unidentifiable creature."
	icon_state = "armor_rouma_montagne"
	item_state = "rouma_montagne_coat"

/obj/item/clothing/suit/armor/vest/lieutenant
	name = "lieutenant's armor"
	desc = "An armored vest with a lieutenant's insignia imprinted on it."
	icon_state = "armor_blueshield"
	item_state = "blueshield"

/obj/item/clothing/suit/armor/vest/bulletproof/solgov
	name = "\improper SolGov armor vest"
	desc = "A standard armor vest fielded for SolGov's infantry."
	icon_state = "armor_solgov"
	item_state = "armor_solgov"

/obj/item/clothing/suit/armor/vest/bulletproof/solgov/Initialize()
	. = ..()
	allowed |= list(/obj/item/gun/ballistic/automatic/assualt/swiss_cheese, /obj/item/tank)

/obj/item/clothing/suit/armor/vest/bulletproof/solgov/rep
	name = "\improper SolGov Inspector armor vest"
	desc = "A type I armor vest emblazoned with the SolGov logo."
	icon_state = "armor_alt_solgov"
	item_state = "armor_alt_solgov"
	armor = list("melee" = 35, "bullet" = 30, "laser" = 30, "energy" = 40, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)

/obj/item/clothing/suit/armor/vest/hop
	name = "head of personnel's parade jacket"
	desc = "For when an armoured vest isn't fashionable enough."
	icon_state = "armor_hopformal"
	item_state = "capspacesuit"

/obj/item/clothing/suit/armor/vest/syndie
	name = "\improper Syndicate plate carrier"
	desc = "A plate carrier vest commonly used by Syndicate forces, regardless of affiliation. Has a few attached pouches."
	icon_state = "armor_syndie"
	item_state = "syndiearmor"

/obj/item/clothing/suit/armor/vest/scrap_armor
	name = "scrap armor"
	desc = "An 'armor' vest consisting of sheet metal held together with cable. Who thought this was a good idea?"
	icon_state = "scraparmor"
	item_state = "scraparmor"
	armor = list("melee" = 5)

/obj/item/clothing/suit/armor/curator
	name = "treasure hunter's coat"
	desc = "Both fashionable and lightly armoured, this jacket is favoured by treasure hunters the galaxy over."
	icon_state = "armor_curator"
	item_state = "curator"
	blood_overlay_type = "coat"
	body_parts_covered = CHEST|ARMS
	allowed = list(/obj/item/tank/internals, /obj/item/melee/curator_whip)
	armor = list("melee" = 25, "bullet" = 10, "laser" = 25, "energy" = 35, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 45)
	cold_protection = CHEST|ARMS
	heat_protection = CHEST|ARMS

/obj/item/clothing/suit/armor/solgov_trenchcoat
	name = "\improper SolGov trenchcoat"
	desc = "A solgov official's trenchcoat. Has a lot of pockets."
	icon_state = "armor_solgov_trenchcoat"
	item_state = "trenchcoat_solgov"
	body_parts_covered = CHEST|LEGS|ARMS
	armor = list("melee" = 25, "bullet" = 10, "laser" = 25, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	cold_protection = CHEST|LEGS|ARMS
	heat_protection = CHEST|LEGS|ARMS

//JACKETS
/obj/item/clothing/suit/armor/vest/security
	item_state = "armor"
	body_parts_covered = CHEST|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	strip_delay = 70
	resistance_flags = FLAMMABLE
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/security/officer
	name = "security officer's jacket"
	desc = "This jacket is for those special occasions when a security officer isn't required to wear their armor."
	icon_state = "armor_officerjacket"
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/suit/armor/vest/security/warden
	name = "warden's jacket"
	desc = "Perfectly suited for the warden that wants to leave an impression of style on those who visit the brig."
	icon_state = "armor_warden"
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/suit/armor/vest/security/hos
	name = "head of security's jacket"
	desc = "This piece of clothing was specifically designed for asserting superior authority."
	icon_state = "hosjacket"
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/suit/armor/vest/security/brig_phys
	name = "brig physician's jacket"
	desc = "A black jacket with dark blue and silver accents, for the brig physician to prove they're a real member of security in style."
	icon_state = "armor_brigphysjacket"
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/suit/armor/frontier
	name = "reinforced fur coat"
	desc = "A stiff coat, meant for frigid conditions."
	icon_state = "frontier_coat"
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
