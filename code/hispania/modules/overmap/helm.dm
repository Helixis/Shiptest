/obj/machinery/computer/helm/natonavy
	icon = 'icons/obj/machines/retro_computer.dmi'
	icon_state = "computer-solgov"
	deconpath = /obj/structure/frame/computer/solgov


/obj/machinery/computer/helm/natonavy/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(atc)), rand(15 SECONDS, 20 SECONDS))

/obj/machinery/computer/helm/natonavy/proc/atc()
	var/chatter_key = rand(1,44)
	playsound(src.loc, "modular_hispania/sound/voice/nato-atc/Chatter[chatter_key].ogg", 100, 0, 4)
