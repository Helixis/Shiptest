// Pistolita
/obj/item/gun/ballistic/automatic/pistol/m1911/enforcer
	name = "\improper NATO Enforcer"
	desc = "A modern .45 handgun with a small magazine capacity used by the NATO Navy."
	icon_state = "enforcer"
	fire_sound_volume = 25
	can_suppress = FALSE
	can_bayonet = FALSE

// Sniper
/obj/item/gun/ballistic/automatic/ekho
	name = "NATO Sniper Rifle"
	desc = "An old and reliable sniper design based on the Intervention, called Ekho, with suppression compatibility. Quickscoping still doesn't work."
	fire_sound_volume = 25
	can_suppress = FALSE
	can_bayonet = FALSE

// Rifle de asalto
/obj/item/gun/ballistic/automatic/assualt/ar/g36
	name = "\improper NT-ARG 'Boarder'"
	desc = "A robust assault rifle used by Nanotrasen fighting forces."
	icon_state = "arg"
	item_state = "arg"
	fire_sound_volume = 25
	can_suppress = FALSE
	can_bayonet = FALSE
	fire_delay = 3

// SMG
/obj/item/gun/ballistic/automatic/m6pdw
	name = "\improper NATO Vector SMG"
	desc = "A PDW designed to be used within close to medium range. Its slide seems to stick a bit, having years of dust accumulation, And its manufacturer stamp and symbols have been scratched out."
	icon = 'icons/hispania/obj/projectiles/guns/m6pdw/m6pdw.dmi'
	icon_state = "m6_pdw"
	righthand_file = 'icons/hispania/obj/projectiles/guns/m6pdw/inhands/righthand.dmi'
	lefthand_file = 'icons/hispania/obj/projectiles/guns/m6pdw/inhands/lefthand.dmi'
	spawnwithmagazine = FALSE
	mag_type = /obj/item/ammo_box/magazine/multi_sprite/g17
	fire_sound = 'sound/weapons/gun/pistol/shot_alt.ogg'
	rack_sound = 'sound/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/weapons/gun/pistol/slide_drop.ogg'
	projectile_damage_multiplier = 1
	burst_size = 2
	fire_delay = 0.5
	fire_sound_volume = 25
	can_suppress = FALSE
	can_bayonet = FALSE

/obj/item/ammo_box/magazine/multi_sprite/g17
	name = "\improper NATO SMG magazine"
	desc = "A magazine for the GK-17 handgun, chambered for 9x25mm ammo."
	icon = 'icons/hispania/obj/projectiles/guns/magazines/mags.dmi'
	icon_state = "g17"
	ammo_type = /obj/item/ammo_box/magazine/m45/nato
	max_ammo = 20
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/m45/nato
	name = "NATO SMG Magazine (.45)"
	desc = "A single stack M1911 reproduction magazine, faithfully designed to chamber .45."
	icon_state = "45-8"
	ammo_type = /obj/item/ammo_casing/c45
	max_ammo = 24

/obj/item/ammo_box/magazine/m45/nato/fire
	name = "NATO SMG Magazine (.45 incendiary)"
	desc = "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with rounds which ignite the target."
	ammo_type = /obj/item/ammo_casing/c45/fire

/obj/item/ammo_box/magazine/m45/nato/hp
	name = "NATO SMG Magazine (.45 HP)"
	desc= "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with rounds which deal more damage, but are completely ineffective against armor."
	ammo_type = /obj/item/ammo_casing/c45/hp

/obj/item/ammo_box/magazine/m45/nato/ap
	name = "NATO SMG Magazine (.45 AP)"
	desc= "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with rounds which penetrate armour, but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c45/ap

/obj/item/ammo_box/magazine/m45/nato/rubbershot
	name = "NATO SMG Magazine (.45 rubbershot)"
	desc = "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with less-lethal rubber rounds which disable targets without causing serious damage."
	ammo_type = /obj/item/ammo_casing/c45/rubbershot
