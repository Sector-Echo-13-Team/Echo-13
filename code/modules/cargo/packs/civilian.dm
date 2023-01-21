/datum/supply_pack/civilian
	group = "Civilian & Decoration"

/*
		Janitorial
*/

/datum/supply_pack/civilian/janitor
	name = "Janitorial Supplies Crate"
	desc = "Fight back against dirt and grime with these janitorial essentials. Contains three buckets, caution signs, and cleaner grenades. Also has a single mop, broom, spray cleaner, rag, and trash bag."
	cost = 1000
	contains = list(/obj/item/reagent_containers/glass/bucket,
					/obj/item/reagent_containers/glass/bucket,
					/obj/item/reagent_containers/glass/bucket,
					/obj/item/mop,
					/obj/item/pushbroom,
					/obj/item/clothing/suit/caution,
					/obj/item/clothing/suit/caution,
					/obj/item/clothing/suit/caution,
					/obj/item/storage/bag/trash,
					/obj/item/reagent_containers/spray/cleaner,
					/obj/item/reagent_containers/glass/rag,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner,
					/obj/item/grenade/chem_grenade/cleaner)
	crate_name = "janitorial supplies crate"

/datum/supply_pack/civilian/janitank
	name = "Janitor Backpack Crate"
	desc = "Call forth divine judgement upon dirt and grime with this high capacity janitor backpack. Contains 500 units of filth-cleansing space cleaner."
	cost = 1000
	contains = list(/obj/item/watertank/janitor)
	crate_name = "janitor backpack crate"

/datum/supply_pack/civilian/janicart
	name = "Janitorial Cart and Galoshes Crate"
	desc = "The keystone to any successful janitor. As long as you have feet, this pair of galoshes will keep them firmly planted on the ground. Also contains a janitorial cart."
	cost = 2000
	contains = list(/obj/structure/janitorialcart,
					/obj/item/clothing/shoes/galoshes)
	crate_name = "janitorial cart crate"
	crate_type = /obj/structure/closet/crate/large

/datum/supply_pack/civilian/lawnmower
	name = "Lawnmower"
	desc = "Removing plant from your backyard now made easy with the brand new Donk! Co. TM Deluxe Lawnmower 3003."
	cost = 800
	contains = list(/obj/vehicle/ridden/lawnmower)
	crate_name = "Donk! Co. TM Deluxe Lawnmower 3003"
	crate_type = /obj/structure/closet/crate/large

/*
		Religious
*/

/datum/supply_pack/civilian/funeral
	name = "Funeral Supply crate"
	desc = "At the end of the day, someone's gonna want someone dead. Give them a proper send-off with these funeral supplies! Contains a coffin with burial garmets and flowers."
	cost = 500
	contains = list(/obj/item/clothing/under/misc/burial,
					/obj/item/reagent_containers/food/snacks/grown/harebell,
					/obj/item/reagent_containers/food/snacks/grown/poppy/geranium)
	crate_name = "coffin"
	crate_type = /obj/structure/closet/crate/coffin

/datum/supply_pack/civilian/religious_supplies
	name = "Religious Supplies Crate"
	desc = "Keep your local chaplain happy and well-supplied, lest they call down judgement upon your cargo bay. Contains two bottles of holywater, bibles, and burial garmets."
	cost = 3500	// it costs so much because the Space Church needs funding to build a cathedral
	contains = list(/obj/item/reagent_containers/food/drinks/bottle/holywater,
					/obj/item/reagent_containers/food/drinks/bottle/holywater,
					/obj/item/storage/book/bible/booze,
					/obj/item/storage/book/bible/booze,
					/obj/item/clothing/suit/hooded/chaplain_hoodie,
					/obj/item/clothing/suit/hooded/chaplain_hoodie)
	crate_name = "religious supplies crate"

/*
		Bundles
*/

