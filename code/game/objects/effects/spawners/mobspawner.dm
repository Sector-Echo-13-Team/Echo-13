/obj/effect/spawner/lootdrop/randomthreat
	var/static/mob_category = rand(1, 3)

/obj/effect/spawner/lootdrop/randomthreat/Initialize(mapload)
	switch(mob_category)
		if(1)
			loot = list(
				/obj/effect/spawner/lootdrop/hivebotspawner
			)
		if(2)
			loot = list(
				/mob/living/simple_animal/hostile/carp
			)
		if(3)
			loot = list(
				/obj/effect/spawner/lootdrop/spiderspawner
			)
	return ..()

/obj/effect/spawner/lootdrop/xenospawner
	name = "Xenomorph spawner"

	loot = list(
		/mob/living/simple_animal/hostile/alien = 0.3,
		/mob/living/simple_animal/hostile/alien/drone = 0.2,
		/mob/living/simple_animal/hostile/alien/sentinel = 0.3,
		/obj/effect/spawner/lootdrop/xenoqueenspawner = 0.1
	)

/obj/effect/spawner/lootdrop/xenoqueenspawner
	name = "xenomorph queen spawner"
	loot = list(
		/mob/living/simple_animal/hostile/alien/queen = 0.2, //regular queen mob isn't actually that strong
		/mob/living/simple_animal/hostile/alien/queen/large = 0.8
	)

/obj/effect/spawner/lootdrop/hivebotspawner
	name = "Hivebot spawner"

	loot = list(
		/mob/living/simple_animal/hostile/hivebot/strong,
		/mob/living/simple_animal/hostile/hivebot,
	)

/obj/effect/spawner/lootdrop/spiderspawner
	name = "Spider spawner"

	loot = list(
		/mob/living/simple_animal/hostile/poison/giant_spider,
		/mob/living/simple_animal/hostile/poison/giant_spider/hunter,
		/mob/living/simple_animal/hostile/poison/giant_spider/hunter/viper,
	)

/obj/effect/spawner/lootdrop/thirtyfive_percent_borerspawner
	name = "35 percent neutered borer spawner"

	loot = list(
		/mob/living/simple_animal/borer/sterile = 0.35,
		/obj/effect/spawner/lootdrop/maintenance = 0.65,
	)

/obj/effect/spawner/lootdrop/chicken
	name = "chicken spawner"
	loot = list(
		/mob/living/simple_animal/chicken
	)

/obj/effect/spawner/lootdrop/chicken/jungle
	name = "jungle chicken spawner"
	loot = list(
		/mob/living/simple_animal/hostile/retaliate/chicken
	)

/obj/effect/spawner/lootdrop/chicken/jungle/flock
	loot = list(
		/obj/effect/spawner/lootdrop/chicken/jungle
	)
	lootcount = 7
	lootdoubles = TRUE

/obj/effect/spawner/lootdrop/chicken/jungle/flock/New()
	lootcount = rand(5, 10)
