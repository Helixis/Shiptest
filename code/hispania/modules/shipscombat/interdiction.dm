#define INTERDICTION_CHARGEUP 15 SECONDS
#define INTERDICTION_SPEED_DIFF_MAX 20
#define INTERDICTION_COOLDOWN_START 1 MINUTES
#define INTERDICTION_COOLDOWN_VICTIM 20 SECONDS
// THIS MUST BE LESS THAN THE COOLDOWN FOR STARTING AN INTERDICTION
#define INTERDICTION_BASE_TIME 5 MINUTES

/obj/machinery/computer/interdiction
	name = "interdiction control"
	desc = "Used to attempt interdiction on a nearby ship."
	icon = 'icons/hispania/obj/machines/computer.dmi'
	icon_screen = "interdiction"
	icon_keyboard = "interdiction_key"
	circuit = /obj/item/circuitboard/computer/interdiction
	light_color = LIGHT_COLOR_FLARE

	var/datum/overmap/ship/controlled/current_ship
	var/datum/overmap/ship/controlled/interdicting
	var/working = FALSE
	var/interd_active = FALSE

	var/cur_timer
	var/datum/beam/tether
	var/range = 2
	var/tether_target_time
	var/obj/machinery/interdiction_harblun/machinelinked

	var/obj/overmap/interdiction_token
	var/interdiction_overlay
	unique_icon = TRUE

/obj/machinery/computer/interdiction/attackby(obj/item/O, mob/user, params)
	if(istype(O, /obj/item/multitool))
		if(working) return
		var/obj/item/multitool/multi = O
		if(machinelinked)
			if(machinelinked.machine_stat & (NOPOWER|BROKEN))
				return
			visible_message("Disconnected from HARBLUN.")
			machinelinked.inter_console = null
			use_power = NO_POWER_USE
			machinelinked.update_interd(src)
			return
		if(istype(multi.buffer, /obj/machinery/interdiction_harblun))
			if(multi.buffer.machine_stat & (NOPOWER|BROKEN))
				return
			visible_message("Connected to HARBLUN.")
			machinelinked = multi.buffer

			machinelinked.inter_console = src
			use_power = IDLE_POWER_USE
			machinelinked.update_interd(src)
			range = machinelinked.range
			return
	return ..()

/obj/machinery/computer/interdiction/Destroy()
	end_interdiction()
	current_ship = null
	if(cur_timer)
		deltimer(cur_timer)
	return ..()

/obj/machinery/computer/interdiction/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	current_ship = port.current_ship

/obj/machinery/computer/interdiction/proc/scan_for_targets()
	. = list()
	for(var/obj/overmap/token in orange(range, current_ship.token))
		if(!istype(token.parent, /datum/overmap/ship/controlled))
			continue
		var/datum/overmap/ship/controlled/possible = token.parent
		if(!COOLDOWN_FINISHED(possible, interdiction_cooldown))
			continue // to prevent three or more ships just constantly bullying someone
		if(get_dist(token, current_ship.token) > range)
			continue
		if(abs(current_ship.get_speed() - possible.get_speed()) > INTERDICTION_SPEED_DIFF_MAX)
			continue
		. += possible

