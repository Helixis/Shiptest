/obj/item/circuitboard/machine/interdictor
	name = "Interdictor HARBLUN (Machine Board)"
	icon = 'icons/hispania/obj/module.dmi'
	icon_state = "harblun"
	build_path = /obj/machinery/interdiction_harblun
	req_components = list(
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/capacitor/adv = 2,
		/obj/item/stack/cable_coil = 10,
		/obj/item/stock_parts/subspace/filter = 1,
		/obj/item/stock_parts/subspace/crystal = 1,
		/obj/item/stock_parts/micro_laser/high = 3,
		/obj/item/stack/ore/bluespace_crystal = 1,
		/obj/item/stock_parts/matter_bin/adv = 2
		)

/obj/item/circuitboard/machine/interdictor/lg
	name = "Interdictor Low-Gamma HARBLUN (Machine Board)"
	icon_state = "harblunlg"
	build_path = /obj/machinery/interdiction_harblun/lg
	req_components = list(
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/capacitor = 2,
		/obj/item/stack/cable_coil = 10,
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/micro_laser = 5,
		/obj/item/stack/ore/bluespace_crystal = 1
		)

/obj/item/circuitboard/machine/interdictor/mg
	name = "Interdictor Military-Gamma HARBLUN (Machine Board)"
	icon_state = "harblunmg"
	build_path = /obj/machinery/interdiction_harblun/military
	req_components = list(
		/obj/item/stack/sheet/glass = 1,
		/obj/item/stock_parts/capacitor/quadratic = 4,
		/obj/item/stack/cable_coil = 10,
		/obj/item/stock_parts/matter_bin/bluespace = 2,
		/obj/item/stock_parts/micro_laser/quadultra = 5,
		/obj/item/stack/ore/bluespace_crystal = 5,
		/obj/item/stock_parts/subspace/filter = 4,
		/obj/item/stock_parts/subspace/crystal = 3
		)
