/obj/item/clothing/under/natonavy
	name = "\improper NATO Navy Recruit Fatigues"
	desc = "Specialized combat uniform utilized by the NATO Navy serving the Galactic Federation. This uniform is usually used by joined forces aboard a NATO ship"
	icon = 'icons/hispania/obj/clothing/natonavy.dmi'
	mob_overlay_icon = 'icons/hispania/mob/clothing/solgov.dmi'
	icon_state = "nato_fatigues"
	item_state = "nato_fatigues"
	armor = list("melee" = 15, "fire" = 30, "acid" = 30)
	strip_delay = 50
	can_adjust = FALSE

/obj/item/clothing/under/natonavy/formed
	name = "\improper NATO Navy Fatigue"
	desc = "Specialized combat uniform utilized by the NATO Navy serving the Galactic Federation. This one has higher rank markings than its regular fatigue counterpart."
	icon_state = "nato_formed"
	item_state = "nato_formed"
	can_adjust = FALSE

/obj/item/clothing/under/natonavy/mp
	name = "\improper NATO Navy MP Uniform"
	desc = "Specialized combat uniform utilized by the NATO Navy Military Police."
	icon_state = "nato_mp"
	item_state = "nato_mp"
	can_adjust = FALSE

/obj/item/clothing/under/natonavy/officer
	name = "\improper NATO Navy Officer Fatigue"
	desc = "Specialized combat uniform utilized by the NATO Navy Officers serving the Galactic Federation."
	icon_state = "nato_officer"
	item_state = "nato_officer"
	can_adjust = FALSE

/obj/item/clothing/under/natonavy/officer_higher
	name = "\improper NATO Navy Officer Fatigue"
	desc = "Specialized combat uniform utilized by the NATO Navy higher ranking Officers serving the Galactic Federation. This one has additional insignia on its shoulders and cuffs."
	icon_state = "nato_higher_officer"
	item_state = "nato_higher_officer"
	can_adjust = FALSE

/obj/item/clothing/under/natonavy/admirant
	name = "\improper NATO Navy Officer Fatigue"
	desc = "Gold trim on space-black cloth, this uniform displays the rank of \"Admirant\". Worn exclusively by the NATO Navy Admiralty. It's got exotic materials for protection."
	icon_state = "nato_admirant"
	item_state = "nato_admirant"
	can_adjust = FALSE


// NATO Hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/natonavy
	name = "NATO Navy hardsuit helmet"
	desc = "An advanced helmet designed for combat in a hazardous, low pressure environment. Shines with a high polish."
	icon_state = "hardsuit0-navy"
	item_state = "ce_helm"
	hardsuit_type = "nato"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/natonavy
	icon_state = "hardsuit-white"
	name = "advanced hardsuit"
	desc = "An advanced suit that protects against hazardous, low pressure environments. Shines with a high polish."
	item_state = "ce_hardsuit"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 30, "energy" = 40, "bomb" = 35, "bio" = 100, "rad" = 50, "fire" = 50, "acid" = 90)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/engine/elite
	jetpack = /obj/item/tank/jetpack/suit
