//traits with no real impact that can be taken freely
//MAKE SURE THESE DO NOT MAJORLY IMPACT GAMEPLAY. those should be positive or negative traits.

/datum/quirk/no_taste
	name = "Ageusia"
	desc = "You can't taste anything! Toxic food will still poison you."
	value = 0
	mob_traits = list(TRAIT_AGEUSIA)
	gain_text = "<span class='notice'>You can't taste anything!</span>"
	lose_text = "<span class='notice'>You can taste again!</span>"
	medical_record_text = "Patient suffers from ageusia and is incapable of tasting food or reagents."

/datum/quirk/vegetarian
	name = "Vegetarian"
	desc = "You find the idea of eating meat morally and physically repulsive."
	value = 0
	gain_text = "<span class='notice'>You feel repulsion at the idea of eating meat.</span>"
	lose_text = "<span class='notice'>You feel like eating meat isn't that bad.</span>"
	medical_record_text = "Patient reports a vegetarian diet."

/datum/quirk/vegetarian/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food &= ~MEAT
	species.disliked_food |= MEAT

/datum/quirk/vegetarian/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		if(initial(species.liked_food) & MEAT)
			species.liked_food |= MEAT
		if(!(initial(species.disliked_food) & MEAT))
			species.disliked_food &= ~MEAT

/datum/quirk/snob
	name = "Snob"
	desc = "You care about the finer things, if a room doesn't look nice its just not really worth it, is it?"
	value = 0
	gain_text = "<span class='notice'>You feel like you understand what things should look like.</span>"
	lose_text = "<span class='notice'>Well who cares about deco anyways?</span>"
	medical_record_text = "Patient seems to be rather stuck up."
	mob_traits = list(TRAIT_SNOB)

/datum/quirk/pineapple_liker
	name = "Ananas Affinity"
	desc = "You find yourself greatly enjoying fruits of the ananas genus. You can't seem to ever get enough of their sweet goodness!"
	value = 0
	gain_text = "<span class='notice'>You feel an intense craving for pineapple.</span>"
	lose_text = "<span class='notice'>Your feelings towards pineapples seem to return to a lukewarm state.</span>"
	medical_record_text = "Patient demonstrates a pathological love of pineapple."

/datum/quirk/pineapple_liker/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= PINEAPPLE

/datum/quirk/pineapple_liker/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~PINEAPPLE

/datum/quirk/pineapple_hater
	name = "Ananas Aversion"
	desc = "You find yourself greatly detesting fruits of the ananas genus. Serious, how the hell can anyone say these things are good? And what kind of madman would even dare putting it on a pizza!?"
	value = 0
	gain_text = "<span class='notice'>You find yourself pondering what kind of idiot actually enjoys pineapples...</span>"
	lose_text = "<span class='notice'>Your feelings towards pineapples seem to return to a lukewarm state.</span>"
	medical_record_text = "Patient is correct to think that pineapple is disgusting."

/datum/quirk/pineapple_hater/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= PINEAPPLE

/datum/quirk/pineapple_hater/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~PINEAPPLE

/datum/quirk/deviant_tastes
	name = "Deviant Tastes"
	desc = "You dislike food that most people enjoy, and find delicious what they don't."
	value = 0
	gain_text = "<span class='notice'>You start craving something that tastes strange.</span>"
	lose_text = "<span class='notice'>You feel like eating normal food again.</span>"
	medical_record_text = "Patient demonstrates irregular nutrition preferences."

/datum/quirk/deviant_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	var/liked = species.liked_food
	species.liked_food = species.disliked_food
	species.disliked_food = liked

/datum/quirk/deviant_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

/datum/quirk/monochromatic
	name = "Monochromacy"
	desc = "You suffer from full colorblindness, and perceive nearly the entire world in blacks and whites."
	value = 0
	medical_record_text = "Patient is afflicted with almost complete color blindness."

/datum/quirk/monochromatic/add()
	quirk_holder.add_client_colour(/datum/client_colour/monochrome/blind/permanent)

/datum/quirk/monochromatic/post_add()
	if(quirk_holder.mind.assigned_role == "Detective")
		to_chat(quirk_holder, "<span class='boldannounce'>Mmm. Nothing's ever clear in this world of ours. It's all shades of gray...</span>")
		quirk_holder.playsound_local(quirk_holder, 'sound/ambience/ambidet1.ogg', 50, FALSE)

/datum/quirk/monochromatic/remove()
	if(quirk_holder)
		quirk_holder.remove_client_colour(/datum/client_colour/monochrome)

/datum/quirk/phobia
	name = "Phobia"
	desc = "You are irrationally afraid of something."
	value = 0
	medical_record_text = "Patient has an irrational fear of something."