/obj/machinery/computer/interdiction/attack_hand(mob/living/user)
	if(!Adjacent(user))
		return
	if(!istype(user))
		return

	user.changeNext_move(CLICK_CD_RAPID)
	if(!can_interact(user))
		say("Access denied.")
		return

	if(!machinelinked)
		visible_message("HARBLUN unlinked, unable to operate.")
		return

	if(interdicting)
		say("Interdiction is already in effect, and cannot be canceled manually.")
		return

	if(!COOLDOWN_FINISHED(current_ship, interdiction_cooldown))
		say("Interdiction array is still cooling down. ETA: [COOLDOWN_TIMELEFT(current_ship, interdiction_cooldown)]")
		return

	var/list/raw_targets = scan_for_targets()
	if(!length(raw_targets))
		say("No valid targets found, attempt to match their speed or get in range.")
		return

	var/list/targets = sortList(raw_targets, .proc/cmp_ship_dist)
	var/list/list_targets = list()
	for(var/datum/overmap/ship/controlled/target as anything in targets)
		list_targets["[get_dist(current_ship.token, target.token)] - [target]"] = target

	var/datum/overmap/ship/controlled/selection = tgui_input_list(user, "Select Target", "Interdiction", list_targets, 10 SECONDS)
	if(!selection || !(selection in list_targets))
		return
	selection = list_targets[selection]

	message_admins("[ADMIN_LOOKUPFLW(user)] has begun interdiction! [current_ship]([ADMIN_JMP(current_ship.token)]) -> [selection]([ADMIN_JMP(selection.token)])")
	start_interdiction(user, selection)
	COOLDOWN_START(current_ship, interdiction_cooldown, INTERDICTION_COOLDOWN_START)

/obj/machinery/computer/interdiction/proc/announce_to_ships(message)
	for(var/v_z as anything in list(interdicting.shuttle_port.virtual_z(), current_ship.shuttle_port.virtual_z()))
		priority_announce(message, "Interdiction Notice", 'sound/misc/announce.ogg', "interdiction", "Interdiction ([current_ship])", zlevel=v_z)

/obj/machinery/computer/interdiction/proc/cmp_ship_dist(datum/overmap/t1, datum/overmap/t2)
	return cmp_numeric_asc(get_dist(current_ship.token, t1.token), get_dist(current_ship.token, t2.token))

/obj/machinery/computer/interdiction/proc/throw_ship_contents(datum/overmap/ship/controlled/target, dir, strength)
	for(var/area/area as anything in target.shuttle_port.shuttle_areas)
		for(var/atom/movable/movable in area)
			var/turf/target_turf = get_edge_target_turf(movable, dir)
			movable.throw_at(target_turf, 2 * strength, strength)

/obj/machinery/computer/interdiction/proc/get_target_range()
	. = get_dist(current_ship.token, interdicting.token)

/obj/machinery/computer/interdiction/proc/start_interdiction(mob/user, datum/overmap/ship/controlled/target)
	if(working) return
	working = TRUE
	interdicting = target
	interdicting.interdictor = current_ship
	interdicting.interdictor_victim = TRUE
	current_ship.interdictor = target

	announce_to_ships("Interdiction Tether Engaged. ETA: [DisplayTimeText(INTERDICTION_CHARGEUP * machinelinked.tether_multiplier)]")
	target.announce_to_helms("Interdiction Tether detected; Attempt to escape enemy range or cause their tether to slip by increasing difference in ship speeds!")
	current_ship.announce_to_helms("Interdiction Tether launched; Attempt to close distance to and match speed of enemy ship!")

	tether = target.token.Beam(current_ship.token, time=INFINITY)
	tether_target_time = world.time + (INTERDICTION_CHARGEUP * machinelinked.tether_multiplier)
	machinelinked.update_icon()
	start_interdiction_callback()


/obj/machinery/computer/interdiction/proc/interdiction_failureapc(quitaporcentajes)
	if(!machinelinked) return
	var/turf/turfapc = machinelinked.loc
	var/area/machineapc = turfapc.loc
	for(var/obj/machinery/power/apc/daapc in machineapc.contents)
		var/obj/item/stock_parts/cell/Cece = daapc.cell
		var/chargeperc = Cece.maxcharge * quitaporcentajes
		Cece.charge = Cece.charge - chargeperc

