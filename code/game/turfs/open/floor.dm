/turf/open/floor
	//NOTE: Floor code has been refactored, many procs were removed and refactored
	//- you should use istype() if you want to find out whether a floor has a certain type
	//- floor_tile is now a path, and not a tile obj
	name = "floor"
	icon = 'icons/turf/floors.dmi'
	base_icon_state = "floor"
	baseturfs = /turf/open/floor/plating

	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

	smoothing_groups = list(SMOOTH_GROUP_TURF_OPEN, SMOOTH_GROUP_OPEN_FLOOR)
	canSmoothWith = list(SMOOTH_GROUP_OPEN_FLOOR, SMOOTH_GROUP_TURF_OPEN)

	thermal_conductivity = 0.040
	heat_capacity = 10000
	intact = TRUE
	tiled_dirt = TRUE

	// initiailized as null to stop turfs that update_icon() before Initialize() (in late ruin loading) from getting "stuck" as plating
	var/icon_plating = null
	var/broken = FALSE
	var/burnt = FALSE
	var/floor_tile = null //tile that this floor drops
	var/list/broken_states
	var/list/burnt_states


/turf/open/floor/Initialize(mapload, inherited_virtual_z)
	if(color)
		add_atom_colour(color, FIXED_COLOUR_PRIORITY) //This should already be called in atoms.dm:150 but apparently it's not and I'm too lazy to find out why B)
	if (!broken_states)
		broken_states = string_list(list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5"))
	else
		broken_states = string_list(broken_states)
	if(burnt_states)
		burnt_states = string_list(burnt_states)
	if(!broken && broken_states && (icon_state in broken_states))
		broken = TRUE
	if(!burnt && burnt_states && (icon_state in burnt_states))
		burnt = TRUE
	. = ..()
	if(mapload && prob(33))
		MakeDirty()

/turf/open/floor/ex_act(severity, target)
	var/shielded = is_shielded()
	..()
	if(severity != 1 && shielded && target != src)
		return
	if(target == src)
		ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
		return
	if(target != null)
		severity = 3

	switch(severity)
		if(1)
			ScrapeAway(2, flags = CHANGETURF_INHERIT_AIR)
		if(2)
			switch(rand(1, 3))
				if(1)
					if(!length(baseturfs) || !ispath(baseturfs[baseturfs.len-1], /turf/open/floor))
						ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
						ReplaceWithLattice()
					else
						ScrapeAway(2, flags = CHANGETURF_INHERIT_AIR)
					if(prob(33))
						new /obj/item/stack/sheet/metal(src)
				if(2)
					ScrapeAway(2, flags = CHANGETURF_INHERIT_AIR)
				if(3)
					if(prob(80))
						ScrapeAway(flags = CHANGETURF_INHERIT_AIR)
					else
						break_tile()
					hotspot_expose(1000,CELL_VOLUME)
					if(prob(33))
						new /obj/item/stack/sheet/metal(src)
		if(3)
			if (prob(50))
				src.break_tile()
				src.hotspot_expose(1000,CELL_VOLUME)

/turf/open/floor/is_shielded()
	for(var/obj/structure/A in contents)
		return 1

/turf/open/floor/blob_act(obj/structure/blob/B)
	return

/turf/open/floor/update_icon()
	. = ..()
	update_visuals()

/turf/open/floor/attack_paw(mob/user)
	return attack_hand(user)

/turf/open/floor/proc/break_tile_to_plating()
	var/turf/open/floor/plating/T = make_plating()
	if(!istype(T))
		return
	T.break_tile()

/turf/open/floor/proc/break_tile()
	if(broken)
		return
	var/image/I = image(icon = src.icon, icon_state = pick(broken_states))
	src.overlays += I
	broken = 1

/turf/open/floor/burn_tile()
	if(broken || burnt)
		return
	if(LAZYLEN(burnt_states))
		var/image/I = image(icon = src.icon, icon_state = pick(burnt_states))
		src.overlays += I
	else
		var/image/I = image(icon = src.icon, icon_state = pick(broken_states))
		src.overlays += I
	burnt = 1

/turf/open/floor/proc/make_plating()
	return ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

///For when the floor is placed under heavy load. Calls break_tile(), but exists to be overridden by floor types that should resist crushing force.
/turf/open/floor/proc/crush()
	break_tile()

/turf/open/floor/attackby(obj/item/C, mob/user, params)
	if(!C || !user)
		return 1
	if(..())
		return 1
	if(intact && istype(C, /obj/item/stack/tile))
		try_replace_tile(C, user, params)
	return 0

/turf/open/floor/crowbar_act(mob/living/user, obj/item/I)
	if(intact && pry_tile(I, user))
		return TRUE

/turf/open/floor/proc/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	if(T.turf_type == type)
		return
	var/obj/item/crowbar/CB = user.is_holding_item_of_type(/obj/item/crowbar)
	if(!CB)
		return
	var/turf/open/floor/plating/P = pry_tile(CB, user, TRUE)
	if(!istype(P))
		return
	P.attackby(T, user, params)

/turf/open/floor/proc/pry_tile(obj/item/I, mob/user, silent = FALSE)
	I.play_tool_sound(src, 80)
	return remove_tile(user, silent)

/turf/open/floor/proc/remove_tile(mob/user, silent = FALSE, make_tile = TRUE)
	if(broken || burnt)
		broken = 0
		burnt = 0
		if(user && !silent)
			to_chat(user, "<span class='notice'>You remove the broken plating.</span>")
	else
		if(user && !silent)
			to_chat(user, "<span class='notice'>You remove the floor tile.</span>")
		if(floor_tile && make_tile)
			spawn_tile()
	return make_plating()

/turf/open/floor/proc/spawn_tile()
	new floor_tile(src)

/turf/open/floor/singularity_pull(S, current_size)
	..()
	if(current_size == STAGE_THREE)
		if(prob(30))
			if(floor_tile)
				new floor_tile(src)
				make_plating()
	else if(current_size == STAGE_FOUR)
		if(prob(50))
			if(floor_tile)
				new floor_tile(src)
				make_plating()
	else if(current_size >= STAGE_FIVE)
		if(floor_tile)
			if(prob(70))
				new floor_tile(src)
				make_plating()
		else if(prob(50))
			ReplaceWithLattice()

/turf/open/floor/narsie_act(force, ignore_mobs, probability = 20)
	. = ..()
	if(.)
		ChangeTurf(/turf/open/floor/engine/cult, flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/acid_melt()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rcd_vals(mob/user, obj/item/construction/rcd/the_rcd)
	switch(the_rcd.mode)
		if(RCD_FLOORWALL)
			return list("mode" = RCD_FLOORWALL, "delay" = 20, "cost" = 16)
		if(RCD_AIRLOCK)
			if(the_rcd.airlock_glass)
				return list("mode" = RCD_AIRLOCK, "delay" = 50, "cost" = 20)
			else
				return list("mode" = RCD_AIRLOCK, "delay" = 50, "cost" = 16)
		if(RCD_DECONSTRUCT)
			return list("mode" = RCD_DECONSTRUCT, "delay" = 50, "cost" = 33)
		if(RCD_WINDOWGRILLE)
			return list("mode" = RCD_WINDOWGRILLE, "delay" = 10, "cost" = 4)
		if(RCD_MACHINE)
			return list("mode" = RCD_MACHINE, "delay" = 20, "cost" = 25)
		if(RCD_COMPUTER)
			return list("mode" = RCD_COMPUTER, "delay" = 20, "cost" = 25)
	return FALSE

/turf/open/floor/rcd_act(mob/user, obj/item/construction/rcd/the_rcd, passed_mode)
	switch(passed_mode)
		if(RCD_FLOORWALL)
			to_chat(user, "<span class='notice'>You build a wall.</span>")
			PlaceOnTop(/turf/closed/wall)
			return TRUE
		if(RCD_AIRLOCK)
			if(locate(/obj/machinery/door/airlock) in src)
				return FALSE
			to_chat(user, "<span class='notice'>You build an airlock.</span>")
			var/obj/machinery/door/airlock/A = new the_rcd.airlock_type(src)
			A.electronics = new /obj/item/electronics/airlock(A)
			if(the_rcd.airlock_electronics)
				A.electronics.accesses = the_rcd.airlock_electronics.accesses.Copy()
				A.electronics.one_access = the_rcd.airlock_electronics.one_access
				A.electronics.unres_sides = the_rcd.airlock_electronics.unres_sides
			if(A.electronics.one_access)
				A.req_one_access = A.electronics.accesses
			else
				A.req_access = A.electronics.accesses
			if(A.electronics.unres_sides)
				A.unres_sides = A.electronics.unres_sides
			A.autoclose = TRUE
			return TRUE
		if(RCD_DECONSTRUCT)
			if(!ScrapeAway(flags = CHANGETURF_INHERIT_AIR))
				return FALSE
			to_chat(user, "<span class='notice'>You deconstruct [src].</span>")
			return TRUE
		if(RCD_WINDOWGRILLE)
			if(locate(/obj/structure/grille) in src)
				return FALSE
			to_chat(user, "<span class='notice'>You construct the grille.</span>")
			var/obj/structure/grille/G = new(src)
			G.set_anchored(TRUE)
			return TRUE
		if(RCD_MACHINE)
			if(locate(/obj/structure/frame/machine) in src)
				return FALSE
			var/obj/structure/frame/machine/M = new(src)
			M.state = 2
			M.icon_state = "box_1"
			M.set_anchored(TRUE)
			return TRUE
		if(RCD_COMPUTER)
			if(locate(/obj/structure/frame/computer) in src)
				return FALSE
			var/obj/structure/frame/computer/C = new(src)
			C.set_anchored(TRUE)
			C.state = 1
			C.setDir(the_rcd.computer_dir)
			return TRUE

	return FALSE

/turf/open/floor/material
	name = "floor"
	icon_state = "materialfloor"
	material_flags = MATERIAL_ADD_PREFIX | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS
	icon = 'icons/turf/floors/tiles.dmi'
	icon_state = "tiled"

/turf/open/floor/material/spawn_tile()
	for(var/i in custom_materials)
		var/datum/material/M = i
		new M.sheet_type(src, FLOOR(custom_materials[M] / MINERAL_MATERIAL_AMOUNT, 1))