/datum/supply_pack/civilian/book_crate
	name = "Book Crate"
	desc = "Surplus from the Nanotrasen Archives, these six books are sure to be good reads."
	cost = 500
	contains = list(/obj/item/book/manual/random,
					/obj/item/book/manual/random,
					/obj/item/book/manual/random,
					/obj/item/book/random,
					/obj/item/book/random,
					/obj/item/book/random)
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/civilian/fountainpens
	name = "Calligraphy Crate"
	desc = "Sign death warrants in style with these seven executive fountain pens."
	cost = 700
	contains = list(/obj/item/storage/box/fountainpens)
	crate_name = "calligraphy crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/civilian/wrapping_paper
	name = "Festive Wrapping Paper Crate"
	desc = "Want to mail your loved ones gift-wrapped chocolates, stuffed animals, the Clown's severed head? You can do all that, with this crate full of wrapping paper."
	cost = 1000
	contains = list(/obj/item/stack/wrapping_paper)
	crate_name = "festive wrapping paper crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/civilian/paper
	name = "Bureaucracy Crate"
	desc = "High stacks of papers on your desk Are a big problem - make it Pea-sized with these bureaucratic supplies! Contains six pens, some camera film, hand labeler supplies, a paper bin, a carbon paper bin, three folders, a laser pointer, two clipboards and two stamps."//that was too forced
	cost = 1000
	contains = list(/obj/structure/filingcabinet/chestdrawer/wheeled,
					/obj/item/camera_film,
					/obj/item/hand_labeler,
					/obj/item/hand_labeler_refill,
					/obj/item/hand_labeler_refill,
					/obj/item/paper_bin,
					/obj/item/paper_bin/carbon,
					/obj/item/pen/fourcolor,
					/obj/item/pen/fourcolor,
					/obj/item/pen,
					/obj/item/pen/fountain,
					/obj/item/pen/blue,
					/obj/item/pen/red,
					/obj/item/folder/blue,
					/obj/item/folder/red,
					/obj/item/folder/yellow,
					/obj/item/clipboard,
					/obj/item/clipboard,
					/obj/item/stamp,
					/obj/item/stamp/denied,
					/obj/item/laser_pointer/purple)
	crate_name = "bureaucracy crate"

/datum/supply_pack/civilian/forensics
	name = "Forensics Crate"
	desc = "Stay hot on the criminal's heels with Nanotrasen's Detective Essentials(tm). Contains a forensics scanner, six evidence bags, camera, tape recorder, white crayon, and of course, a fedora."
	cost = 2000
	contains = list(/obj/item/detective_scanner,
					/obj/item/storage/box/evidence,
					/obj/item/camera,
					/obj/item/taperecorder,
					/obj/item/toy/crayon/white,
					/obj/item/clothing/head/fedora/det_hat)
	crate_name = "forensics crate"

/datum/supply_pack/civilian/party
	name = "Party Equipment"
	desc = "Celebrate both life and death on the frontier with Nanotrasen's Party Essentials(tm)! Contains seven colored glowsticks, six beers, six sodas, two ales, and a bottle of patron, goldschlager, and shaker!"
	cost = 2500
	contains = list(/obj/item/storage/box/drinkingglasses,
					/obj/item/reagent_containers/food/drinks/shaker,
					/obj/item/reagent_containers/food/drinks/bottle/patron,
					/obj/item/reagent_containers/food/drinks/bottle/goldschlager,
					/obj/item/reagent_containers/food/drinks/ale,
					/obj/item/reagent_containers/food/drinks/ale,
					/obj/item/storage/cans/sixbeer,
					/obj/item/storage/cans/sixsoda,
					/obj/item/flashlight/glowstick,
					/obj/item/flashlight/glowstick/red,
					/obj/item/flashlight/glowstick/blue,
					/obj/item/flashlight/glowstick/cyan,
					/obj/item/flashlight/glowstick/orange,
					/obj/item/flashlight/glowstick/yellow,
					/obj/item/flashlight/glowstick/pink)
	crate_name = "party equipment crate"

