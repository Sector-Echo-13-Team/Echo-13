/* Mining Points Equipment Vendor */
/obj/machinery/vending/mining_equipment
	name = "frontier equipment vendor"
	desc = "An equipment vendor for miners, prospectors, and all manner of far reach scroungers. Ore Redemption Points can be spent here to purchase rough-and-tumble goods. Sold by EXOCON."
	icon_state = "mining"
	icon_deny = "mining-deny"
	max_integrity = 500 // A bit more durable than your average snack vendor
	integrity_failure = 0.15
	armor = list("melee" = 25, "bullet" = 10, "laser" = 5, "energy" = 5, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 70)
	tiltable = FALSE
	shoot_inventory_chance = 0
	circuit = /obj/item/circuitboard/machine/vending/mining_equipment
	refill_canister = /obj/item/vending_refill/mining_equipment
	payment_department = ACCOUNT_CAR
	vend_ready = "Good luck, you're going to need it."
	mining_point_vendor = TRUE
	default_price = 100
	extra_price = 200
	all_items_free = FALSE
	// Mining products are handled differently, because I am too lazy to convert this list stolen from the old vendor.
	products = list( //if you add something to this, please, for the love of god, sort it by price/type. use tabs and not spaces.
		/obj/item/stack/marker_beacon/thirty = 6,
		/obj/item/reagent_containers/food/drinks/bottle/whiskey = 3,
		/obj/item/storage/box/gum/bubblegum = 5,
		/obj/item/clothing/mask/cigarette/cigar/havana = 3,
		/obj/item/soap/nanotrasen = 1,
		/obj/item/hivelordstabilizer = 6,
		/obj/item/fulton_core = 1,
		/obj/item/survivalcapsule = 3,
		/obj/item/storage/belt/mining = 3,
		/obj/item/card/mining_point_card = 5,
		/obj/item/reagent_containers/hypospray/medipen/survival = 6,
		/obj/item/storage/firstaid/brute = 3,
		/obj/item/storage/box/minertracker = 5,
		/obj/item/wormhole_jaunter = 3,
		/obj/item/kinetic_crusher = 1,
		/obj/item/gun/energy/kinetic_accelerator = 3,
		/obj/item/resonator = 3,
		/obj/item/extraction_pack = 3,
		/obj/item/lazarus_injector = 1,
		/obj/item/pickaxe/silver = 3,
		/obj/item/storage/backpack/duffelbag/mining_conscript = 3,
		/obj/item/tank/jetpack/suit = 3,
		/obj/item/spacecash/bundle/c1000 = 5,
		/obj/item/clothing/suit/space/hardsuit/mining/independent = 3,
		/obj/item/resonator/upgraded = 1,
		/obj/item/clothing/shoes/bhop = 3,
		/obj/item/survivalcapsule/luxury = 3,
		/mob/living/simple_animal/hostile/mining_drone = 3,
		/obj/item/mine_bot_upgrade = 3,
		/obj/item/mine_bot_upgrade/health = 3,
		/obj/item/borg/upgrade/modkit/cooldown/minebot = 3,
		/obj/item/slimepotion/slime/sentience/mining = 1,
		/obj/item/borg/upgrade/modkit/minebot_passthrough = 3,
		/obj/item/borg/upgrade/modkit/tracer = 3,
		/obj/item/borg/upgrade/modkit/tracer/adjustable = 3,
		/obj/item/borg/upgrade/modkit/chassis_mod = 3,
		/obj/item/borg/upgrade/modkit/range = 3,
		/obj/item/borg/upgrade/modkit/damage = 3,
		/obj/item/borg/upgrade/modkit/cooldown = 3,
		/obj/item/borg/upgrade/modkit/aoe/mobs = 2
	)
	premium = list(
		/obj/item/reagent_containers/food/drinks/bottle/absinthe/premium = 3,
		/obj/item/laser_pointer = 1,
		/obj/item/pickaxe/diamond = 1,
		/mob/living/simple_animal/hostile/facehugger/toy = 1,
		/obj/item/clothing/glasses/meson/gar = 2,
		/obj/item/survivalcapsule/luxuryelite = 1,
	)

	var/voucher_items = list(
		"Survival Capsule and Explorer's Webbing" = /obj/item/storage/belt/mining/vendor,
		"Resonator Kit" = /obj/item/resonator,
		"Minebot Kit" = /mob/living/simple_animal/hostile/mining_drone,
		"Extraction and Rescue Kit" = /obj/item/extraction_pack,
		"Crusher Kit" = /obj/item/kinetic_crusher,
		"Mining Conscription Kit" = /obj/item/storage/backpack/duffelbag/mining_conscript,
		)

