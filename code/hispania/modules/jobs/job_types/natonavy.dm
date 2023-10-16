// No Enlistados (gente que hace un apply sin ser de la faccion)
/datum/outfit/job/nato
	name = "NATO Navy Non-Enlisted"
	job_icon = "nato"

	r_pocket = /obj/item/radio
	l_pocket = /obj/item/pda
	belt = /obj/item/storage/belt/military

	uniform =  /obj/item/clothing/under/natonavy
	head = /obj/item/clothing/head/helmet/sec

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain
	courierbag = /obj/item/storage/backpack/messenger/com

	backpack_contents = list(/obj/item/switchblade=1)

/datum/outfit/job/nato/post_equip(mob/living/carbon/human/H)
	var/obj/item/card/id/I = H.wear_id
	I.assignment = name
	I.access |= list(151)
	I.update_label()

// Enlistados (Reclutas > Tropas > Unidades de combate > Soldados)
/datum/outfit/job/nato/enlisted
	name = "NATO Navy Enlisted"
	job_icon = "nato"

	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/combat

	uniform = /obj/item/clothing/under/natonavy/formed
	head = /obj/item/clothing/head/beret/command


// Policia Militar (Sec, pero exclusiva de la nave)
/datum/outfit/job/nato/enlisted/mp
	name = "NATO Navy Military Police"
	job_icon = "natopol"

	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/helmet/sec
	suit = /obj/item/clothing/suit/armor/vest
	belt = /obj/item/storage/belt/military/assault

	uniform = /obj/item/clothing/under/natonavy/mp

// Especialistas (X de combate > Especialista de X > Sargento > Sargento de Primera )
/datum/outfit/job/nato/enlisted/officer
	name = "NATO Navy Specialist"
	job_icon = "natosgt"

	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/combat

	uniform = /obj/item/clothing/under/natonavy/officer
	head = /obj/item/clothing/head/beret/command


// Subteniente > Teniente > Teniente Comandante
/datum/outfit/job/nato/enlisted/officer/higher_officer
	name = "NATO Navy Officer"
	job_icon = "natolieut"
	id = /obj/item/card/id/silver

	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/combat

	uniform = /obj/item/clothing/under/natonavy/officer_higher
	head = /obj/item/clothing/head/beret/command

// Captain (Condom)
/datum/outfit/job/nato/enlisted/officer/higher_officer/captain
	name = "NATO Navy Captain"
	job_icon = "natocpt"

	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/combat

	uniform = /obj/item/clothing/under/natonavy/officer_higher
	head = /obj/item/clothing/head/beret/command


// Almirante :iseeyou:
/datum/outfit/job/nato/enlisted/officer/higher_officer/admiral
	name = "NATO Navy Admiral"
	job_icon = "natoadmiral"

	implants = list(/obj/item/implant/mindshield)
	ears = /obj/item/radio/headset/alt
	gloves = /obj/item/clothing/gloves/combat

	uniform = /obj/item/clothing/under/natonavy/admiral
	head = /obj/item/clothing/head/beret/command
