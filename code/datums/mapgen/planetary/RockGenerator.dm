/datum/map_generator/planet_generator/rock
	mountain_height = 0.45
	perlin_zoom = 65

	primary_area_type = /area/overmap_encounter/planetoid/rockplanet

	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock,
			BIOME_LOW_HUMIDITY = /datum/biome/rock,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock/icecap,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/icecap
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock,
			BIOME_LOW_HUMIDITY = /datum/biome/rock,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/icecap
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock,
			BIOME_LOW_HUMIDITY = /datum/biome/rock,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/wetlands
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock,
			BIOME_LOW_HUMIDITY = /datum/biome/rock,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock/wetlands,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/wetlands
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock,
			BIOME_LOW_HUMIDITY = /datum/biome/rock,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock/wetlands
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rock,
			BIOME_LOW_HUMIDITY = /datum/biome/rock,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rock,
			BIOME_HIGH_HUMIDITY = /datum/biome/rock,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/rock
		)
	)

	cave_biome_table = list(
		BIOME_COLDEST_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/rock,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/rock,
			BIOME_MEDIUM_HUMIDITY =/datum/biome/cave/rock,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/rock,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/rock
		),
		BIOME_COLD_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/rock,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/rock,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/rock,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/rock,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/rock
		),
		BIOME_WARM_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/rock,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/rock,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/rock,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/rock,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/rock
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/rock,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/rock,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/rock,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/rock,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/rock
		)
	)

/datum/biome/rock
	open_turf_types = list(/turf/open/floor/plating/asteroid/rockplanet/lit = 1)

	feature_spawn_chance = 0.1
	feature_spawn_list = list(/obj/structure/geyser/random = 1, /obj/structure/elite_tumor = 2)

	flora_spawn_chance = 4
	mob_spawn_chance = 3

	flora_spawn_list = list(
		/obj/structure/flora/rock = 3,
		/obj/structure/flora/tree/cactus = 4,
		/obj/structure/flora/ash/cacti = 1,
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/netherworld/asteroid = 30,
		/mob/living/simple_animal/hostile/asteroid/fugu/asteroid = 30,
		/mob/living/simple_animal/hostile/netherworld/migo/asteroid = 20, //mariuce
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/rockplanet = 30,
		/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child/rockplanet = 50,
	)

/datum/biome/rock/icecap
	open_turf_types = list(/turf/open/floor/plating/asteroid/snow/lit/rockplanet = 1, /turf/open/floor/plating/asteroid/snow/lit/rockplanet = 5)
	flora_spawn_chance = 1
	mob_spawn_chance = 2

/datum/biome/rock/wetlands
	open_turf_types = list(/turf/open/floor/plating/asteroid/rockplanet/wet/lit = 1)
	flora_spawn_chance = 5
	mob_spawn_chance = 4
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/netherworld/asteroid = 30,
		/mob/living/simple_animal/hostile/asteroid/fugu/asteroid = 30,
		/mob/living/simple_animal/hostile/netherworld/migo/asteroid = 20, //mariuce
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/rockplanet = 10,
		/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child/rockplanet = 30,
	)


/datum/biome/cave/rock
	closed_turf_types = list(/turf/closed/mineral/random/asteroid/rockplanet = 1)
	open_turf_types = list(/turf/open/floor/plating/asteroid/rockplanet/cracked = 1)
	flora_spawn_chance = 4
	flora_spawn_list = list(
		/obj/structure/flora/rock = 4,
		/obj/structure/flora/rock/pile = 4,
		/obj/structure/flora/ash/fern = 2,
		/obj/structure/flora/ash/puce = 1,
	)
	feature_spawn_list = list(/obj/structure/geyser/random = 1, /obj/structure/elite_tumor = 2)
	mob_spawn_chance = 4
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/netherworld/asteroid = 20,
		/mob/living/simple_animal/hostile/asteroid/fugu/asteroid = 20,
		/mob/living/simple_animal/hostile/netherworld/migo/asteroid = 20, //mariuce
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/rockplanet = 30,
		/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child/rockplanet = 50,
		/mob/living/simple_animal/hostile/asteroid/goldgrub = 20,
	)

/datum/biome/cave/rock/wet
	open_turf_types = list(/turf/open/floor/plating/asteroid/rockplanet/cracked = 1)
	flora_spawn_chance = 5
	flora_spawn_list = list(
		/obj/structure/flora/rock = 4,
		/obj/structure/flora/rock/pile = 4,
		/obj/structure/flora/ash/fern = 4,
		/obj/structure/flora/ash/puce = 2,
	)
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/netherworld/asteroid = 30,
		/mob/living/simple_animal/hostile/asteroid/fugu/asteroid = 30,
		/mob/living/simple_animal/hostile/netherworld/migo/asteroid = 20, //mariuce
		/mob/living/simple_animal/hostile/asteroid/goliath/beast/rockplanet = 10,
		/mob/living/simple_animal/hostile/asteroid/elite/broodmother_child/rockplanet = 30,
	)
