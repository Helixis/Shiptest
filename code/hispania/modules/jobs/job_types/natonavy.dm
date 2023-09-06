/datum/outfit/job/nato
	name = "NATO Navy Non-Enlisted"
	job_icon = "null"

	r_pocket = /obj/item/radio
	l_pocket = /obj/item/pda
	belt = /obj/item/storage/belt/military

	uniform =  /obj/item/clothing/under/natonavy
	head = /obj/item/clothing/head/helmet/sec
	id = /obj/item/card/id/lplieu

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	backpack_contents = list(/obj/item/switchblade=1)

/datum/outfit/job/nato/enlisted
	name = "NATO Navy Enlisted"

	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/combat

	uniform = /obj/item/clothing/under/natonavy/formed
	head = /obj/item/clothing/head/beret/command

/datum/outfit/job/nato/enlisted/mp
	name = "NATO Navy Military Police"

	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/helmet/sec
	suit = /obj/item/clothing/suit/armor/vest
	/obj/item/storage/belt/military/assault

	uniform = /obj/item/clothing/under/natonavy/mp

/datum/outfit/job/nato/enlisted/officer
	name = "NATO Navy Specialist"

	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/combat

	uniform = /obj/item/clothing/under/natonavy/officer
	head = /obj/item/clothing/head/beret/command

/datum/outfit/job/nato/enlisted/officer/higher_officer
	name = "NATO Navy Officer"

	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/combat

	uniform = /obj/item/clothing/under/natonavy/officer_higher
	head = /obj/item/clothing/head/beret/command

/datum/outfit/job/nato/enlisted/officer/higher_officer/admiral
	name = "NATO Navy Admiral"

	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/combat

	uniform = /obj/item/clothing/under/natonavy/admiral
	head = /obj/item/clothing/head/beret/command
