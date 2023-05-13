/obj/item/clothing/under/rank/cargo
	icon = 'icons/obj/clothing/under/cargo.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/cargo.dmi'

/obj/item/clothing/under/rank/cargo/qm
	name = "quartermaster's jumpsuit"
	desc = "It's a jumpsuit worn by the quartermaster. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "qm"
	item_state = "lb_suit"

/obj/item/clothing/under/rank/cargo/qm/skirt
	name = "quartermaster's jumpskirt"
	desc = "It's a jumpskirt worn by the quartermaster. It's specially designed to prevent back injuries caused by pushing paper."
	icon_state = "qm_skirt"
	item_state = "lb_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/cargo/tech
	name = "cargo technician's jumpsuit"
	desc = "Shooooorts! They're comfy and easy to wear!"
	icon_state = "cargotech"
	item_state = "lb_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION
	alt_covers_chest = TRUE

/obj/item/clothing/under/rank/cargo/tech/skirt
	name = "cargo technician's jumpskirt"
	desc = "Skiiiiirts! They're comfy and easy to wear"
	icon_state = "cargo_skirt"
	item_state = "lb_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION
	can_adjust = FALSE

/obj/item/clothing/under/rank/cargo/miner
	desc = "It's a snappy jumpsuit with a sturdy set of overalls. It is very dirty."
	name = "shaft miner's jumpsuit"
	icon_state = "miner"
	item_state = "miner"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 0)
	resistance_flags = NONE

/obj/item/clothing/under/rank/cargo/miner/lavaland
	desc = "A light uniform for operating in hazardous environments, manufactured en-masse by EXOCON for the profitable frontier prospector market. Adventurous khaki jeans included."
	name = "prospector jumpsuit"
	icon_state = "explorer"
	item_state = "explorer"
	can_adjust = TRUE
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION

//Shiptest alt jumpsuits

/obj/item/clothing/under/rank/cargo/miner/hazard
	desc = "A thick jumpsuit with reflective stripes for hazardous, low-visibility environments. It's coated in a thick layer of asteroid dust."
	name = "asteroid miner's jumpsuit"
	icon_state = "hazard"
	item_state = "hazard"

/obj/item/clothing/under/rank/cargo/miner/lavaland/old
	icon_state = "explorerold"
	desc = "A standardized NT jumpsuit line, designed to protect the fragile and profitable bodies of the shaft-charting explorers Nanotrasen Resource Operations favoured in the closing years of their golden age. Slightly encumbering, due to heavy protective padding."
	name = "prototype shaft miner's jumpsuit"
	slowdown = 0.1
	armor = list("melee" = 15, "bullet" = 5, "laser" = 5,"energy" = 5, "bomb" = 20, "bio" = 20, "rad" = 20, "fire" = 80, "acid" = 0)
	can_adjust = FALSE

/obj/item/clothing/under/suit/qm
	name = "supply chief suit"
	desc = "A suit with supply colors, worn by those who lead the supply department."
	icon_state = "supply_chief"
	icon = 'icons/obj/clothing/under/cargo.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/cargo.dmi'

/obj/item/clothing/under/suit/qm/skirt
	name = "supply chief skirtsuit"
	icon_state = "supply_chief_skirt"
	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/suit/cargo_tech
	name = "deliveries officer suit"
	desc = "A suit with cargo colors, with a pair of shorts..."
	icon_state = "deliveries_officer"
	icon = 'icons/obj/clothing/under/cargo.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/cargo.dmi'

/obj/item/clothing/under/suit/cargo_tech/skirt
	name = "deliveries officer skirtsuit"
	desc = "A suit with cargo colors, with a skirt..."
	icon_state = "deliveries_officer_skirt"

	body_parts_covered = CHEST|GROIN|ARMS
	can_adjust = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION

/obj/item/clothing/under/rank/cargo/tech/mailroom_technician
	name = "mailroom technician's jumpsuit"
	desc = "Shorts and lost mail makes up this jumpsuit."
	icon_state = "mailroom_technician"
	body_parts_covered = CHEST|GROIN|ARMS
	icon = 'icons/obj/clothing/under/cargo.dmi'
	mob_overlay_icon = 'icons/mob/clothing/under/cargo.dmi'

/obj/item/clothing/under/rank/cargo/tech/mailroom_technician/skirt
	name = "mailroom technician's jumpskirt"
	desc = "Skirts and lost mail makes up this jumpskirt."
	icon_state = "mailroom_technician_skirt"
	can_adjust = FALSE
	supports_variations = DIGITIGRADE_VARIATION_NO_NEW_ICON | VOX_VARIATION
