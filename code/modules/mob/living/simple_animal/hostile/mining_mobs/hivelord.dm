/mob/living/simple_animal/hostile/asteroid/hivelord
	name = "hivelord"
	desc = "A truly alien creature, it is a mass of unknown organic material, constantly fluctuating. When attacking, pieces of it split off and attack in tandem with the original."
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "Hivelord"
	icon_living = "Hivelord"
	icon_aggro = "Hivelord_alert"
	icon_dead = "Hivelord_dead"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC
	mouse_opacity = MOUSE_OPACITY_OPAQUE
	move_to_delay = 14
	ranged = 1
	vision_range = 5
	aggro_vision_range = 9
	speed = 3
	maxHealth = 75
	health = 75
	harm_intent_damage = 5
	melee_damage_lower = 0
	melee_damage_upper = 0
	attack_verb_continuous = "lashes out at"
	attack_verb_simple = "lash out at"
	speak_emote = list("telepathically cries")
	attack_sound = 'sound/weapons/pierce.ogg'
	throw_message = "falls right through the strange body of the"
	ranged_cooldown = 0
	ranged_cooldown_time = 20
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 3
	minimum_distance = 3
	pass_flags = PASSTABLE
	loot = list(/obj/item/organ/regenerative_core)
	var/brood_type = /mob/living/simple_animal/hostile/asteroid/hivelordbrood
	var/difficulty = 1

/mob/living/simple_animal/hostile/asteroid/hivelord/OpenFire(the_target)
	if(world.time >= ranged_cooldown)
		for(var/i in 1 to difficulty)
			var/mob/living/simple_animal/hostile/asteroid/hivelordbrood/A = new brood_type(get_turf(src),src)

			A.flags_1 |= (flags_1 & ADMIN_SPAWNED_1)
			A.GiveTarget(target)
			A.friends = friends
			A.faction = faction.Copy()
		ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/asteroid/hivelord/AttackingTarget()
	OpenFire()
	return TRUE

/mob/living/simple_animal/hostile/asteroid/hivelord/spawn_crusher_loot()
	loot += crusher_loot //we don't butcher

/mob/living/simple_animal/hostile/asteroid/hivelord/death(gibbed)
	mouse_opacity = MOUSE_OPACITY_ICON
	..(gibbed)

//A fragile but rapidly produced creature
/mob/living/simple_animal/hostile/asteroid/hivelordbrood
	name = "hivelord brood"
	desc = "A fragment of the original Hivelord, rallying behind its original. One isn't much of a threat, but..."
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "Hivelordbrood"
	icon_living = "Hivelordbrood"
	icon_aggro = "Hivelordbrood"
	icon_dead = "Hivelordbrood"
	icon_gib = "syndicate_gib"
	mouse_opacity = MOUSE_OPACITY_OPAQUE
	move_to_delay = 1
	friendly_verb_continuous = "buzzes near"
	friendly_verb_simple = "buzz near"
	vision_range = 10
	speed = 3
	maxHealth = 1
	health = 1
	movement_type = FLYING
	harm_intent_damage = 5
	melee_damage_lower = 2
	melee_damage_upper = 2
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	speak_emote = list("telepathically cries")
	attack_sound = 'sound/weapons/pierce.ogg'
	throw_message = "falls right through the strange body of the"
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	pass_flags = PASSTABLE | PASSMOB
	density = FALSE
	del_on_death = 1
	var/mob/source

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/Initialize(_source)
	. = ..()
	source = source
	addtimer(CALLBACK(src, .proc/death), 100)
	AddComponent(/datum/component/swarming)

//Legion
/mob/living/simple_animal/hostile/asteroid/hivelord/legion
	name = "legion"
	desc = "You can still see what was once a human under the shifting mass of corruption."
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "legion"
	icon_living = "legion"
	icon_aggro = "legion"
	icon_dead = "legion"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mouse_opacity = MOUSE_OPACITY_ICON
	obj_damage = 60
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_continuous = "lashes out at"
	attack_verb_simple = "lash out at"
	speak_emote = list("echoes")
	attack_sound = 'sound/weapons/pierce.ogg'
	throw_message = "bounces harmlessly off of"
	loot = list(/obj/item/organ/regenerative_core/legion)
	brood_type = /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion
	crusher_loot = /obj/item/crusher_trophy/legion_skull
	del_on_death = 1
	stat_attack = HARD_CRIT
	robust_searching = 1
	var/dwarf_mob = FALSE
	var/mob/living/carbon/human/stored_mob

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/death(gibbed)
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	if(prob(15))
		new /obj/item/crusher_trophy/legion_skull(loc)
		visible_message("<span class='warning'>One of the [src]'s skulls looks intact.</span>")
	..()

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/random/Initialize()
	. = ..()
	if(prob(15))
		new /mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf(loc)
	if(prob(5))
		new /mob/living/simple_animal/hostile/big_legion(loc)
		return INITIALIZE_HINT_QDEL

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf
	name = "dwarf legion"
	desc = "You can still see what was once a rather small human under the shifting mass of corruption. It seems quick on its feet."
	icon_state = "dwarf_legion"
	icon_living = "dwarf_legion"
	icon_aggro = "dwarf_legion"
	icon_dead = "dwarf_legion"
	crusher_loot = /obj/item/crusher_trophy/dwarf_skull
	maxHealth = 150
	health = 150
	move_to_delay = 2
	speed = 1 //much faster!
	dwarf_mob = TRUE

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/death(gibbed)
	visible_message("<span class='warning'>The skulls on [src] wail in anger as they flee from their dying host!</span>")
	var/turf/T = get_turf(src)
	if(T)
		if(stored_mob)
			stored_mob.forceMove(get_turf(src))
			stored_mob = null
		else if(fromtendril)
			new /obj/effect/mob_spawn/human/corpse/charredskeleton(T)
		else if(dwarf_mob)
			new /obj/effect/mob_spawn/human/corpse/damaged/legioninfested/dwarf(T)
		else
			new /obj/effect/mob_spawn/human/corpse/damaged/legioninfested(T)
	..(gibbed)

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril
	fromtendril = TRUE

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf/death(gibbed)
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	if(prob(75))
		new /obj/item/crusher_trophy/dwarf_skull(loc)
		visible_message("<span class='warning'>One of the [src]'s skulls looks like it survived.</span>")
	..()

