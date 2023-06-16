/datum/job/cook
	name = "Cook"
	total_positions = 2
	spawn_positions = 1
	wiki_page = "Food" //WS Edit - Wikilinks/Warning
	var/cooks = 0 //Counts cooks amount

	outfit = /datum/outfit/job/cook

	access = list(ACCESS_HYDROPONICS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_MINERAL_STOREROOM)

	display_order = JOB_DISPLAY_ORDER_COOK

/datum/outfit/job/cook
	name = "Cook"
	job_icon = "cook"
	jobtype = /datum/job/cook

	belt = /obj/item/pda/cook
	ears = /obj/item/radio/headset/headset_srv
	uniform = /obj/item/clothing/under/rank/civilian/chef
	alt_uniform = /obj/item/clothing/under/rank/civilian/cookjorts //WS Edit - Alt Uniforms
	suit = /obj/item/clothing/suit/toggle/chef
	alt_suit = /obj/item/clothing/suit/apron/chef
	head = /obj/item/clothing/head/chefhat
	mask = /obj/item/clothing/mask/fakemoustache/italian
	backpack_contents = list(/obj/item/sharpener = 1)

/datum/outfit/job/cook/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/list/possible_boxes = subtypesof(/obj/item/storage/box/ingredients)
	var/chosen_box = pick(possible_boxes)
	var/obj/item/storage/box/I = new chosen_box(src)
	H.equip_to_slot_or_del(I,ITEM_SLOT_BACKPACK)
	var/datum/martial_art/cqc/under_siege/justacook = new
	justacook.teach(H)

//WS Edit Start - Alt-Job Titles
/datum/outfit/job/cook/grillmaster
	uniform = /obj/item/clothing/under/rank/civilian/cookjorts
	suit = null
	head = null
	mask = null
	r_hand = /obj/item/reagent_containers/food/drinks/soda_cans/monkey_energy
	l_pocket = /obj/item/stack/sheet/mineral/coal
//WS Edit End - Alt-Job Titles

//shiptest outfits

/datum/outfit/job/cook/frontiersmen
	name = "Steward (frontiersmen)"

	uniform = /obj/item/clothing/under/rank/security/officer/frontier
	ears = /obj/item/radio/headset/pirate
	head  = /obj/item/clothing/head/flatcap
	suit = /obj/item/clothing/suit/apron/chef
