/obj/machinery/computer/helm/natonavy
	icon = 'icons/obj/machines/retro_computer.dmi'
	icon_state = "computer-solgov"
	deconpath = /obj/structure/frame/computer/solgov


/obj/machinery/computer/helm/natonavy/Initialize()
	. = ..()
	var/cooldown = 0
	addtimer(CALLBACK(src, /obj/machinery/computer/helm/natonavy/proc/atc), rand(15 SECOND, 20 SECOND) )

/obj/machinery/computer/helm/natonavy/proc/atc
	var/chatter_key = rand(1,44)
	playsound(src.loc, "modular_hispania/sound/voice/nato-atc/Chatter[chatter_key].ogg", 100, 0, 4)