/datum/quirk/phobia/post_add()
	var/mob/living/carbon/human/H = quirk_holder
	H.gain_trauma(new /datum/brain_trauma/mild/phobia(H.client?.prefs.phobia), TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/phobia/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		H.cure_trauma_type(/datum/brain_trauma/mild/phobia, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/needswayfinder
	name = "Navigationally Challenged"
	desc = "Lacking familiarity with certain stations, you start with a wayfinding pinpointer where available."
	value = 0
	medical_record_text = "Patient demonstrates a keen ability to get lost."

	var/obj/item/pinpointer/wayfinding/wayfinder
	var/where

/datum/quirk/needswayfinder/on_spawn()
	if(!GLOB.wayfindingbeacons.len)
		return
	var/mob/living/carbon/human/H = quirk_holder

	wayfinder = new /obj/item/pinpointer/wayfinding
	wayfinder.owner = H.real_name
	wayfinder.roundstart = TRUE

	var/list/slots = list(
		"in your left pocket" = ITEM_SLOT_LPOCKET,
		"in your right pocket" = ITEM_SLOT_RPOCKET,
		"in your backpack" = ITEM_SLOT_BACKPACK
	)
	where = H.equip_in_one_of_slots(wayfinder, slots, FALSE) || "at your feet"

/datum/quirk/needswayfinder/post_add()
	if(!GLOB.wayfindingbeacons.len)
		return
	if(where == "in your backpack")
		var/mob/living/carbon/human/H = quirk_holder
		SEND_SIGNAL(H.back, COMSIG_TRY_STORAGE_SHOW, H)

	to_chat(quirk_holder, "<span class='notice'>There is a pinpointer [where], which can help you find your way around. Click in-hand to activate.</span>")

/datum/quirk/bald
	name = "Smooth-Headed"
	desc = "You have no hair and are quite insecure about it! Keep your wig on, or at least your head covered up."
	value = 0
	mob_traits = list(TRAIT_BALD)
	gain_text = "<span class='notice'>Your head is as smooth as can be, it's terrible.</span>"
	lose_text = "<span class='notice'>Your head itches, could it be... growing hair?!</span>"
	medical_record_text = "Patient starkly refused to take off headwear during examination."
	///The user's starting hairstyle
	var/old_hair

/datum/quirk/bald/add()
	var/mob/living/carbon/human/H = quirk_holder
	old_hair = H.hairstyle
	H.hairstyle = "Bald"
	H.update_hair()
	RegisterSignal(H, COMSIG_CARBON_EQUIP_HAT, .proc/equip_hat)
	RegisterSignal(H, COMSIG_CARBON_UNEQUIP_HAT, .proc/unequip_hat)

/datum/quirk/bald/remove()
	if(quirk_holder)
		var/mob/living/carbon/human/H = quirk_holder
		H.hairstyle = old_hair
		H.update_hair()
		UnregisterSignal(H, list(COMSIG_CARBON_EQUIP_HAT, COMSIG_CARBON_UNEQUIP_HAT))
		SEND_SIGNAL(H, COMSIG_CLEAR_MOOD_EVENT, "bad_hair_day")

/datum/quirk/bald/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/clothing/head/wig/natural/W = new(get_turf(H))
	if (old_hair == "Bald")
		W.hairstyle = pick(GLOB.hairstyles_list - "Bald")
	else
		W.hairstyle = old_hair
	W.update_icon()
	var/list/slots = list (
		"head" = ITEM_SLOT_HEAD,
		"backpack" = ITEM_SLOT_BACKPACK,
		"hands" = ITEM_SLOT_HANDS,
	)
	H.equip_in_one_of_slots(W, slots , qdel_on_fail = TRUE)

///Checks if the headgear equipped is a wig and sets the mood event accordingly
/datum/quirk/bald/proc/equip_hat(mob/user, obj/item/hat)
	SIGNAL_HANDLER

	if(istype(hat, /obj/item/clothing/head/wig))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "bad_hair_day", /datum/mood_event/confident_mane) //Our head is covered, but also by a wig so we're happy.
	else
		SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "bad_hair_day") //Our head is covered

///Applies a bad moodlet for having an uncovered head
/datum/quirk/bald/proc/unequip_hat(mob/user, obj/item/clothing, force, newloc, no_move, invdrop, silent)
	SIGNAL_HANDLER

	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "bad_hair_day", /datum/mood_event/bald)

