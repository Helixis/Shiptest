/obj/item/clothing/under/natonavy
	name = "\improper NATO Navy Recruit Fatigues"
	desc = "Specialized combat uniform utilized by the NATO Navy serving the Galactic Federation. This uniform is usually used by joined forces aboard a NATO ship"
	icon = 'icons/hispania/obj/clothing/natonavy.dmi'
	mob_overlay_icon = 'icons/hispania/mob/clothing/natonavy.dmi'
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
	name = "\improper NATO Navy Specialist Fatigues"
	desc = "Specialized combat uniform utilized by the NATO Navy Officers serving the Galactic Federation."
	icon_state = "nato_officer"
	item_state = "nato_officer"
	can_adjust = FALSE

/obj/item/clothing/under/natonavy/officer_higher
	name = "\improper NATO Navy Officer Fatigues"
	desc = "Specialized combat uniform utilized by the NATO Navy higher ranking Officers serving the Galactic Federation. This one has additional insignia on its shoulders and cuffs."
	icon_state = "nato_higher_officer"
	item_state = "nato_higher_officer"
	can_adjust = FALSE

/obj/item/clothing/under/natonavy/admirant
	name = "\improper NATO Navy Admirant Uniform"
	desc = "Gold trim on space-black cloth, this uniform displays the rank of \"Admirant\". Worn exclusively by the NATO Navy Admiralty. It's got exotic materials for protection."
	icon_state = "nato_admiral"
	item_state = "nato_admiral"
	can_adjust = FALSE


// NATO Hardsuit
/obj/item/clothing/suit/space/hardsuit/syndi/natonavy
	mob_overlay_icon = 'icons/hispania/mob/clothing/natonavy.dmi'
	icon = 'icons/hispania/obj/clothing/hardsuits/natonavy.dmi'
	icon_state = "hardsuit0-nato"
	item_state = "hardsuit0-nato"
	name = "NATO Navy Hardsuit Helmet"
	desc = "An advanced helmet designed for combat in a hazardous, low pressure environment. Shines with a high polish."
	hardsuit_type = "nato"
	armor = list("melee" = 35, "bullet" = 45, "laser" = 25, "energy" = 35, "bomb" = 35, "bio" = 100, "rad" = 65, "fire" = 65, "acid" = 90)
	light_range = 10
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/suit/space/hardsuit/syndi/natonavy
	mob_overlay_icon = 'icons/hispania/mob/clothing/natonavy.dmi'
	icon = 'icons/hispania/obj/clothing/natonavy.dmi'
	icon_state = "hardsuit0-nato"
	item_state = "hardsuit0-nato"
	name = "NATO Navy Hardsuit"
	desc = "An advanced suit designed for combat in a hazardous, low pressure environments. Shines with a high polish."
	hardsuit_type = "nato"
	armor = list("melee" = 35, "bullet" = 45, "laser" = 25, "energy" = 35, "bomb" = 35, "bio" = 100, "rad" = 65, "fire" = 65, "acid" = 90)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/natonavy
