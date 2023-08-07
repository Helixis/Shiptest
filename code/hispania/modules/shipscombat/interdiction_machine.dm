/obj/machinery/interdiction_harblun
	name = "Interdiction HARBLUN"
	desc = "A bluespace cosmic 'harpoon' useful for forceful dockings. (BEWARE) Drains power at high speeds while tethering a ship. (WARNING) Any kind of disruption while working can lead to severe consequences."
	icon = 'icons/hispania/obj/machines/artillery.dmi'
	icon_state = "harblun"
	density = TRUE
	use_power = NO_POWER_USE
	var/obj/machinery/computer/interdiction/inter_console
	idle_power_usage = 250
	active_power_usage = 100000 // 8% fuera de cell upgraded
	max_integrity = 110
	integrity_failure = 0.35
	circuit = /obj/item/circuitboard/machine/interdictor

	var/largeharblun = ""
	var/range = 2
	var/tether_multiplier = 1
	var/interdic_multiplier = 1
	var/diffdamage = TRUE

/obj/machinery/interdiction_harblun/Initialize(mapload, obj/item/circuitboard/C)
	. = ..()
	power_change()

/obj/machinery/interdiction_harblun/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/multitool))
		var/obj/item/multitool/multi = O
		multi.buffer = src
		to_chat(user, "<span class='notice'>[src] stored in [O].</span>")
		return TRUE
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, O))
		return
	if(default_deconstruction_crowbar(O))
		return
	else if(O.tool_behaviour == TOOL_WELDER && user.a_intent != INTENT_HARM)
		if(obj_integrity < max_integrity)
			if(!O.tool_start_check(user, amount=0))
				return

			user.visible_message("<span class='notice'>[user] begins repairing [src].</span>", \
				"<span class='notice'>You begin repairing [src]...</span>", \
				"<span class='hear'>You hear welding.</span>")

			if(O.use_tool(src, user, 40, volume=50))
				if(!(machine_stat & BROKEN))
					return
				to_chat(user, "<span class='notice'>You repair [src].</span>")
				set_machine_stat(machine_stat & ~BROKEN)
				obj_integrity = max(obj_integrity, max_integrity)
				update_icon()
			return
		else
			to_chat(user, "<span class='notice'>[src] does not need repairs.</span>")
			return
	return ..()

/obj/machinery/interdiction_harblun/Destroy()
	if(inter_console)
		if(inter_console.interd_active)
			inter_console.explode_harblun()
		else
			inter_console.machinelinked = null
	return ..()

/obj/machinery/interdiction_harblun/proc/update_interd(obj/machinery/computer/interdiction/I)
	if(!I.machinelinked)
		return
	if(!inter_console)
		I.machinelinked = null
		return
	update_icon()

/obj/machinery/interdiction_harblun/update_icon_state()
	if(machine_stat & BROKEN)
		icon_state = "[initial(icon_state)]_broke"
	else if(machine_stat & NOPOWER)
		icon_state = "[initial(icon_state)]_off"
	else if(inter_console)
		if(inter_console.interd_active)
			icon_state = "[initial(icon_state)]_active"
		else if(inter_console.working)
			icon_state = "[initial(icon_state)]_working"
		else
			icon_state = "[initial(icon_state)]_on"
	else
		icon_state = "[initial(icon_state)]"
	return

/obj/machinery/interdiction_harblun/process()
	if(machine_stat & (NOPOWER|BROKEN))
		return 0
	return 1

/obj/machinery/interdiction_harblun/proc/mid_interdiction()
	if(!inter_console)
		return

	if(machine_stat & BROKEN)
		if(inter_console.interd_active)
			inter_console.explode_harblun()
	else if(machine_stat & NOPOWER)
		if(inter_console.interd_active)
			inter_console.interdpower_disrupt()

/obj/machinery/interdiction_harblun/power_change()
	. = ..()
	if(machine_stat & (BROKEN|NOPOWER))
		use_power = NO_POWER_USE
	else
		use_power = IDLE_POWER_USE

/obj/machinery/interdiction_harblun/update_overlays()
	. = ..()
	SSvis_overlays.remove_vis_overlay(src, managed_vis_overlays)

	if(machine_stat & BROKEN)
		mid_interdiction()
		return

	. += "glass[largeharblun]"

	if(machine_stat & NOPOWER)
		mid_interdiction()
		return

	if(!inter_console)
		return

	SSvis_overlays.add_vis_overlay(src, icon, "on[largeharblun]", layer, plane, dir)
	SSvis_overlays.add_vis_overlay(src, icon, "on[largeharblun]", layer, EMISSIVE_PLANE, dir)

	if(inter_console.interd_active)
		SSvis_overlays.add_vis_overlay(src, icon, "active[largeharblun]", layer, plane, dir)
		SSvis_overlays.add_vis_overlay(src, icon, "active[largeharblun]", layer, EMISSIVE_PLANE, dir)
	else if(inter_console.working)
		SSvis_overlays.add_vis_overlay(src, icon, "working[largeharblun]", layer, plane, dir)
		SSvis_overlays.add_vis_overlay(src, icon, "working[largeharblun]", layer, EMISSIVE_PLANE, dir)

/obj/machinery/interdiction_harblun/military
	name = "Interdiction Military-Gamma HARBLUN"
	desc = "A military-gamma bluespace cosmic 'harpoon' useful for forceful dockings. Extended-range and safer locking system (BEWARE) Drains power at really high speeds while tethering a ship. (WARNING) Any kind of disruption while working can lead to severe consequences."
	icon_state = "harblunmg"
	circuit = /obj/item/circuitboard/machine/interdictor/mg
	active_power_usage = 125000 // 10% fuera de cell upgraded
	largeharblun = "mg"
	range = 3

	diffdamage = FALSE

/obj/machinery/interdiction_harblun/lg
	name = "Interdiction Low-Gamma HARBLUN"
	desc = "A low-gamma bluespace cosmic 'harpoon' useful for forceful dockings. Close-range and badly optimized (BEWARE) Drains power at really high speeds while tethering a ship. (WARNING) Any kind of disruption while working can lead to severe consequences."
	icon_state = "harblunlg"
	circuit = /obj/item/circuitboard/machine/interdictor/lg
	active_power_usage = 40000  // 3-4% fuera de cell upgraded

	tether_multiplier = 2
	interdic_multiplier = 0.5
	range = 1

/obj/machinery/interdiction_harblun/lg/RefreshParts()
	tether_multiplier = initial(tether_multiplier)
	interdic_multiplier = initial(interdic_multiplier)
	active_power_usage = initial(active_power_usage)

	var/tetherlasers = -5
	var/interdicbins = -0.5

	for(var/obj/item/stock_parts/matter_bin/M in component_parts)
		interdicbins += M.rating * 0.25
	for(var/obj/item/stock_parts/micro_laser/L in component_parts)
		tetherlasers += L.rating
	for(var/obj/item/stock_parts/capacitor/C in component_parts)
		if (C.rating > 3)
			active_power_usage -= 5000
		if (C.rating > 1)
			active_power_usage -= 2500

	tether_multiplier -= round((tetherlasers/15)*0.85)
	interdic_multiplier += interdicbins * 0.1
