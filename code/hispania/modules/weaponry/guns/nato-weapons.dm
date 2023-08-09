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
	icon = 'modular_skyrat/modules/sec_haul/icons/guns/mags.dmi'
	icon_state = "g17"
	ammo_type = /obj/item/ammo_casing/c45
	max_ammo = 20
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/multi_sprite/g17/hp
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/multi_sprite/g17/ihdf
	ammo_type = /obj/item/ammo_casing/c9mm/ihdf

/obj/item/ammo_box/magazine/multi_sprite/g17/rubber
	ammo_type = /obj/item/ammo_casing/c9mm/rubber

// SMART Rifle
/obj/item/gun/ballistic/automatic/smartgun
	name = "\improper NATO 'S.M.A.R.T.' Rifle"
	desc = "Suppressive Manual Action Reciprocating Taser rifle. A modified version of an Armadyne heavy machine gun fitted to fire miniature shock-bolts. Used by the NATO Navy"
	icon = 'modular_skyrat/modules/sec_haul/icons/guns/smartgun.dmi'
	righthand_file = 'modular_skyrat/modules/sec_haul/icons/guns/inhands/righthand40x32.dmi'
	lefthand_file = 'modular_skyrat/modules/sec_haul/icons/guns/inhands/lefthand40x32.dmi'
	icon_state = "smartgun"
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BACK
	ammo_type = /obj/item/ammo_box/magazine/smartgun
	actions_types = null
	can_suppress = FALSE
	can_bayonet = FALSE
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_alarm = TRUE
	tac_reloads = FALSE
	bolt_type = BOLT_TYPE_STANDARD
	semi_auto = FALSE
	fire_sound = 'modular_skyrat/modules/sec_haul/sound/chaingun_fire.ogg'
	rack_sound = 'modular_skyrat/modules/sec_haul/sound/chaingun_cock.ogg'
	lock_back_sound = 'modular_skyrat/modules/sec_haul/sound/chaingun_open.ogg'
	bolt_drop_sound = 'modular_skyrat/modules/sec_haul/sound/chaingun_cock.ogg'
	load_sound = 'modular_skyrat/modules/sec_haul/sound/chaingun_magin.ogg'
	load_empty_sound = 'modular_skyrat/modules/sec_haul/sound/chaingun_magin.ogg'
	eject_sound = 'modular_skyrat/modules/sec_haul/sound/chaingun_magout.ogg'
	load_empty_sound = 'modular_skyrat/modules/sec_haul/sound/chaingun_magout.ogg'
	var/recharge_time = 5 SECONDS
	var/recharging = FALSE

/obj/item/gun/ballistic/automatic/smartgun/process_chamber()
	. = ..()
	recharging = TRUE
	addtimer(CALLBACK(src, PROC_REF(recharge)), recharge_time)

/obj/item/gun/ballistic/automatic/smartgun/proc/recharge()
	recharging = FALSE
	playsound(src, 'sound/weapons/kenetic_reload.ogg', 60, 1)

/obj/item/gun/ballistic/automatic/smartgun/can_shoot()
	. = ..()
	if(recharging)
		return FALSE

/obj/item/gun/ballistic/automatic/smartgun/update_icon()
	. = ..()
	if(!magazine)
		icon_state = "smartgun_open"
	else
		icon_state = "smartgun_closed"

/obj/item/ammo_box/magazine/smartgun
	name = "\improper SMART-Rifle magazine"
	icon = 'modular_skyrat/modules/sec_haul/icons/guns/mags.dmi'
	icon_state = "smartgun"
	ammo_type = /obj/item/ammo_casing/smartgun
	caliber = "smartgun"
	max_ammo = 5
	multiple_sprites = AMMO_BOX_PER_BULLET