/obj/machinery/computer/interdiction/proc/start_interdiction_callback()
	if(QDELETED(src)) // La consola exploto mano
		interdiction_failureapc(0.25) // 25% de energia de cell
		announce_to_ships("SEVERE Interdiction Tether operational failure.")
		return end_interdiction()

	if(!is_operational)
		interdiction_failureapc(0.15) // 15% de energia de cell
		announce_to_ships("Interdiction Tether operational failure.")
		current_ship.flicker_lights()
		return end_interdiction()

	if(!powered())
		interdiction_failureapc(0.15) // 15% de energia de cell
		announce_to_ships("Interdiction Tether power failure.")
		current_ship.flicker_lights()
		return end_interdiction()

	var/t_range = get_target_range()
	if(t_range > range)
		announce_to_ships("Target out of range, Interdiction Tether dissipating.")
		current_ship.flicker_lights()
		return end_interdiction()

	var/speed_diff = abs(current_ship.get_speed() - interdicting.get_speed())
	if(speed_diff > INTERDICTION_SPEED_DIFF_MAX)
		announce_to_ships("Target speed difference too great, Interdiction Tether dissipating.")
		current_ship.flicker_lights()
		return end_interdiction()

	if(world.time >= tether_target_time)
		return do_interdiction()

	if(!machinelinked)
		interdiction_failureapc(0.5) // 50% de energia de cell
		announce_to_ships("HARBLUN EXTREMELY SEVERE disruption, Interdiction Tether dissipating.")
		current_ship.flicker_lights()
		throw_ship_contents(current_ship, current_ship.get_heading(), 3)
		return end_interdiction()

	if(machinelinked.machine_stat & (NOPOWER|BROKEN))
		interdiction_failureapc(0.25) // 25% de energia de cell
		announce_to_ships("HARBLUN SEVERE disruption, Interdiction Tether dissipating.")
		current_ship.flicker_lights()
		throw_ship_contents(current_ship, current_ship.get_heading(), 1)
		return end_interdiction()

	machinelinked.use_power = ACTIVE_POWER_USE
	do_sparks(2, TRUE, machinelinked)
	playsound(src, 'sound/machines/apc/apc_mid1.ogg', 85, TRUE)
	cur_timer = addtimer(CALLBACK(src, .proc/start_interdiction_callback), 1 SECONDS, TIMER_STOPPABLE|TIMER_UNIQUE|TIMER_OVERRIDE)

	var/state_us
	var/state_them
	var/speed_us = round(current_ship.get_speed(), 0.1)
	var/speed_them = round(interdicting.get_speed(), 0.1)
	var/speed_diff_large = abs(speed_us - speed_them) > 10
	if(speed_us == speed_them)
		state_us = state_them = "the same speed"
	else if(speed_us > speed_them)
		state_them = (speed_diff_large ? "much faster" : "slightly faster")
		state_us = (speed_diff_large ? "much slower" : "slightly slower")
	else
		state_them = (speed_diff_large ? "much slower" : "slightly slower")
		state_us = (speed_diff_large ? "much faster" : "slightly faster")

	interdicting.announce_to_helms("Interdiction update: They are [state_them] than us! Range is [t_range] sectors. ETA: [DisplayTimeText(tether_target_time - world.time)]")
	current_ship.announce_to_helms("Interdiction update: They are [state_us] than us! Range is [t_range] sectors. ETA: [DisplayTimeText(tether_target_time - world.time)]")

/obj/machinery/computer/interdiction/proc/explode_harblun()
	interd_active = FALSE
	interdiction_failureapc(0.35) // 35% de energia de cell
	announce_to_ships("CRITICAL active power disruption, Interdiction unlocked, dissipating.")
	current_ship.flicker_lights()
	if(machinelinked)
		explosion(machinelinked.loc, 0, 1, 3, 5, FALSE, TRUE, 5, FALSE, TRUE)
	else
		explosion(loc, 0, 1, 3, 5, FALSE, TRUE, 5, FALSE, TRUE)
	end_interdiction()

/obj/machinery/computer/interdiction/proc/interdpower_disrupt()
	interd_active = FALSE
	interdiction_failureapc(0.25) // 25% de energia de cell
	announce_to_ships("SEVERE active power disruption, Interdiction unlocked, dissipating.")
	current_ship.flicker_lights()
	end_interdiction()