/obj/machinery/vending/mining_equipment/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/mining_voucher))
		RedeemVoucher(I, user)
		return
	return ..()

/obj/machinery/vending/mining_equipment/freebie(mob/fatty, freebies)
	message_admins("proc freebie was called on [src] which should never happen. I am causing a runtime to print the stack trace. inform a maintainer")
	CRASH("freebie called on [src]")

/obj/machinery/vending/mining_equipment/proc/RedeemVoucher(obj/item/mining_voucher/voucher, mob/redeemer)
	var/selection = show_radial_menu(redeemer, src, voucher_items, require_near = TRUE, tooltips = TRUE)
	if(!selection || !Adjacent(redeemer) || QDELETED(voucher) || voucher.loc != redeemer)
		return
	if(voucher_items[selection])
		var/drop_location = drop_location()
		switch(selection)
			if("Survival Capsule and Explorer's Webbing")
				new /obj/item/storage/belt/mining/vendor(drop_location)
			if("Resonator Kit")
				new /obj/item/extinguisher/mini(drop_location)
				new /obj/item/resonator(drop_location)
			if("Minebot Kit")
				new /mob/living/simple_animal/hostile/mining_drone(drop_location)
				new /obj/item/weldingtool/hugetank(drop_location)
				new /obj/item/clothing/head/welding(drop_location)
				new /obj/item/borg/upgrade/modkit/minebot_passthrough(drop_location)
			if("Extraction and Rescue Kit")
				new /obj/item/extraction_pack(drop_location)
				new /obj/item/fulton_core(drop_location)
				new /obj/item/stack/marker_beacon/thirty(drop_location)
			if("Crusher Kit")
				new /obj/item/extinguisher/mini(drop_location)
				new /obj/item/kinetic_crusher(drop_location)
			if("Mining Conscription Kit")
				new /obj/item/storage/backpack/duffelbag/mining_conscript(drop_location)

	SSblackbox.record_feedback("tally", "mining_voucher_redeemed", 1, selection)
	qdel(voucher)

/obj/item/circuitboard/machine/vending/mining_equipment
	name = "mining equipment vendor (Machine Board)"
	build_path = /obj/machinery/vending/mining_equipment
	req_components = list(
		/obj/item/stack/sheet/rglass = 1,
		/obj/item/vending_refill/mining_equipment = 1)

/obj/item/circuitboard/machine/vending/mining_equipment/golem
	name = "golem equipment vendor (Machine Board)"
	build_path = /obj/machinery/vending/mining_equipment/golem

/obj/item/vending_refill/mining_equipment
	machine_name = "mining equipment vendor"
	icon_state = "mining-refill"

/obj/item/vending_refill/mining_equipment_golem
	machine_name = "golem equipment vendor"
	icon_state = "mining-refill"