/datum/quirk/vampire
	name = "Vampirism"
	desc = "You're a bloodsucking vampire, able to suck the blood of others, heal in coffins, transfer to them your own, and you're undead, do be careful not to run out of blood or give others too much of your own, lest peril come. <b>This is not a license to grief.</b>"
	value = 0
	gain_text = "<span class='notice'>Your blood is accursed, feed on others lest you become dry and fall apart, however your blood is also helpful to others which are not vampires, and you may gift them, careful for them not to become like you.</span>"
	lose_text = "<span class='notice'>You feel blessed, your blood no longer cursed.</span>"
	medical_record_text = "Patient is a vampire."
	species_lock = TRAIT_SPECIES_BLACKLIST(SPECIES_IPC, SPECIES_JELLYPERSON, SPECIES_PLASMAMAN, SPECIES_ETHEREAL, SPECIES_VAMPIRE) //No.
	mob_traits = list(TRAIT_NOBREATH, TRAIT_NOHUNGER)
	var/old_blood
	var/obj/item/organ/heart/old_heart
	var/datum/action/vampire_quirk_drain/vampire_drain
	var/datum/action/vampire_quirk_transfer/vampire_transfer
	var/list/old_traits
	var/list/old_biotypes
	var/list/species_traits = list(NOHEART, DRINKSBLOOD)

/datum/quirk/vampire/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/organ/heart/current_heart = H.getorganslot(ORGAN_SLOT_HEART)
	old_heart = current_heart.type
	vampire_drain = new
	vampire_transfer = new
	vampire_drain.Grant(H)
	vampire_transfer.Grant(H)
	old_blood = H.dna.blood_type
	H.dna.species.exotic_blood = /datum/reagent/blood/true_draculine
	H.dna.blood_type = get_blood_type("Draculine")
	H.dna.species.species_traits |= species_traits
	H.dna.species.inherent_biotypes = MOB_UNDEAD|MOB_HUMANOID

/datum/quirk/vampire/post_add()
	if(!quirk_holder.mind || quirk_holder.mind.special_role)
		return
	to_chat(quirk_holder, "<span class='big bold info'>Please note that your vampirism does NOT give you the right to attack people or otherwise cause any interference to \
	the round without reason or escalation. You are not an antagonist, and the rules will treat you the same as other crewmembers.</span>")

/datum/quirk/vampire/remove()
	if(quirk_holder)
		var/mob/living/carbon/human/H = quirk_holder
		if(vampire_drain)
			vampire_drain.Remove(H)
		if(vampire_transfer)
			vampire_transfer.Remove(H)
		H.dna.species.exotic_blood = ""
		H.dna.blood_type = old_blood
		if(!H.getorganslot(ORGAN_SLOT_HEART))
			old_heart = new
			old_heart.Insert(H)
		H.dna.species.species_traits ^= species_traits
		H.dna.species.inherent_biotypes = old_biotypes

/datum/quirk/vampire/on_process()
	var/mob/living/carbon/human/C = quirk_holder
	if(istype(C.loc, /obj/structure/closet/crate/coffin))
		C.heal_overall_damage(2,2,0, BODYPART_ORGANIC)
		C.adjustToxLoss(-2)
		C.adjustOxyLoss(-2)
		C.adjustCloneLoss(-2)
		return
	if(!C.client) //Can't blame no one for no disconnects
		return
	C.blood_volume -= max(C.blood_volume/4000, 0.07)
	if(C.blood_volume <= BLOOD_VOLUME_BAD)
		if(prob(5) && C.blood_volume > BLOOD_VOLUME_SURVIVE)
			to_chat(C, "<span class='danger'>You're running out of blood!</span>")
	if(C.blood_volume <= BLOOD_VOLUME_SURVIVE)
		to_chat(C, "<span class='danger'>You ran out of blood!</span>")
		C.death()
		C.Drain()

#define VAMP_DRAIN_AMOUNT 20

/datum/action/vampire_quirk_drain
	name = "Drain Victim"
	desc = "Leech blood from any compatible victim you are passively grabbing."
	check_flags = AB_CHECK_CONSCIOUS
	icon_icon = 'icons/effects/bleed.dmi'
	button_icon_state = "bleed1"

