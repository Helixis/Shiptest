/datum/outfit/job/hammer_left
	name = "Left Hand"
	job_icon = "captain"
	id = /obj/item/card/id/syndicate

	l_pocket = /obj/item/pda
	uniform =  /obj/item/clothing/under/pants/blackjeans
	shoes = /obj/item/clothing/shoes/jackboots

/datum/outfit/job/hammer_left/post_equip(mob/living/carbon/human/H)
	var/obj/item/card/id/I = H.wear_id
	I.assignment = "Left Hand"
	I.access |= list(613)
	I.update_label()

/datum/outfit/job/hammer_right
	name = "Right Hand"
	job_icon = "captain"
	id = /obj/item/card/id/syndicate

	l_pocket = /obj/item/pda
	uniform =  /obj/item/clothing/under/pants/blackjeans
	shoes = /obj/item/clothing/shoes/jackboots

/datum/outfit/job/hammer_right/post_equip(mob/living/carbon/human/H)
	var/obj/item/card/id/I = H.wear_id
	I.assignment = "Right Hand"
	I.access |= list(612)
	I.update_label()
