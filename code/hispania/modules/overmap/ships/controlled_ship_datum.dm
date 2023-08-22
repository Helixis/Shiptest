/datum/overmap/ship/controlled/proc/announce_to_helms(message)
	for(var/obj/machinery/computer/helm/helm as anything in helms)
		helm.say(message)

/datum/overmap/ship/controlled/proc/flicker_lights()
	for(var/area/shuttle_area as anything in shuttle_port.shuttle_areas)
		for(var/obj/machinery/light/L in shuttle_area.contents)
			L.flicker()