/datum/supply_pack/civilian/bigband
	name = "Big Band Instrument Collection"
	desc = "Get your demoralized crew movin' and groovin' with this fine collection! Contains nine different instruments!"
	cost = 5000
	contains = list(/obj/item/instrument/violin,
					/obj/item/instrument/guitar,
					/obj/item/instrument/glockenspiel,
					/obj/item/instrument/accordion,
					/obj/item/instrument/saxophone,
					/obj/item/instrument/trombone,
					/obj/item/instrument/recorder,
					/obj/item/instrument/harmonica,
					/obj/structure/musician/piano/unanchored)
	crate_name = "big band musical instruments crate"
	crate_type = /obj/structure/closet/crate/wooden

/*
		Decoration / flooring
*/

/datum/supply_pack/civilian/potted_plants
	name = "Potted Plants Crate"
	desc = "Spruce up the ship with these lovely plants! Contains a random assortment of five potted plants from Nanotrasen's potted plant research division. Warranty void if thrown."
	cost = 700
	contains = list(/obj/item/kirbyplants/random,
					/obj/item/kirbyplants/random,
					/obj/item/kirbyplants/random,
					/obj/item/kirbyplants/random,
					/obj/item/kirbyplants/random)
	crate_name = "potted plants crate"

/datum/supply_pack/civilian/artsupply
	name = "Art Supplies"
	desc = "Make some happy little accidents with a rapid cable layer, three spraycans, and lots of crayons!"
	cost = 1000
	contains = list(/obj/item/rcl,
					/obj/item/storage/toolbox/artistic,
					/obj/item/toy/crayon/spraycan,
					/obj/item/toy/crayon/spraycan,
					/obj/item/toy/crayon/spraycan,
					/obj/item/storage/crayons,
					/obj/item/toy/crayon/white,
					/obj/item/toy/crayon/rainbow)
	crate_name = "art supply crate"
	crate_type = /obj/structure/closet/crate/wooden

/datum/supply_pack/civilian/carpet
	name = "Standard Carpet Crate"
	desc = "Plasteel floor tiles getting on your nerves? These stacks of extra soft carpet will tie any room together."
	cost = 1000
	contains = list(/obj/item/stack/tile/carpet/fifty,
					/obj/item/stack/tile/carpet/fifty,
					/obj/item/stack/tile/carpet/black/fifty,
					/obj/item/stack/tile/carpet/black/fifty)
	crate_name = "premium carpet crate"

/datum/supply_pack/civilian/carpet_exotic
	name = "Exotic Carpet Crate"
	desc = "Exotic carpets straight from Space Russia, for all your decorating needs. Contains 100 tiles each of 8 different flooring patterns."
	cost = 3000
	contains = list(/obj/item/stack/tile/carpet/blue/fifty,
					/obj/item/stack/tile/carpet/blue/fifty,
					/obj/item/stack/tile/carpet/cyan/fifty,
					/obj/item/stack/tile/carpet/cyan/fifty,
					/obj/item/stack/tile/carpet/green/fifty,
					/obj/item/stack/tile/carpet/green/fifty,
					/obj/item/stack/tile/carpet/orange/fifty,
					/obj/item/stack/tile/carpet/orange/fifty,
					/obj/item/stack/tile/carpet/purple/fifty,
					/obj/item/stack/tile/carpet/purple/fifty,
					/obj/item/stack/tile/carpet/red/fifty,
					/obj/item/stack/tile/carpet/red/fifty,
					/obj/item/stack/tile/carpet/royalblue/fifty,
					/obj/item/stack/tile/carpet/royalblue/fifty,
					/obj/item/stack/tile/carpet/royalblack/fifty,
					/obj/item/stack/tile/carpet/royalblack/fifty)
	crate_name = "exotic carpet crate"

/datum/supply_pack/civilian/noslipfloor
	name = "High-traction Floor Tiles"
	desc = "Make slipping a thing of the past with thirty industrial-grade anti-slip floortiles!"
	cost = 2000
	contains = list(/obj/item/stack/tile/noslip/thirty)
	crate_name = "high-traction floor tiles crate"

/datum/supply_pack/civilian/jukebox
	name = "Jukebox"
	desc = "Things a bit dull in the workplace? How about jamming out to some tunes!"
	cost = 35000
	contains = list(/obj/machinery/jukebox)
	crate_name = "Jukebox"