/datum/action/vampire_quirk_drain/Trigger()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/H = owner
		if(H.quirk_cooldown["Vampire"] >= world.time)
			return
		while(H.pulling && iscarbon(H.pulling) && H.grab_state == GRAB_PASSIVE)
			var/mob/living/carbon/victim = H.pulling
			if(H.blood_volume >= BLOOD_VOLUME_MAXIMUM)
				to_chat(H, "<span class='warning'>You're already full!</span>")
				break
			if(victim.stat == DEAD)
				to_chat(H, "<span class='warning'>You need a living victim!</span>")
				break
			if(!victim.blood_volume || (victim.dna && ((NOBLOOD in victim.dna.species.species_traits) || !(victim.dna.blood_type.type in H.dna.blood_type.compatible_types))))
				to_chat(H, "<span class='warning'>[victim] doesn't have suitable blood!</span>")
				break
			H.quirk_cooldown["Vampire"] = world.time + 30
			if(victim.anti_magic_check(FALSE, TRUE, FALSE, 0))
				to_chat(victim, "<span class='warning'>[H] tries to bite you, but stops before touching you!</span>")
				to_chat(H, "<span class='warning'>[victim] is blessed! You stop just in time to avoid catching fire.</span>")
				break
			if(victim?.reagents?.has_reagent(/datum/reagent/consumable/garlic))
				to_chat(victim, "<span class='warning'>[H] tries to bite you, but recoils in disgust!</span>")
				to_chat(H, "<span class='warning'>[victim] reeks of garlic! you can't bring yourself to drain such tainted blood.</span>")
				break
			if(!do_after(H, 30, target = victim))
				break
			var/blood_volume_difference = BLOOD_VOLUME_MAXIMUM - H.blood_volume //How much capacity we have left to absorb blood
			var/drained_blood = min(victim.blood_volume, VAMP_DRAIN_AMOUNT, blood_volume_difference)
			to_chat(victim, "<span class='danger'>[H] is draining your blood!</span>")
			to_chat(H, "<span class='notice'>You drain some blood!</span>")
			playsound(H, 'sound/items/drink.ogg', 30, TRUE, -2)
			victim.blood_volume = clamp(victim.blood_volume - drained_blood, 0, BLOOD_VOLUME_MAXIMUM)
			H.blood_volume = clamp(H.blood_volume + drained_blood, 0, BLOOD_VOLUME_MAXIMUM)
			if(!victim.blood_volume)
				to_chat(H, "<span class='notice'>You finish off [victim]'s blood supply.</span>")

#undef VAMP_DRAIN_AMOUNT

#define VAMP_TRANSFER_AMOUNT 5

/datum/action/vampire_quirk_transfer
	name = "Blood Transfer"
	desc = "Transfer your own tainted blood to one from which you could feed."
	check_flags = AB_CHECK_CONSCIOUS
	icon_icon = 'icons/effects/bleed.dmi'
	button_icon_state = "bleed9"

/datum/action/vampire_quirk_transfer/Trigger()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/H = owner
		if(H.quirk_cooldown["Vampire Transfer"] >= world.time)
			return
		if(H.pulling && iscarbon(H.pulling) && H.grab_state == GRAB_PASSIVE)
			var/mob/living/carbon/victim = H.pulling
			if(victim.blood_volume >= BLOOD_VOLUME_MAXIMUM)
				to_chat(H, "<span class='warning'>They're already full!</span>")
				return
			if(victim.stat == DEAD)
				to_chat(H, "<span class='warning'>You need to transfer blood to a living being!</span>")
				return
			if(!victim.blood_volume || (victim.dna && ((NOBLOOD in victim.dna.species.species_traits) || !(victim.dna.blood_type.type in H.dna.blood_type.compatible_types))))
				to_chat(H, "<span class='warning'>[victim] doesn't have suitable blood!</span>")
				return
			H.quirk_cooldown["Vampire Transfer"] = world.time + 20
			if(victim.anti_magic_check(FALSE, TRUE, FALSE, 0))
				to_chat(victim, "<span class='warning'>[H] tries to twist you, but stops before touching you!</span>")
				to_chat(H, "<span class='warning'>[victim] is blessed! You stop just in time to avoid catching fire.</span>")
				return
			if(victim?.reagents?.has_reagent(/datum/reagent/consumable/garlic))
				to_chat(victim, "<span class='warning'>[H] tries to twist you, but recoils in disgust!</span>")
				to_chat(H, "<span class='warning'>[victim] reeks of garlic! you can't bring yourself to twist such tainted blood.</span>")
				return
			if(!do_after(H, 20, target = victim))
				return
			var/blood_volume_difference = BLOOD_VOLUME_MAXIMUM - victim.blood_volume //How much capacity we have left to transfer blood
			var/transfered_blood = min(H.blood_volume, VAMP_TRANSFER_AMOUNT, blood_volume_difference)
			to_chat(victim, "<span class='danger'>You feel darkness leaving[H] and entering you!</span>")
			to_chat(H, "<span class='notice'>You transfer blood to [victim]!</span>")
			playsound(H, 'sound/items/drink.ogg', 30, TRUE, -2)
			H.blood_volume = clamp(H.blood_volume - transfered_blood, 0, BLOOD_VOLUME_MAXIMUM)
			var/blood_id = H.get_blood_id()
			var/list/blood_data = H.get_blood_data(blood_id)
			victim.reagents.add_reagent(blood_id, transfered_blood, blood_data, H.bodytemperature)

#undef VAMP_TRANSFER_AMOUNT


/mob/living/carbon/get_status_tab_items()
	. = ..()
	if(has_quirk(/datum/quirk/vampire))
		. += "Current blood level: [blood_volume]/[BLOOD_VOLUME_MAXIMUM]."