//Legion skull
/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion
	name = "legion"
	desc = "One of many."
	icon = 'icons/mob/lavaland/lavaland_monsters.dmi'
	icon_state = "legion_head"
	icon_living = "legion_head"
	icon_aggro = "legion_head"
	icon_dead = "legion_head"
	icon_gib = "syndicate_gib"
	friendly_verb_continuous = "buzzes near"
	friendly_verb_simple = "buzz near"
	vision_range = 10
	maxHealth = 1
	health = 5
	harm_intent_damage = 5
	melee_damage_lower = 12
	melee_damage_upper = 12
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	speak_emote = list("echoes")
	attack_sound = 'sound/weapons/pierce.ogg'
	throw_message = "is shrugged off by"
	del_on_death = TRUE
	stat_attack = HARD_CRIT
	robust_searching = 1
	var/can_infest_dead = FALSE

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/staff
	name = "emaciated legion"
	desc = "One of many. This one was spawned from a surrogate host, and is quite short-lived and nearsighted. However, it is freindly to humans."
	color = "#c8e6fb"
	melee_damage_lower = 10
	melee_damage_upper = 10
	vision_range = 5

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/staff/Initialize()
	. = ..()
	addtimer(CALLBACK(src, .proc/death), 50)
	AddComponent(/datum/component/swarming)

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/Life()
	. = ..()
	if(stat == DEAD || !isturf(loc))
		return
	for(var/mob/living/carbon/human/victim in range(src, 1)) //Only for corpse right next to/on same tile
		switch(victim.stat)
			if(UNCONSCIOUS, HARD_CRIT)
				infest(victim)
				return //This will qdelete the legion.
			if(DEAD)
				if(can_infest_dead)
					infest(victim)
					return //This will qdelete the legion.


/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/proc/infest(mob/living/carbon/human/H)
	visible_message("<span class='warning'>[name] burrows into the flesh of [H]!</span>")
	var/mob/living/simple_animal/hostile/asteroid/hivelord/legion/L
	if(HAS_TRAIT(H, TRAIT_DWARF)) //dwarf legions aren't just fluff!
		L = new /mob/living/simple_animal/hostile/asteroid/hivelord/legion/dwarf(H.loc)
	else
		L = new(H.loc)
	visible_message("<span class='warning'>[L] staggers to [L.p_their()] feet!</span>")
	H.death()
	H.adjustBruteLoss(1000)
	L.stored_mob = H
	H.forceMove(L)
	qdel(src)

//Advanced Legion is slightly tougher to kill and can raise corpses (revive other legions)
/mob/living/simple_animal/hostile/asteroid/hivelord/legion/advanced
	name = "Signifer"
	desc = "A shrunken legion, carring the remnants of a mouldering battle standard. The cadre of lackeys surrounding it seem particularly attentive."
	stat_attack = DEAD
	maxHealth = 120
	health = 120
	brood_type = /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/advanced
	icon_state = "dwarf_legion"
	icon_living = "dwarf_legion"
	icon_aggro = "dwarf_legion"
	icon_dead = "dwarf_legion"

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/advanced
	stat_attack = DEAD
	can_infest_dead = TRUE

//Legion that spawns Legions
/mob/living/simple_animal/hostile/big_legion
	name = "Legate"
	desc = "A rare and incredibly dangerous legion mutation, forming from a plethora of legion joined in union around a young necropolis spire. It's looking particularly self-confident."
	icon = 'icons/mob/lavaland/64x64megafauna.dmi'
	icon_state = "legion"
	icon_living = "legion"
	icon_dead = "legion"
	health_doll_icon = "legion"
	health = 500
	maxHealth = 500
	melee_damage_lower = 30
	melee_damage_upper = 30
	anchored = FALSE
	AIStatus = AI_ON
	obj_damage = 150
	stop_automated_movement = FALSE
	wander = TRUE
	attack_verb_continuous = "brutally slams"
	attack_verb_simple = "brutally slam"
	layer = MOB_LAYER
	del_on_death = TRUE
	sentience_type = SENTIENCE_BOSS
	loot = list(/obj/item/organ/regenerative_core/legion = 3, /obj/effect/mob_spawn/human/corpse/damaged/legioninfested = 5, /obj/effect/mob_spawn/human/corpse/damaged/legioninfested = 5, /obj/effect/mob_spawn/human/corpse/damaged/legioninfested = 5)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = INFINITY
	move_to_delay = 7
	vision_range = 4
	aggro_vision_range = 4
	speed = 8
	faction = list("mining")
	weather_immunities = list("lava","ash")
	environment_smash = ENVIRONMENT_SMASH_RWALLS
	see_in_dark = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE

