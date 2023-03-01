//Used to process and handle roundstart quirks
// - Quirk strings are used for faster checking in code
// - Quirk datums are stored and hold different effects, as well as being a vector for applying trait string
PROCESSING_SUBSYSTEM_DEF(quirks)
	name = "Quirks"
	init_order = INIT_ORDER_QUIRKS
	flags = SS_BACKGROUND
	wait = 10
	runlevels = RUNLEVEL_GAME

	var/list/quirks = list()		//Assoc. list of all roundstart quirk datum types; "name" = /path/
	var/list/quirk_points = list()	//Assoc. list of quirk names and their "point cost"; positive numbers are good traits, and negative ones are bad
	var/list/quirk_objects = list()	//A list of all quirk objects in the game, since some may process
	var/list/quirk_blacklist = list() //A list a list of quirks that can not be used with each other. Format: list(quirk1,quirk2),list(quirk3,quirk4)
	var/list/quirk_instances = list() //Assoc. list with instances of all roundstart quirk datum types; "name" = /path/

/datum/controller/subsystem/processing/quirks/Initialize(timeofday)
	if(!quirks.len)
		SetupQuirks()

	quirk_blacklist = list(list("Blind","Nearsighted"), \
							list("Jolly","Depression","Apathetic","Hypersensitive"), \
							list("Ageusia","Vegetarian","Deviant Tastes"), \
							list("Ananas Affinity","Ananas Aversion"), \
							list("Alcohol Tolerance","Light Drinker"), \
							list("Clown Fan","Mime Fan"), \
							list("Bad Touch", "Friendly"), \
							list("Blood Deficiency", "Vampirism"))
	for(var/client/client in GLOB.clients)
		client?.prefs.check_quirk_compatibility()
	return ..()

/datum/controller/subsystem/processing/quirks/proc/SetupQuirks()
	// Sort by Positive, Negative, Neutral; and then by name
	var/list/quirk_list = sortList(subtypesof(/datum/quirk), /proc/cmp_quirk_asc)

	for(var/V in quirk_list)
		var/datum/quirk/T = V
		quirks[initial(T.name)] = T
		quirk_points[initial(T.name)] = initial(T.value)
		quirk_instances[initial(T.name)] = new T

/datum/controller/subsystem/processing/quirks/proc/AssignQuirks(mob/living/user, client/cli, spawn_effects)
	var/badquirk = FALSE
	var/list/conflicting_quirks = cli?.prefs.check_quirk_compatibility()
	conflicting_quirks &= cli?.prefs.all_quirks
	if(length(conflicting_quirks) > 0)
		stack_trace("Conflicting quirks [conflicting_quirks.Join(", ")] in client [cli.ckey] preferences on spawn")
	for(var/V in cli?.prefs.all_quirks)
		var/datum/quirk/Q = quirks[V]
		if(Q)
			user.add_quirk(Q, spawn_effects)
		else
			stack_trace("Invalid quirk \"[V]\" in client [cli.ckey] preferences")
			cli?.prefs.all_quirks -= V
			badquirk = TRUE
	if(badquirk)
		cli?.prefs.save_character()

	if(length(conflicting_quirks) > 0)
		alert(user, "Your quirks have been altered because you had a conflicting or invalid quirk, this was likely caused by mood being disabled or the species locks on a quirk being updated!")