/obj/machinery/vending/mining_equipment/golem
	name = "golem equipment vendor"
	desc = "An modified equipment vendor which appears to be a prototype of the current mining equipment vendor. Ore Redemption Points can be spent here to purchase rough-and-tumble goods."
	circuit = /obj/item/circuitboard/machine/vending/mining_equipment
	refill_canister = /obj/item/vending_refill/mining_equipment_golem
	products = list( //if you add something to this, please, for the love of god, sort it by price/type. use tabs and not spaces.
		/obj/item/stack/marker_beacon/thirty = 6,
		/obj/item/reagent_containers/food/drinks/bottle/whiskey = 3,
		/obj/item/storage/box/gum/bubblegum = 5,
		/obj/item/clothing/mask/cigarette/cigar/havana = 3,
		/obj/item/soap/nanotrasen = 1,
		/obj/item/hivelordstabilizer = 6,
		/obj/item/fulton_core = 1,
		/obj/item/survivalcapsule = 3,
		/obj/item/storage/belt/mining = 3,
		/obj/item/card/mining_point_card = 5,
		/obj/item/reagent_containers/hypospray/medipen/survival = 6,
		/obj/item/storage/firstaid/brute = 3,
		/obj/item/storage/box/minertracker = 5,
		/obj/item/wormhole_jaunter = 3,
		/obj/item/kinetic_crusher = 1,
		/obj/item/gun/energy/kinetic_accelerator = 3,
		/obj/item/mining_scanner = 5,
		/obj/item/t_scanner/adv_mining_scanner = 2,
		/obj/item/resonator = 3,
		/obj/item/extraction_pack = 3,
		/obj/item/lazarus_injector = 1,
		/obj/item/pickaxe/silver = 3,
		/obj/item/storage/backpack/duffelbag/mining_conscript = 3,
		/obj/item/tank/jetpack/suit = 3,
		/obj/item/spacecash/bundle/c1000 = 5,
		/obj/item/clothing/suit/space/hardsuit/mining/independent = 3,
		/obj/item/resonator/upgraded = 1,
		/obj/item/clothing/shoes/bhop = 3,
		/obj/item/survivalcapsule/luxury = 3,
		/mob/living/simple_animal/hostile/mining_drone = 3,
		/obj/item/mine_bot_upgrade = 3,
		/obj/item/mine_bot_upgrade/health = 3,
		/obj/item/borg/upgrade/modkit/cooldown/minebot = 3,
		/obj/item/slimepotion/slime/sentience/mining = 1,
		/obj/item/borg/upgrade/modkit/minebot_passthrough = 3,
		/obj/item/borg/upgrade/modkit/tracer = 3,
		/obj/item/borg/upgrade/modkit/tracer/adjustable = 3,
		/obj/item/borg/upgrade/modkit/chassis_mod = 3,
		/obj/item/borg/upgrade/modkit/range = 3,
		/obj/item/borg/upgrade/modkit/damage = 3,
		/obj/item/borg/upgrade/modkit/cooldown = 3,
		/obj/item/borg/upgrade/modkit/aoe/mobs = 2,
		// golem extra things
		/obj/item/card/id/mining = 5,
		/obj/item/clothing/glasses/science = 5,
		/obj/item/reagent_containers/food/snacks/monkeycube = 5,
		/obj/item/storage/belt/utility = 3,
		/obj/item/bedsheet/rd/royal_cape = 3,
		/obj/item/slime_extract/grey = 1,
		/obj/item/borg/upgrade/modkit/trigger_guard = 4,
		/obj/item/storage/box/rndboards = 1

	)

/**********************Mining Equipment Voucher**********************/

/obj/item/mining_voucher
	name = "mining voucher"
	desc = "A token used by EXOCOM associates to redeem a piece of free starter equipment. Use it on a mining equipment vendor."
	icon = 'icons/obj/mining.dmi'
	icon_state = "mining_voucher"
	w_class = WEIGHT_CLASS_TINY

/**********************Mining Point Card**********************/

/obj/item/card/mining_point_card
	name = "mining points card"
	desc = "A small card preloaded with mining points. Swipe your ID card over it to transfer the points, then discard."
	icon_state = "data_1"
	custom_price = 500
	var/points = 500

/obj/item/card/mining_point_card/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/card/id))
		if(points)
			var/obj/item/card/id/C = I
			C.mining_points += points
			to_chat(user, "<span class='info'>You transfer [points] points to [C].</span>")
			points = 0
		else
			to_chat(user, "<span class='alert'>There's no points left on [src].</span>")
	..()

/obj/item/card/mining_point_card/examine(mob/user)
	. = ..()
	. += "<span class='alert'>There's [points] point\s on the card.</span>"

///Conscript kit
/obj/item/card/mining_access_card
	name = "mining access card"
	desc = "A small card, that when used on any ID, will add mining access."
	icon_state = "data_1"

/obj/item/card/mining_access_card/afterattack(atom/movable/AM, mob/user, proximity)
	. = ..()
	if(istype(AM, /obj/item/card/id) && proximity)
		var/obj/item/card/id/I = AM
		I.access |=	ACCESS_MINING
		I.access |= ACCESS_MINING_STATION
		I.access |= ACCESS_MECH_MINING
		I.access |= ACCESS_MINERAL_STOREROOM
		I.access |= ACCESS_CARGO
		to_chat(user, "<span class='notice'>You upgrade [I] with mining access.</span>")
		qdel(src)

/obj/item/storage/backpack/duffelbag/mining_conscript
	name = "EXOCOM rapid deployment kit"
	desc = "A kit containing everything an aspiring explorer needs to start up a local operation."
	custom_price = 1500

/obj/item/storage/backpack/duffelbag/mining_conscript/PopulateContents()
	new /obj/item/clothing/glasses/meson(src)
	new /obj/item/mining_scanner(src)
	new /obj/item/storage/bag/ore(src)
	new /obj/item/clothing/suit/hooded/explorer(src)
	new /obj/item/clothing/mask/gas/explorer(src)
	new /obj/item/card/mining_access_card(src)
	new /obj/item/gun/energy/kinetic_accelerator(src)
	new /obj/item/kitchen/knife/combat/survival(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/gloves/explorer(src)
