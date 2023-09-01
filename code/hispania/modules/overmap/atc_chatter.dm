/obj/machinery/atc_chatter
	icon = 'icons/hispania/obj/machines/computer.dmi'
	icon_state = "atc_chatter"
	name = "STC Chatter"
	anchored = TRUE
	desc = "Space Trafic Control Chatter, Tunned in NATO frequencies. You can hear any NATO member all across the universe with this machine! Each mothership have one of theese."
	var/atc_enable = TRUE

/obj/machinery/atc_chatter/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(atc)), rand(15 SECONDS, 20 SECONDS))

/obj/machinery/atc_chatter/proc/atc()
	if (atc_enable == TRUE)
		var/chatter_key = rand(1,44)
		playsound(src, "sound/hispania/voice/nato-atc/Chatter[chatter_key].ogg", 50, TRUE)
	addtimer(CALLBACK(src, PROC_REF(atc)), rand(15 SECONDS, 30 SECONDS))

/obj/machinery/atc_chatter/ui_interact(mob/user)
	. = ..()
	if(ishuman(user) || issilicon(user))
		if (atc_enable == TRUE)
			atc_enable = FALSE
			to_chat(user, "<span class='warning'>STC Chatter Disabled!.</span>")
		else
			atc_enable = TRUE
			to_chat(user, "<span class='warning'>STC Chatter Enabled!.</span>")