/mob/living/simple_animal/hostile/big_legion/death(gibbed)
	move_force = MOVE_FORCE_DEFAULT
	move_resist = MOVE_RESIST_DEFAULT
	pull_force = PULL_FORCE_DEFAULT
	visible_message("<span class='userwarning'>[src] falls over with a mighty crash, the remaining legions within it falling apart!</span>")
	new /obj/item/crusher_trophy/legion_skull(loc)
	new /obj/item/crusher_trophy/legion_skull(loc)
	new /obj/item/crusher_trophy/legion_skull(loc)
	new /mob/living/simple_animal/hostile/asteroid/hivelord/legion(loc)
	new /mob/living/simple_animal/hostile/asteroid/hivelord/legion(loc)
	new /mob/living/simple_animal/hostile/asteroid/hivelord/legion(loc)
	if(prob(45))
		new /obj/item/reagent_containers/glass/bottle/necropolis_seed(loc)
	..(gibbed)

/mob/living/simple_animal/hostile/big_legion/Initialize()
	.=..()
	AddComponent(/datum/component/spawner, list(/mob/living/simple_animal/hostile/asteroid/hivelord/legion/tendril), 200, faction, "peels itself off from", 3)

// Snow Legion
/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow
	name = "snow legion"
	desc = "You can still see what was once a human under the shifting snowy mass, clearly decorated by a clown."
	icon = 'icons/mob/icemoon/icemoon_monsters.dmi'
	icon_state = "snowlegion"
	icon_living = "snowlegion"
	icon_aggro = "snowlegion_alive"
	icon_dead = "snowlegion"
	crusher_loot = /obj/item/crusher_trophy/legion_skull
	loot = list(/obj/item/organ/regenerative_core/legion)
	brood_type = /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/snow

// Snow Legion skull
/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/snow
	name = "snow legion"
	desc = "One of many."
	icon = 'icons/mob/icemoon/icemoon_monsters.dmi'
	icon_state = "snowlegion_head"
	icon_living = "snowlegion_head"
	icon_aggro = "snowlegion_head"
	icon_dead = "snowlegion_head"

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/snow/tendril
	fromtendril = TRUE

/mob/living/simple_animal/hostile/asteroid/hivelord/legion/crystal
	name = "disfigured legion"
	desc = "Disfigured, contorted, and corrupted. This thing was once part of the legion, now it has a different vile and twisted allegiance."
	icon_state = "disfigured_legion"
	icon_living = "disfigured_legion"
	icon_aggro = "disfigured_legion"
	icon_dead = "disfigured_legion"
	difficulty = 2
	brood_type = /mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/crystal
	loot = list(/obj/item/organ/regenerative_core/legion/crystal)

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/crystal
	name = "disfigured legion"
	desc = "One of none."
	icon_state = "disfigured_legion_head"
	icon_living = "disfigured_legion_head"
	icon_aggro = "disfigured_legion_head"
	icon_dead = "disfigured_legion_head"
	speed = 3
	move_to_delay = 3

/mob/living/simple_animal/hostile/asteroid/hivelordbrood/legion/crystal/death(gibbed)
	for(var/i in 0 to 5)
		var/obj/projectile/P = new /obj/projectile/goliath(get_turf(src))
		P.preparePixelProjectile(get_step(src, pick(GLOB.alldirs)), get_turf(src))
		P.firer = source
		P.fire(i*(360/5))
	return ..()

//Tendril-spawned Legion remains, the charred skeletons of those whose bodies sank into lava or fell into chasms.
/obj/effect/mob_spawn/human/corpse/charredskeleton
	name = "charred skeletal remains"
	burn_damage = 1000
	mob_name = "ashen skeleton"
	mob_gender = NEUTER
	husk = FALSE
	mob_species = /datum/species/skeleton
	mob_color = "#454545"

//Legion infested mobs

/obj/effect/mob_spawn/human/corpse/damaged/legioninfested/dwarf/equip(mob/living/carbon/human/H)
	. = ..()
	H.set_species(/datum/species/dwarf)
	H.transform = H.transform.Scale(0.8, 1)//somehow dwarf squashing is borked when not roundstart. I hate WS code