/obj/machinery/computer/interdiction/proc/do_interdiction()
	// Calculate the speed differental
	var/speed_diff = abs(interdicting.get_speed() - current_ship.get_speed())
	var/speed_mult = 1 + (get_target_range() * 0.1) // every additional tile is 10% more speed penalty, launching a tether from range is dangerous
	var/effective_penalty = speed_diff * speed_mult

	if(machinelinked.use_power == ACTIVE_POWER_USE)
		machinelinked.use_power = IDLE_POWER_USE

	// Create the interdiction event and immediatly dock the target
	var/old_is = interdicting.token.icon_state
	interdicting.token.icon_state = null // this is done to prevent any visible lag time where it looks like their ship just isnt doing anything
	var/datum/overmap/dynamic/empty/point = new(list("x" = interdicting.x, "y" = interdicting.y)) // TODO: dedicated interdiction subtype, docks literally next to each other

	interdiction_token = point.token
	if(interdiction_overlay)
		interdiction_token.cut_overlay(interdiction_overlay)

	interdiction_overlay = iconstate2appearance(icon, "token_interd")
	interdiction_token.add_overlay(interdiction_overlay)

	interdicting.Dock(point, force=TRUE)
	interdicting.token.icon_state = old_is

	if(!machinelinked)
		explode_harblun()
		return
	else if(machinelinked.machine_stat & NOPOWER)
		interdpower_disrupt()
		return
	else if(machinelinked.machine_stat & BROKEN)
		explode_harblun()
		return
	interd_active = TRUE

	if(machinelinked.diffdamage)
		// I want the aggressor to take 66% of the force damage, to really penalize for not managing your speed properly
		var/our_speedunit = clamp(current_ship.get_speed(),0,1)
		var/their_speedunit = clamp(interdicting.get_speed(),0,1)

		var/our_strength = effective_penalty * 0.5
		var/their_strength = effective_penalty * 0.25

		if(our_strength * our_speedunit > 0 && their_strength * their_speedunit > 0)
			current_ship.announce_to_helms("Interdiction locking roughly by a [our_strength] coefficient.")
			throw_ship_contents(current_ship, current_ship.get_heading(), our_strength)
		if(their_strength * their_speedunit > 0)
			interdicting.announce_to_helms("Interdiction locking roughly by a [their_strength] coefficient.")
			throw_ship_contents(interdicting, interdicting.get_heading(), their_strength)

	if(tether)
		QDEL_NULL(tether)
	current_ship.interdictor = null

	var/interdiction_actual = -round(-(INTERDICTION_BASE_TIME * machinelinked.interdic_multiplier) / (1 + effective_penalty))
	playsound(src, 'sound/machines/beep.ogg', 85, TRUE)
	announce_to_ships("Target locked, Interdiction Tether engaged! Calculations show that the Tether will last for [DisplayTimeText(interdiction_actual)].")
	if(machinelinked)
		machinelinked.update_icon()
	cur_timer = addtimer(CALLBACK(src, .proc/end_interdiction), interdiction_actual, TIMER_STOPPABLE|TIMER_UNIQUE|TIMER_OVERRIDE)

/obj/machinery/computer/interdiction/proc/end_interdiction()
	working = FALSE
	interd_active = FALSE
	if(interdiction_overlay)
		interdiction_token.cut_overlay(interdiction_overlay)
		interdiction_overlay = null
	if(machinelinked)
		if(machinelinked.use_power == ACTIVE_POWER_USE)
			machinelinked.use_power = IDLE_POWER_USE
		machinelinked.update_icon()
	if(current_ship.interdictor)
		current_ship.interdictor = null
	if(tether)
		QDEL_NULL(tether)
	if(cur_timer)
		deltimer(cur_timer)
	if(interdicting)
		COOLDOWN_START(interdicting, interdiction_cooldown, INTERDICTION_COOLDOWN_VICTIM)
		interdicting.interdictor_victim = FALSE
		interdicting.interdictor = null
		interdicting = null
