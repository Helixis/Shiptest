/obj/machinery/disposal/bin/small
	desc = "A compact pneumatic waste disposal unit."
	icon = 'icons/hispania/obj/atmospherics/pipes/disposal.dmi'
	icon_state = "disposal_small"
	density = FALSE

/obj/machinery/disposal/bin/small/north
	dir = NORTH
	pixel_y = -13
	layer = MOB_LAYER + 0.1

/obj/machinery/disposal/bin/small/south
	dir = SOUTH
	pixel_y = 20
	layer = OBJ_LAYER + 0.3

/obj/machinery/disposal/bin/small/east
	dir = EAST
	pixel_x = -12

/obj/machinery/disposal/bin/small/west
	dir = WEST
	pixel_x = 11

/obj/machinery/disposal/bin/small/Initialize()
	. = ..()
	if(pixel_x || pixel_y)
		return
	else
		switch(dir)
			if(NORTH)
				pixel_y = -13
				layer = MOB_LAYER + 0.1
			if(SOUTH)
				pixel_y = 20
				layer = OBJ_LAYER + 0.3
			if(EAST)
				pixel_x = -12
			if(WEST)
				pixel_x = 11
