/datum/outfit/job/abductorcaptain
	name = "Leader"
	job_icon = "captain"

	id = /obj/item/card/id/gold
	r_pocket = /obj/item/radio
	l_pocket = /obj/item/pda
	belt = /obj/item/storage/belt/fannypack
	uniform =  /obj/item/clothing/under/pants/blackjeans

	dcoat = /obj/item/clothing/suit/jacket/puffer/vest
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(/obj/item/switchblade=1)

/datum/outfit/job/mantarrayaleader/post_equip(mob/living/carbon/human/H)
	var/obj/item/card/id/I = H.wear_id
	I.assignment = "Leader"
	I.access |= list(151)
	I.update_label()

/datum/outfit/job/mantassistant
	name = "Assistant"
	job_icon = "assistant"
	jobtype = /datum/job/assistant
	r_pocket = /obj/item/radio
	l_pocket = /obj/item/pda
	belt = /obj/item/storage/belt/fannypack
	uniform =  /obj/item/clothing/under/pants/blackjeans
	shoes = /obj/item/clothing/shoes/jackboots
