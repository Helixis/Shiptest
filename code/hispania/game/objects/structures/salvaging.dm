/obj/structure/salvageable/harblun
	name = "broken interdiction HARBLUN"
	icon = 'icons/hispania/obj/salvage_structure.dmi'
	icon_state = "harblun_broke"
	salvageable_parts = list(
		/obj/item/stack/sheet/glass/two = 80,
		/obj/item/stack/cable_coil/cut = 80,
		/obj/item/stack/ore/salvage/scrapuranium/five = 70,
		/obj/item/stack/ore/salvage/scrapmetal/five = 60,
		/obj/item/stack/ore/salvage/scrapplasma = 50,

		/obj/effect/spawner/lootdrop/salvage_matter_bin = 60,
		/obj/effect/spawner/lootdrop/salvage_matter_bin = 40,

		/obj/effect/spawner/lootdrop/salvage_laser = 80,
		/obj/effect/spawner/lootdrop/salvage_laser = 60,
		/obj/effect/spawner/lootdrop/salvage_laser = 40,

		/obj/effect/spawner/lootdrop/salvage_capacitor = 30,

		/obj/item/stack/sheet/metal/five = 15,
		/obj/item/stack/sheet/glass/five = 15,
		/obj/item/stack/sheet/mineral/silver/five = 15,

		/obj/item/circuitboard/machine/interdictor/lg = 25,
		/obj/item/stack/sheet/bluespace_crystal = 5
	)

/obj/structure/salvageable/interdiction
	name = "broken interdiction analyzer"
	icon = 'icons/hispania/obj/salvage_structure.dmi'
	icon_state = "interdiction_broken"
	salvageable_parts = list(
		/obj/item/stack/sheet/glass/two = 80,
		/obj/item/stack/cable_coil/cut = 90,
		/obj/item/stack/ore/salvage/scrapsilver/five = 90,
		/obj/item/stack/ore/salvage/scrapgold/five = 60,
		/obj/item/stack/ore/salvage/scrapmetal/five = 60,

		/obj/effect/spawner/lootdrop/salvage_capacitor = 60,

		/obj/item/circuitboard/computer/interdiction = 25,
	)