/obj/effect/mob_spawn/human/corpse/damaged/legioninfested/Initialize() //in an ideal world, these would generate, the legion would overlay over the corpse, and we'd get cool sprites
	mob_species = pickweight(list(
		/datum/species/human = 31,
		/datum/species/lizard = 26,
		/datum/species/ethereal = 24,
		/datum/species/spider = 7,
		/datum/species/ipc = 7,
		/datum/species/jelly = 4,
		/datum/species/fly = 1
		)
	)
	var/type = pickweight(list(
		"Miner" = 44,
		"Waldo" = 3,
		"Ashwalker" = 7,
		"Soldier" = 3,
		"Oldminer" = 8,
		"Kobold" = 5,
		"Golem" = 6,
		"SRM" = 10,
		pick("Shadow", "YeOlde", "Operative", "Cultist") = 4
		)
	)
	switch(type)
		if("Miner")
			if(prob(2))
				mob_species = /datum/species/plasmaman
				uniform = /obj/item/clothing/under/plasmaman
				head = /obj/item/clothing/head/helmet/space/plasmaman
				belt = /obj/item/tank/internals/plasmaman/belt
			else
				uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
				if (prob(4))
					belt = pickweight(list(
						/obj/item/storage/belt/mining = 2,
						/obj/item/storage/belt/mining/alt = 2
						)
					)
				else if(prob(10))
					belt = pickweight(list(
						/obj/item/pickaxe = 8,
						/obj/item/pickaxe/mini = 4,
						/obj/item/pickaxe/silver = 2,
						/obj/item/pickaxe/diamond = 1
						)
					)
				else
					belt = /obj/item/tank/internals/emergency_oxygen/engi
			if(mob_species != /datum/species/lizard)
				shoes = /obj/item/clothing/shoes/workboots/mining
			gloves = /obj/item/clothing/gloves/color/black
			mask = /obj/item/clothing/mask/gas/explorer
			if(prob(45))
				glasses = /obj/item/clothing/glasses/meson
			if(prob(20))
				suit = pickweight(list(
					/obj/item/clothing/suit/hooded/explorer = 18,
					/obj/item/clothing/suit/hooded/cloak/goliath = 2
					)
				)
			if(prob(30))
				r_pocket = pickweight(list(
					/obj/item/stack/marker_beacon = 20,
					/obj/item/spacecash/bundle/mediumrand = 7,
					/obj/item/reagent_containers/hypospray/medipen/survival = 2,
					/obj/item/borg/upgrade/modkit/damage = 1
					)
				)
			if(prob(10))
				l_pocket = pickweight(list(
					/obj/item/spacecash/bundle/mediumrand = 7,
					/obj/item/reagent_containers/hypospray/medipen/survival = 2,
					/obj/item/borg/upgrade/modkit/cooldown = 1
					)
				)
			if(prob(95))
				back = /obj/item/storage/backpack/explorer
				backpack_contents = list(/obj/item/radio)
				if(prob(70))
					backpack_contents += pickweight(list(
						/obj/item/borg/upgrade/modkit/damage = 1,
						/obj/item/borg/upgrade/modkit/trigger_guard = 1,
						/obj/item/soap/nanotrasen = 1,
						/obj/item/wormhole_jaunter = 1,
						/obj/item/fulton_core = 1,
						/obj/item/extraction_pack = 2,
						/obj/item/stack/sheet/animalhide/goliath_hide = 3,
						/obj/item/hivelordstabilizer = 2,
						/obj/item/stack/marker_beacon/ten = 2,
						/obj/item/mining_scanner = 2,
						/obj/item/extinguisher/mini = 2,
						/obj/item/kitchen/knife/combat/survival = 3,
						/obj/item/flashlight/seclite=3,
						/obj/item/stack/sheet/sinew = 3,
						/obj/item/stack/sheet/bone = 3
						)
					)
				if(prob(70))
					backpack_contents += pickweight(list(
						/obj/item/borg/upgrade/modkit/damage = 1,
						/obj/item/borg/upgrade/modkit/trigger_guard = 1,
						/obj/item/soap/nanotrasen = 1,
						/obj/item/wormhole_jaunter = 1,
						/obj/item/fulton_core = 1,
						/obj/item/extraction_pack = 2,
						/obj/item/stack/sheet/animalhide/goliath_hide = 3,
						/obj/item/hivelordstabilizer = 2,
						/obj/item/stack/marker_beacon/ten = 2,
						/obj/item/mining_scanner = 2,
						/obj/item/extinguisher/mini = 2,
						/obj/item/kitchen/knife/combat/survival = 3,
						/obj/item/flashlight/seclite = 3,
						/obj/item/stack/sheet/sinew = 3,
						/obj/item/stack/sheet/bone = 3
						)
					)
				if(prob(70))
					backpack_contents += pickweight(list(
						/obj/item/borg/upgrade/modkit/damage = 1,
						/obj/item/borg/upgrade/modkit/trigger_guard = 1,
						/obj/item/soap/nanotrasen = 1,
						/obj/item/wormhole_jaunter = 1,
						/obj/item/fulton_core = 1,
						/obj/item/extraction_pack = 2,
						/obj/item/stack/sheet/animalhide/goliath_hide = 3,
						/obj/item/hivelordstabilizer = 2,
						/obj/item/stack/marker_beacon/ten = 2,
						/obj/item/mining_scanner = 2,
						/obj/item/extinguisher/mini = 2,
						/obj/item/kitchen/knife/combat/survival = 3,
						/obj/item/flashlight/seclite = 3,
						/obj/item/stack/sheet/sinew = 3,
						/obj/item/stack/sheet/bone = 3
						)
					)
				if(prob(30))
					backpack_contents += list(
						/obj/item/reagent_containers/hypospray/medipen/survival = pickweight(list(
							1 = 3,
							2 = 2,
							3 = 1
							)
						)
					)
				if(prob(30))
					backpack_contents += /obj/item/gun/energy/kinetic_accelerator
			else
				back = /obj/item/kinetic_crusher
		if("Oldminer")
			suit = /obj/item/clothing/suit/hooded/explorer/old
			mask = /obj/item/clothing/mask/gas/explorer/old
			if(prob(95))
				glasses = /obj/item/clothing/glasses/meson
			else
				glasses = /obj/item/clothing/glasses/meson/night
			suit_store = /obj/item/tank/internals/oxygen
			gloves = /obj/item/clothing/gloves/explorer/old
			uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland/old
			if(prob(85))
				back = /obj/item/storage/backpack/explorer //someone could totally make these backpacks a subtype and just have them be there. It'd cut down this file size a bit.
				backpack_contents = list()
				if(prob(70))
					backpack_contents += pickweight(list(
						/obj/item/borg/upgrade/modkit/damage = 1,
						/obj/item/borg/upgrade/modkit/trigger_guard = 1,
						/obj/item/soap/nanotrasen = 1,
						/obj/item/wormhole_jaunter = 1,
						/obj/item/fulton_core = 1,
						/obj/item/extraction_pack = 2,
						/obj/item/stack/sheet/animalhide/goliath_hide = 3,
						/obj/item/hivelordstabilizer = 2,
						/obj/item/stack/marker_beacon/ten = 2,
						/obj/item/mining_scanner = 2,
						/obj/item/extinguisher/mini = 2,
						/obj/item/kitchen/knife/combat/survival = 3,
						/obj/item/flashlight/seclite=3,
						/obj/item/stack/sheet/sinew = 3,
						/obj/item/stack/sheet/bone = 3
						)
					)
				if(prob(70))
					backpack_contents += pickweight(list(
						/obj/item/borg/upgrade/modkit/damage = 1,
						/obj/item/borg/upgrade/modkit/trigger_guard = 1,
						/obj/item/soap/nanotrasen = 1,
						/obj/item/wormhole_jaunter = 1,
						/obj/item/fulton_core = 1,
						/obj/item/extraction_pack = 2,
						/obj/item/stack/sheet/animalhide/goliath_hide = 3,
						/obj/item/hivelordstabilizer = 2,
						/obj/item/stack/marker_beacon/ten = 2,
						/obj/item/mining_scanner = 2,
						/obj/item/extinguisher/mini = 2,
						/obj/item/kitchen/knife/combat/survival = 3,
						/obj/item/flashlight/seclite=3,
						/obj/item/stack/sheet/sinew = 3,
						/obj/item/stack/sheet/bone = 3
						)
					)
				if(prob(70))
					backpack_contents += pickweight(list(
						/obj/item/borg/upgrade/modkit/damage = 1,
						/obj/item/borg/upgrade/modkit/trigger_guard = 1,
						/obj/item/soap/nanotrasen = 1,
						/obj/item/wormhole_jaunter = 1,
						/obj/item/fulton_core = 1,
						/obj/item/extraction_pack = 2,
						/obj/item/stack/sheet/animalhide/goliath_hide = 3,
						/obj/item/hivelordstabilizer = 2,
						/obj/item/stack/marker_beacon/ten = 2,
						/obj/item/mining_scanner = 2,
						/obj/item/extinguisher/mini = 2,
						/obj/item/kitchen/knife/combat/survival = 3,
						/obj/item/flashlight/seclite=3,
						/obj/item/stack/sheet/sinew = 3,
						/obj/item/stack/sheet/bone = 3
						)
					)
				if(prob(30))
					backpack_contents += list(
						/obj/item/reagent_containers/hypospray/medipen/survival = pickweight(list(
							1 = 3,
							2 = 2,
							3 = 1
							)
						)
					)
				if(prob(30))
					backpack_contents += /obj/item/gun/energy/kinetic_accelerator/old
			else
				back = /obj/item/kinetic_crusher/old
			if(prob(30))
				belt = /obj/item/storage/belt/mining/alt
			if(prob(30))
				r_pocket = pickweight(list(
					/obj/item/stack/marker_beacon = 20,
					/obj/item/spacecash/bundle/mediumrand = 7,
					/obj/item/reagent_containers/hypospray/medipen/survival = 2,
					/obj/item/borg/upgrade/modkit/damage = 1
					)
				)
			if(prob(30))
				l_pocket = pickweight(list(
					/obj/item/spacecash/bundle/mediumrand = 5,
					/obj/item/reagent_containers/hypospray/medipen/survival = 2,
					/obj/item/borg/upgrade/modkit/cooldown = 1
					)
				)
		if("Ashwalker")
			mob_species = /datum/species/lizard/ashwalker
			uniform = /obj/item/clothing/under/costume/gladiator/ash_walker
			if(prob(95))
				head = /obj/item/clothing/head/helmet/gladiator
			else
				head = /obj/item/clothing/head/helmet/skull
				suit = /obj/item/clothing/suit/armor/bone
				gloves = /obj/item/clothing/gloves/bracer
			if(prob(45))
				back = pickweight(list(
					/obj/item/spear/bonespear = 3,
					/obj/item/fireaxe/boneaxe = 2
					)
				)
			if(prob(10))
				belt = /obj/item/storage/belt/mining/primitive
			if(prob(30))
				r_pocket = /obj/item/restraints/legcuffs/bola/watcher
			if(prob(30))
				l_pocket = /obj/item/kitchen/knife/combat/bone
		if("Soldier")
			mob_species = /datum/species/human
			if(prob(90))
				uniform = /obj/item/clothing/under/solgov
				suit = /obj/item/clothing/suit/armor/vest/bulletproof/solgov
				shoes = /obj/item/clothing/shoes/jackboots
				gloves = /obj/item/clothing/gloves/color/black
				mask = /obj/item/clothing/mask/gas/sechailer
				head = /obj/item/clothing/head/solgov/sonnensoldner
				id = /obj/item/card/id/solgov
			else
				uniform = /obj/item/clothing/under/solgov
				suit = /obj/item/clothing/suit/space/hardsuit/solgov
				shoes = /obj/item/clothing/shoes/combat
				gloves = /obj/item/clothing/gloves/combat
				mask = /obj/item/clothing/mask/gas/sechailer/swat
				id = /obj/item/card/id/solgov
			if(prob(85))
				back = /obj/item/storage/backpack
				backpack_contents = list()
				if(prob(75))
					backpack_contents += pickweight(list(
						/obj/item/reagent_containers/hypospray/medipen/stimpack/traitor = 1,
						/obj/item/storage/firstaid/tactical = 1,
						/obj/item/gun/ballistic/automatic/pistol/solgov = 1,
						/obj/item/gps = 1,
						/obj/item/stock_parts/cell/gun/upgraded = 2,
						/obj/item/ammo_box/magazine/pistol556mm = 3,
						/obj/item/desk_flag/solgov = 3,
						/obj/item/stack/marker_beacon/ten = 3,
						/obj/item/detective_scanner = 2,
						/obj/item/extinguisher/mini = 3,
						/obj/item/kitchen/knife/combat = 3,
						/obj/item/flashlight/seclite=3,
						/obj/item/ammo_casing/shotgun = 3,
						/obj/item/binoculars = 3,
						/obj/item/clipboard = 3
						)
					)
				if(prob(75))
					backpack_contents += pickweight(list(
						/obj/item/reagent_containers/hypospray/medipen/stimpack/traitor = 1,
						/obj/item/storage/firstaid/tactical = 1,
						/obj/item/gun/ballistic/automatic/pistol/solgov = 1,
						/obj/item/gps = 1,
						/obj/item/stock_parts/cell/gun/upgraded = 2,
						/obj/item/ammo_box/magazine/pistol556mm = 3,
						/obj/item/desk_flag/solgov = 3,
						/obj/item/stack/marker_beacon/ten = 3,
						/obj/item/detective_scanner = 2,
						/obj/item/extinguisher/mini = 3,
						/obj/item/kitchen/knife/combat = 3,
						/obj/item/flashlight/seclite=3,
						/obj/item/ammo_casing/shotgun = 3,
						/obj/item/binoculars = 3,
						/obj/item/clipboard = 3
						)
					)
				if(prob(75))
					backpack_contents += pickweight(list(
						/obj/item/reagent_containers/hypospray/medipen/stimpack/traitor = 1,
						/obj/item/storage/firstaid/tactical = 1,
						/obj/item/gun/ballistic/automatic/pistol/solgov = 1,
						/obj/item/gps = 1,
						/obj/item/stock_parts/cell/gun/upgraded = 2,
						/obj/item/ammo_box/magazine/pistol556mm = 3,
						/obj/item/desk_flag/solgov = 3,
						/obj/item/stack/marker_beacon/ten = 3,
						/obj/item/detective_scanner = 2,
						/obj/item/extinguisher/mini = 3,
						/obj/item/kitchen/knife/combat = 3,
						/obj/item/flashlight/seclite=3,
						/obj/item/ammo_casing/shotgun = 3,
						/obj/item/binoculars = 3,
						/obj/item/clipboard = 3
						)
					)
			else
				back = pickweight(list(
					/obj/item/energyhalberd = 5,
					/obj/item/gun/ballistic/rocketlauncher/unrestricted = 5
					)
				)
			if(prob(25))
				belt = /obj/item/storage/belt/military
			if(prob(50))
				r_pocket = pickweight(list(
					/obj/item/reagent_containers/hypospray/medipen/stimpack = 1,
					/obj/item/kitchen/knife/letter_opener = 3,
					/obj/item/radio/off = 3,
					/obj/item/grenade/syndieminibomb/concussion = 1,
					/obj/item/melee/transforming/energy/ctf/solgov = 1
					)
				)
			if(prob(50))
				l_pocket = pickweight(list(
					/obj/item/reagent_containers/hypospray/medipen/stimpack = 1,
					/obj/item/kitchen/knife/letter_opener = 3,
					/obj/item/radio/off = 3,
					/obj/item/grenade/syndieminibomb/concussion = 1,
					/obj/item/melee/transforming/energy/ctf/solgov = 1
					)
				)
			if(prob(70))
				glasses = pickweight(list(
					/obj/item/clothing/glasses/sunglasses = 3,
					/obj/item/clothing/glasses/hud/health = 3,
					/obj/item/clothing/glasses/hud/health/night = 1,
					/obj/item/clothing/glasses/night = 2
					)
				)
		if("Kobold")
			mob_species = /datum/species/lizard/ashwalker/kobold
			uniform = /obj/item/clothing/under/costume/gladiator/ash_walker
			if(prob(95))
				head = /obj/item/clothing/head/helmet/gladiator
			else
				head = /obj/item/clothing/head/helmet/skull
				suit = /obj/item/clothing/suit/armor/bone
				gloves = /obj/item/clothing/gloves/bracer
			if(prob(5))
				back = pickweight(list(
					/obj/item/spear/bonespear = 3,
					/obj/item/fireaxe/boneaxe = 2
					)
				)
			if(prob(10))
				belt = /obj/item/storage/belt/mining/primitive
			if(prob(30))
				r_pocket = /obj/item/kitchen/knife/combat/bone
			if(prob(30))
				l_pocket = /obj/item/kitchen/knife/combat/bone
		if("Golem")
			mob_species = pickweight(list(
				/datum/species/golem/adamantine = 5,
				/datum/species/golem/plasma = 10,
				/datum/species/golem/diamond = 10,
				/datum/species/golem/gold = 10,
				/datum/species/golem/silver = 10,
				/datum/species/golem/plasteel = 10,
				/datum/species/golem/titanium = 10,
				/datum/species/golem/plastitanium = 10
				)
			)
			if(prob(70))
				back = /obj/item/storage/backpack
				backpack_contents = list()
				if(prob(75))
					backpack_contents += pickweight(list(
						/obj/item/slime_extract/grey = 1,
						/obj/item/slime_scanner = 1,
						/obj/item/resonator/upgraded = 1,
						/obj/item/gps = 1,
						/obj/item/fulton_core = 2,
						/obj/item/extraction_pack = 3,
						/obj/item/stack/sheet/mineral/plasma/twenty = 3,
						/obj/item/stack/marker_beacon/ten = 3,
						/obj/item/mining_scanner = 2,
						/obj/item/extinguisher/mini = 3,
						/obj/item/flashlight/seclite=3,
						/obj/item/research_notes/loot/medium = 3,
						/obj/item/stack/sheet/metal/fifty = 3,
						/obj/item/research_notes/loot/big = 1
						)
					)
				if(prob(75))
					backpack_contents += pickweight(list(
						/obj/item/slime_extract/grey = 1,
						/obj/item/slime_scanner = 1,
						/obj/item/resonator/upgraded = 1,
						/obj/item/gps = 1,
						/obj/item/fulton_core = 2,
						/obj/item/extraction_pack = 3,
						/obj/item/stack/sheet/mineral/plasma/twenty = 3,
						/obj/item/stack/marker_beacon/ten = 3,
						/obj/item/mining_scanner = 2,
						/obj/item/extinguisher/mini = 3,
						/obj/item/flashlight/seclite=3,
						/obj/item/research_notes/loot/medium = 3,
						/obj/item/stack/sheet/metal/fifty = 3,
						/obj/item/research_notes/loot/big = 1
						)
					)
				if(prob(75))
					backpack_contents += pickweight(list(
						/obj/item/slime_extract/grey = 1,
						/obj/item/slime_scanner = 1,
						/obj/item/resonator/upgraded = 1,
						/obj/item/gps = 1,
						/obj/item/fulton_core = 2,
						/obj/item/extraction_pack = 3,
						/obj/item/stack/sheet/mineral/plasma/twenty = 3,
						/obj/item/stack/marker_beacon/ten = 3,
						/obj/item/mining_scanner = 2,
						/obj/item/extinguisher/mini = 3,
						/obj/item/flashlight/seclite=3,
						/obj/item/research_notes/loot/medium = 3,
						/obj/item/stack/sheet/metal/fifty = 3,
						/obj/item/research_notes/loot/big = 1
						)
					)
				if(prob(3))
					backpack_contents += list(
					/obj/item/storage/box/rndboards
					)
				if(prob(20))
					backpack_contents += pickweight(list(
						/obj/item/storage/box/stockparts/basic = 4,
						/obj/item/storage/box/stockparts/t2 = 3,
						/obj/item/storage/box/stockparts/t3 = 2,
						/obj/item/storage/box/stockparts/deluxe = 1
						)
					)
			if(prob(30))
				glasses = pickweight(list(
					/obj/item/clothing/glasses/meson = 2,
					/obj/item/clothing/glasses/hud/health = 2,
					/obj/item/clothing/glasses/hud/diagnostic =2,
					/obj/item/clothing/glasses/science = 2,
					/obj/item/clothing/glasses/welding = 2,
					/obj/item/clothing/glasses/night = 1
				)
				)
			if(prob(10))
				belt = pickweight(list(
					/obj/item/storage/belt/mining/vendor,
					/obj/item/storage/belt/utility/full
					)
				)
			if(prob(50))
				neck = /obj/item/bedsheet/rd/royal_cape
			if(prob(10))
				l_pocket = pickweight(list(
					/obj/item/crowbar/power,
					/obj/item/screwdriver/power,
					/obj/item/weldingtool/experimental
					)
				)
			if(prob(10))
				r_pocket = pickweight(list(
					/obj/item/crowbar/power,
					/obj/item/screwdriver/power,
					/obj/item/weldingtool/experimental
					)
				)
		if("YeOlde")
			mob_gender = FEMALE
			uniform = /obj/item/clothing/under/costume/maid
			gloves = /obj/item/clothing/gloves/color/white
			shoes = /obj/item/clothing/shoes/laceup
			head = /obj/item/clothing/head/helmet/knight
			suit = /obj/item/clothing/suit/armor/riot/knight
			back = /obj/item/shield/riot/buckler
			belt = /obj/item/nullrod/claymore
			r_pocket = /obj/item/tank/internals/emergency_oxygen
			mask = /obj/item/clothing/mask/breath
		if("Operative")
			id_job = "Operative"
			if(prob(15))
				outfit = /datum/outfit/syndicatestormtroopercorpse
			else
				outfit = /datum/outfit/syndicatecommandocorpse
		if("Waldo")//WE FINALLY FOUND HIM
			name = "Waldo"
			uniform = /obj/item/clothing/under/pants/jeans
			suit = /obj/item/clothing/suit/striped_sweater
			head = /obj/item/clothing/head/beanie/waldo
			shoes = /obj/item/clothing/shoes/sneakers/brown
			ears = /obj/item/radio/headset
			glasses = /obj/item/clothing/glasses/regular/circle
			back = /obj/item/storage/backpack/satchel/leather
			backpack_contents = list()
			if(prob(50))
				backpack_contents += pickweight(list(
					/obj/item/book/granter/spell/knock = 1,
					/obj/item/book/granter/spell/blind = 1,
					/obj/item/shadowcloak = 1,
					/obj/item/book/granter/spell/smoke = 2,
					/obj/item/reagent_containers/syringe/mulligan = 2,
					/obj/item/dice/d20 = 3,
					/obj/item/dice/d20/fate/stealth/one_use = 1,
					/obj/item/clothing/head/chameleon/broken = 3,
					/obj/item/stack/marker_beacon/ten = 3,
					/obj/item/grenade/smokebomb = 3,
					/obj/item/grenade/flashbang = 3
					)
				)
			if(prob(50))
				backpack_contents += pickweight(list(
					/obj/item/book/granter/spell/knock = 1,
					/obj/item/book/granter/spell/blind = 1,
					/obj/item/shadowcloak = 1,
					/obj/item/book/granter/spell/smoke = 2,
					/obj/item/reagent_containers/syringe/mulligan = 2,
					/obj/item/dice/d20/fate/stealth/one_use = 1,
					/obj/item/dice/d20 = 3,
					/obj/item/clothing/head/chameleon/broken = 3,
					/obj/item/stack/marker_beacon/ten = 3,
					/obj/item/grenade/smokebomb = 3,
					/obj/item/grenade/flashbang = 3
					)
				)
			if(prob(50))
				backpack_contents += pickweight(list(
					/obj/item/book/granter/spell/knock = 1,
					/obj/item/book/granter/spell/blind = 1,
					/obj/item/shadowcloak = 1,
					/obj/item/book/granter/spell/smoke = 2,
					/obj/item/reagent_containers/syringe/mulligan = 2,
					/obj/item/dice/d20/fate/stealth/one_use = 1,
					/obj/item/clothing/head/chameleon/broken = 3,
					/obj/item/stack/marker_beacon/ten = 3,
					/obj/item/grenade/smokebomb = 3,
					/obj/item/grenade/flashbang = 3
					)
				)
			if(prob(25))
				r_pocket = pickweight(list(
					/obj/item/chameleon,
					/obj/item/dnainjector/chameleonmut = 1,
					/obj/item/flashlight/flashdark = 1
					)
				)
			if(prob(25))
				l_pocket = pickweight(list(
					/obj/item/chameleon,
					/obj/item/dnainjector/chameleonmut = 1,
					/obj/item/flashlight/flashdark = 1
					)
				)
		if("Shadow")
			mob_species = /datum/species/shadow
			r_pocket = /obj/item/reagent_containers/pill/shadowtoxin
			neck = /obj/item/clothing/accessory/medal/plasma/nobel_science
			uniform = /obj/item/clothing/under/color/black
			shoes = /obj/item/clothing/shoes/sneakers/black
			suit = /obj/item/clothing/suit/toggle/labcoat
			glasses = /obj/item/clothing/glasses/blindfold
			back = /obj/item/tank/internals/oxygen
			mask = /obj/item/clothing/mask/breath
		if("Cultist")
			uniform = /obj/item/clothing/under/costume/roman
			suit = /obj/item/clothing/suit/hooded/cultrobes
			suit_store = /obj/item/tome
			r_pocket = /obj/item/restraints/legcuffs/bola/cult
			l_pocket = /obj/item/melee/cultblade/dagger
			glasses =  /obj/item/clothing/glasses/hud/health/night/cultblind
			back = /obj/item/storage/backpack/cultpack
			backpack_contents = list(
				/obj/item/reagent_containers/glass/beaker/unholywater = 1,
				/obj/item/cult_shift = 1,
				/obj/item/flashlight/flare/culttorch = 1,
				/obj/item/stack/sheet/runed_metal = 15
			)
		if("SRM")
			uniform = /obj/item/clothing/under/suit/roumain
			shoes = /obj/item/clothing/shoes/workboots/mining
			if(prob(50))
				suit = /obj/item/clothing/suit/armor/roumain/shadow
				head = /obj/item/clothing/head/cowboy/sec/roumain/shadow
			else
				suit = /obj/item/clothing/suit/armor/roumain
				head = /obj/item/clothing/head/cowboy/sec/roumain
			if(prob(25))
				suit_store = /obj/item/gun/ballistic/shotgun/winchester/lethal
			r_pocket = /obj/item/book/manual/trickwines_4_brewers
			belt = pick(list(/obj/item/kitchen/knife/hunting = 1, /obj/item/gun/ballistic/derringer = 1))
			back = /obj/item/storage/backpack/cultpack
			backpack_contents = list()
			if(prob(75))
				backpack_contents += list(/obj/item/ammo_box/c38_box/hunting = 1)
			if(prob(75))
				backpack_contents += list(pick(/obj/item/reagent_containers/food/drinks/drinkingglass/breakawayflask/vintageash, /obj/item/reagent_containers/food/drinks/drinkingglass/breakawayflask/vintageice, /obj/item/reagent_containers/food/drinks/drinkingglass/breakawayflask/vintageshock) = 1)
	. = ..()
