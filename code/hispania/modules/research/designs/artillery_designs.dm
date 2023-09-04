/datum/design/board/harblun/low
	name = "Machine Design (LOW-GAMMA Interdictor HARBLUN Board)"
	desc = "Allows for the construction of LOW-GAMMA Interdictor HARBLUN."
	id = "harblun_lg"
	research_icon_state = "harblunlg_desgn"
	build_path = /obj/item/circuitboard/machine/interdictor/lg
	materials = list(/datum/material/glass = 500, /datum/material/bluespace = 100, /datum/material/silver = 300)

/datum/design/board/harblun
	name = "Machine Design (Interdictor HARBLUN Board)"
	desc = "Allows for the construction of Interdictor HARBLUN."
	id = "harblun"
	research_icon = 'icons/hispania/obj/module.dmi'
	research_icon_state = "harblun_desgn"
	build_path = /obj/item/circuitboard/machine/interdictor
	materials = list(/datum/material/glass = 1000, /datum/material/bluespace = 100, /datum/material/silver = 600)
	category = list("Computer Boards","Shuttle Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SECURITY

/datum/design/board/harblun/high
	name = "Machine Design (MILITARY-GAMMA Interdictor HARBLUN Board)"
	desc = "Allows for the construction of MILITARY-GAMMA Interdictor HARBLUN."
	id = "harblun_mg"
	research_icon_state = "harblunmg_desgn"
	build_path = /obj/item/circuitboard/machine/interdictor/mg
	materials = list(/datum/material/glass = 1000, /datum/material/bluespace = 500, /datum/material/silver = 1000, /datum/material/diamond = 500)

/datum/design/board/interdictor
	name = "Computer Design (Interdictor Console)"
	desc = "Allows for the construction of Interdictor HARBLUN."
	id = "interd"
	research_icon = 'icons/hispania/obj/module.dmi'
	research_icon_state = "interd_desgn"
	build_path = /obj/item/circuitboard/computer/interdiction
	materials = list(/datum/material/glass = 1000)
	category = list("Computer Boards","Shuttle Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SECURITY
