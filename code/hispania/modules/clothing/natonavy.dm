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
/obj/item/clothing/head/helmet/space/hardsuit/natonavy
	mob_overlay_icon = 'icons/hispania/mob/clothing/natonavy.dmi'
	icon = 'icons/hispania/obj/clothing/natonavy.dmi'
	icon_state = "hardsuit0-nato"
	item_state = "hardsuit0-nato"
	name = "NATO Navy Hardsuit Helmet"
	desc = "An advanced helmet designed for combat in a hazardous, low pressure environment. Shines with a high polish."
	hardsuit_type = "nato"
	armor = list("melee" = 35, "bullet" = 45, "laser" = 25, "energy" = 35, "bomb" = 35, "bio" = 100, "rad" = 65, "fire" = 65, "acid" = 90)
	light_range = 10
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	on = TRUE
	var/obj/item/clothing/suit/space/hardsuit/natonavy/linkedsuit = null
	actions_types = list(/datum/action/item_action/toggle_helmet_mode)
	visor_flags_inv = HIDEMASK|HIDEEYES|HIDEFACE|HIDEFACIALHAIR|HIDEEARS
	visor_flags = STOPSPRESSUREDAMAGE
	var/full_retraction = FALSE //whether or not our full face is revealed or not during combat mode

/obj/item/clothing/head/helmet/space/hardsuit/natonavy/update_icon_state()
	icon_state = "hardsuit[on]-[hardsuit_type]"

/obj/item/clothing/head/helmet/space/hardsuit/natonavy/Initialize()
	. = ..()
	if(istype(loc, /obj/item/clothing/suit/space/hardsuit/natonavy))
		linkedsuit = loc

/obj/item/clothing/head/helmet/space/hardsuit/natonavy/attack_self(mob/user) //Toggle Helmet
	if(!isturf(user.loc))
		to_chat(user, "<span class='warning'>You cannot toggle your helmet while in this [user.loc]!</span>" )
		return
	on = !on
	if(on || force)
		to_chat(user, "<span class='notice'>You switch your hardsuit to EVA mode, sacrificing speed for space protection.</span>")
		name = initial(name)
		desc = initial(desc)
		set_light_on(TRUE)
		clothing_flags |= visor_flags
		cold_protection |= HEAD
		if(full_retraction)
			flags_cover |= HEADCOVERSEYES | HEADCOVERSMOUTH
		else
			flags_cover |= HEADCOVERSMOUTH
		flags_inv |= visor_flags_inv
	else
		to_chat(user, "<span class='notice'>You switch your hardsuit to combat mode, sacrificing space protection for improved speed.</span>")
		name += " (combat)"
		desc = alt_desc
		set_light_on(FALSE)
		clothing_flags &= ~visor_flags
		cold_protection &= ~HEAD
		if(full_retraction)
			flags_cover &= ~(HEADCOVERSEYES | HEADCOVERSMOUTH)
		else
			flags_cover &= ~(HEADCOVERSMOUTH)
		flags_inv &= ~visor_flags_inv
	update_icon()
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, TRUE)
	toggle_hardsuit_mode(user)
	user.update_inv_head()
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		C.head_update(src, forced = 1)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/clothing/head/helmet/space/hardsuit/natonavy/proc/toggle_hardsuit_mode(mob/user) //Helmet Toggles Suit Mode
	if(linkedsuit)
		if(on)
			linkedsuit.name = initial(linkedsuit.name)
			linkedsuit.desc = initial(linkedsuit.desc)
			linkedsuit.slowdown = 1
			linkedsuit.clothing_flags |= STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection |= CHEST | GROIN | LEGS | FEET | ARMS | HANDS
		else
			linkedsuit.name += " (combat)"
			linkedsuit.desc = linkedsuit.alt_desc
			linkedsuit.slowdown = linkedsuit.combat_slowdown
			linkedsuit.clothing_flags &= ~STOPSPRESSUREDAMAGE
			linkedsuit.cold_protection &= ~(CHEST | GROIN | LEGS | FEET | ARMS | HANDS)
			if(linkedsuit.lightweight)
				linkedsuit.flags_inv &= ~(HIDEGLOVES | HIDESHOES | HIDEJUMPSUIT)

		linkedsuit.icon_state = "hardsuit[on]-[hardsuit_type]"
		linkedsuit.update_icon()
		user.update_inv_wear_suit()
		user.update_inv_w_uniform()
		user.update_equipment_speed_mods()


/obj/item/clothing/suit/space/hardsuit/natonavy
	mob_overlay_icon = 'icons/hispania/mob/clothing/natonavy.dmi'
	icon = 'icons/hispania/obj/clothing/natonavy.dmi'
	icon_state = "nato_hardsuit"
	item_state = "nato_hardsuit"
	name = "NATO Navy Hardsuit"
	desc = "An advanced suit designed for combat in a hazardous, low pressure environments. Shines with a high polish."
	hardsuit_type = "nato"
	w_class = WEIGHT_CLASS_NORMAL
	armor = list("melee" = 35, "bullet" = 45, "laser" = 25, "energy" = 35, "bomb" = 35, "bio" = 100, "rad" = 65, "fire" = 65, "acid" = 90)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	allowed = list(/obj/item/gun, /obj/item/ammo_box,/obj/item/ammo_casing, /obj/item/melee/baton, /obj/item/melee/transforming/energy/sword/saber, /obj/item/restraints/handcuffs, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/natonavy
	jetpack = /obj/item/tank/jetpack/suit
	supports_variations = DIGITIGRADE_VARIATION | VOX_VARIATION
	var/combat_slowdown = 0 //slowdown when in combat mode
	var/lightweight = 0 //used for flags when toggling
