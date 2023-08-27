/obj/machinery/computer/helm/natonavy
	icon = 'icons/obj/machines/retro_computer.dmi'
	icon_state = "computer-solgov"
	deconpath = /obj/structure/frame/computer/solgov


/obj/machinery/computer/helm/natonavy/Initialize()
	. = ..()
	var/cooldown = 0
	while TRUE
	addtimer(CALLBACK(src, .turn_off), rand(15 SECOND)

	)
