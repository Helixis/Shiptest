/datum/design/p16_ammo
	name = "Assault rifle magazine (5.56x45mm)"
	desc = "A simple assault rifle magazine designed to chamber 5.56x45mm."
	id = "p16ammo"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000)
	build_path = /obj/item/ammo_box/magazine/p16
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/cm15_ammo
	name = "CM15 magazine (5.56x45mm)"
	desc = "CM-15 magazine (12g buckshot)"
	id = "cm15ammo"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000)
	build_path = /obj/item/ammo_box/magazine/cm15_mag
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS

/datum/design/vector_ammo
	name = "SMG magazine (9mm)"
	desc = "A submachine gun magazine, designed to chamber 9mm."
	id = "vectorammo"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000)
	build_path = /obj/item/ammo_box/magazine/smgm9mm
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_BALLISTICS
