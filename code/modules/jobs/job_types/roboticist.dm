/datum/job/roboticist
	name = "Roboticist"
	total_positions = 2
	spawn_positions = 2
	exp_requirements = 60
	exp_type = EXP_TYPE_CREW
	wiki_page = "Guide_to_Robotics" //WS Edit - Wikilinks/Warning

	outfit = /datum/outfit/job/roboticist

	access = list(ACCESS_ROBOTICS, ACCESS_TOX, ACCESS_TOX_STORAGE, ACCESS_TECH_STORAGE, ACCESS_MORGUE, ACCESS_MECH_SCIENCE, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM, ACCESS_XENOBIOLOGY) //WS edit - Gen/Sci Split
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_TECH_STORAGE, ACCESS_MORGUE, ACCESS_RESEARCH, ACCESS_MECH_SCIENCE, ACCESS_MINERAL_STOREROOM)

	display_order = JOB_DISPLAY_ORDER_ROBOTICIST

/datum/outfit/job/roboticist
	name = "Roboticist"
	job_icon = "roboticist"
	jobtype = /datum/job/roboticist

	belt = /obj/item/storage/belt/utility/full
	l_pocket = /obj/item/pda/roboticist
	ears = /obj/item/radio/headset/headset_sci
	uniform = /obj/item/clothing/under/rank/rnd/roboticist
	alt_uniform = /obj/item/clothing/under/rank/rnd/scientist //WS Edit - Alt Uniforms
	suit = /obj/item/clothing/suit/toggle/labcoat
	alt_suit = /obj/item/clothing/suit/toggle/suspenders/gray
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science //WS Edit - Alt Uniforms

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/tox
	courierbag = /obj/item/storage/backpack/messenger/tox

	pda_slot = ITEM_SLOT_LPOCKET

//Alt jobs

/datum/outfit/job/roboticist/biomechanicalengineer
	name = "Roboticist (Biomechanical Engineer)"

	uniform = /obj/item/clothing/under/rank/rnd/roboticist/biomech_engineer
	alt_uniform = null
	suit = null
	alt_suit = null

	pda_slot = ITEM_SLOT_LPOCKET

/datum/outfit/job/roboticist/mechatronicengineer
	name = "Roboticist (Mechatronic Engineer)"

	uniform = /obj/item/clothing/under/rank/rnd/roboticist/mech_engineer
	alt_uniform = null
	suit = /obj/item/clothing/suit/toggle/labcoat
	alt_suit = null
	dcoat = /obj/item/clothing/suit/hooded/wintercoat/science

/datum/outfit/job/roboticist/engineer
	name = "Roboticist (Engine Technician)"

	belt = /obj/item/storage/belt/utility/full/engi
	l_pocket = /obj/item/pda/toxins
	alt_uniform = /obj/item/clothing/under/rank/rnd/roboticist/mech_engineer
	suit = /obj/item/clothing/suit/toggle/hazard
	alt_suit = /obj/item/clothing/suit/toggle/labcoat/science
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat
	r_pocket = /obj/item/t_scanner

	box = /obj/item/storage/box/survival/engineer

/datum/outfit/job/roboticist/seniorroboticist
	name = "Roboticist (Senior Roboticist)"

	uniform = /obj/item/clothing/under/suit/senior_roboticist
	alt_uniform = null
	shoes = /obj/item/clothing/shoes/laceup
	suit = null
	alt_suit = /obj/item/clothing/suit/toggle/labcoat
	dcoat = null
	neck = /obj/item/clothing/neck/tie/black

	backpack_contents = list(/obj/item/storage/belt/utility/full=1)

//Shiptest Outfits

/datum/outfit/job/roboticist/technician
	name = "Mech Technician (Industrial)"
	uniform = /obj/item/clothing/under/rank/rnd/roboticist/mech_engineer
	alt_uniform = null
	shoes = /obj/item/clothing/shoes/workboots
	suit = /obj/item/clothing/suit/apron/overalls
	alt_suit = /obj/item/clothing/suit/hazardvest
	ears = /obj/item/radio/headset/headset_rob

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	courierbag = /obj/item/storage/backpack/messenger/engi

/datum/outfit/job/roboticist/technician/minutemen
	name = "Mech Technician (Minutemen)"

	uniform = /obj/item/clothing/under/rank/security/officer/minutemen
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset/minutemen
	suit = /obj/item/clothing/suit/toggle/labcoat/science

