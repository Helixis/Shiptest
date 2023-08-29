/obj/item/clothing/under/natonavy
	name = "\improper NATO Navy Recruit Fatigues"
	desc = "Specialized combat uniform utilized by the NATO Navy serving the Galactic Federation. This uniform is usually used by joined forces aboard a NATO ship"
	icon = 'icons/hispania/obj/clothing/under/natonavy.dmi'
	mob_overlay_icon = 'icons/hispania/mob/clothing/under/natonavy.dmi'
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

/obj/item/clothing/under/natonavy/admiral
	name = "\improper NATO Navy Admiral Uniform"
	desc = "Gold trim on space-black cloth, this uniform displays the rank of \"Admiral\". Worn exclusively by the NATO Navy Admiralty. It's got exotic materials for protection."
	icon_state = "nato_admiral"
	item_state = "nato_admiral"
	can_adjust = FALSE

/obj/item/clothing/suit/armor/vest/marine/nato
	name = "NATO Tactical Armor Vest"
	icon_state = "marine_medium"

/*
/obj/item/clothing/mask/gas/sechailer/cloaker
	name = "\improper NATO Tactical Mask"
	desc = "A close-fitting tactical mask with an especially aggressive Cloaker-o-nator 420-69."
	var/cooldown = 0
	var/phrase = 1
	actions_types = list(/datum/action/item_action/halt, /datum/action/item_action/selectphrase)
	var/phrase_list = list(

								"forums" 		= "NOW GO TO THE FORUMS AND CRY LIKE THE LITTLE BITCH YOU ARE!",
								"beep" 		= "WULULULULULULU!",
								"difficulty-tweak"			= "WE CALL THIS A DIFFICULTY TWEAK!",
								"celilitis"			= "I'M GONNA BEAT THE CELILITIS OUT OF YOU!",
								"corners"			= "NEXT TIME CHECK YOUR CORNERS!",
								"beated"			= "I BET YOU LET YOURSELF GET BEAT UP JUST TO HEAR WHAT I HAVE TO SAY",
								"pants"			= "YOU WEAR THIS SHIT IN YOUR PANTS PROUDLY LIKE A BADGE OF HONOR",
								"resisting"			= "YOU CALL THIS RESISTING ARREST? YOU ASKED FOR IT!",
								"cry"			= "NOW CRY FOR MOM TO CHANGE YOUR DIAPERS!",
								"expected"			= "I EXPECTED BETTER",
								"hitting-yourself"			= "STOP HITTING YOURSELF! STOP HITTING YOURSELF!",
								"im-late"			= "I know I know, I'm late",
								"meeting"			= "We gotta stop meeting like this you know?",
								"missed"			= "MISSED ME, DIDN'T YA?",
								"no-return"			= "THIS IS THE POINT OF NO RETURN!",
								"not-tough"			= "NOT SO TOUGH NOW, HUH?!",
								"speak-up"			= "SPEAK UP, I CANT HEAR YOU!",
								"s-word"			= "ALRIGHT, THE SAFE WORD IS 'POLICE BRUTALITY'",
								"wish-true"			= "SOMETIMES, WISHES DO COME TRUE",
								"work-smarter"			= "WORK SMARTER, NOT HARDER!"
								)
	icon_state = "cloaker"
	icon_state = "cloaker"

/datum/action/item_action/selectphrase
	name = "Change Phrase"

/obj/item/clothing/mask/gas/sechailer/cloaker/ui_action_click(mob/user, actiontype)
	if(actiontype == /datum/action/item_action/halt)
		halt()
	else if(actiontype == /datum/action/item_action/selectphrase)
		var/key = phrase_list[phrase]
		var/message = phrase_list[key]

		phrase = (phrase < 20) ? (phrase + 1) : 1
		key = phrase_list[phrase]
		message = phrase_list[key]
		to_chat(user,"<span class='notice'>You set the restrictor to: [message]</span>")


/obj/item/clothing/mask/gas/sechailer/cloaker/verb/halt()
	set category = "Object"
	set name = "HALT"
	set src in usr
	if(!isliving(usr) || !can_use(usr))
		return

	// select phrase to play
	//play_phrase(usr, GLOB.hailer_phrases[select_phrase()])
	if(cooldown < world.time - 35)
		var/key = phrase_list[phrase]
		var/message = phrase_list[key]
		usr.visible_message("[usr]'s Cloaker-o-Nator: <font color='red' size='4'><b>[message]</b></font>")
		playsound(src.loc, "modular_hispania/sound/voice/hailer/cloaker/[key].ogg", 100, 0, 4)
		cooldown = world.time
*/
// NATO Hardsuit
/obj/item/clothing/head/helmet/space/hardsuit/syndi/natonavy
	mob_overlay_icon = 'icons/hispania/mob/clothing/hats/helmets.dmi'
	icon = 'icons/hispania/obj/clothing/hats/helmets.dmi'
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
	mob_overlay_icon = 'icons/hispania/mob/clothing/suits/hardsuits.dmi'
	icon = 'icons/hispania/obj/clothing/suits/hardsuits.dmi'
	icon_state = "hardsuit0-nato"
	item_state = "hardsuit0-nato"
	name = "NATO Navy Hardsuit"
	desc = "An advanced suit designed for combat in a hazardous, low pressure environments. Shines with a high polish."
	hardsuit_type = "nato"
	armor = list("melee" = 35, "bullet" = 45, "laser" = 25, "energy" = 35, "bomb" = 35, "bio" = 100, "rad" = 65, "fire" = 65, "acid" = 90)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/syndi/natonavy
