// Pistolita (Falta añadir su cargador custom y que se aplique el sprite de cuando se queda sin balas)
/obj/item/gun/ballistic/automatic/pistol/m1911/enforcer
	name = "\improper NATO Enforcer"
	desc = "A modern .45 handgun with a small magazine capacity used by the NATO Navy. Modified to fit M1911 Magazines"
	icon = 'icons/hispania/obj/projectiles/projectile.dmi'
	icon_state = "enforcer_black"
	item_state = "enforcer_black"
	fire_sound_volume = 25
	can_suppress = FALSE
	can_bayonet = FALSE

// Sniper
/obj/item/gun/ballistic/automatic/sniper_rifle/ekho
	name = "NATO Sniper Rifle"
	desc = "An old and reliable sniper design based on the Intervention, called Ekho, with suppression integrated. Quickscoping still doesn't work."
	fire_sound_volume = 25
	icon = 'icons/hispania/obj/projectiles/48x32guns.dmi'
	icon_state = "sniper"
	item_state = "sniper"
	zoom_amt = 15
	mag_type = /obj/item/ammo_box/magazine/sniper_rounds/nato_ekho

// Rifle de asalto
/obj/item/gun/ballistic/automatic/assualt/p16/nato_p16
	name = "\improper NATO P-16"
	desc = "An ancient rifle used by professional NATO soldiers. It is said that the P-16 and AK-47 were destined to be in combat against each other. Chambered in 5.56mm. Designed to be lighter"
	icon = 'icons/hispania/obj/projectiles/48x32guns.dmi'
	fire_sound_volume = 25
	icon_state = "nato-p16"
	item_state = "nato-p16"
	weapon_weight = WEAPON_LIGHT

// SMG
/obj/item/gun/ballistic/automatic/smg/vector/nato_vector
	name = "\improper NATO Vector carbine"
	desc = "A military police carbine based off of an SMG design, with most of the complex workings removed for reliability. Chambered in 9mm."
	icon = 'icons/hispania/obj/projectiles/projectile.dmi'
	icon_state = "nato-vector"
	item_state = "nato-vector"
	fire_sound_volume = 25

// Marksman Rifle
/obj/item/gun/ballistic/automatic/assualt/p16/nato_cm16
	name = "\improper NATO CM-16"
	desc = "A NATO manufactured rifle, heavily modified version of the P16 used in Marksman roles. It fires slower and has more zoom"
	icon = 'icons/hispania/obj/projectiles/48x32guns.dmi'
	icon_state = "nato-cm16"
	item_state = "nato-cm16"
	zoomable = TRUE
	zoom_amt = 10 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 5
	fire_delay = 5

// Automatic Shotgun
/obj/item/gun/ballistic/shotgun/automatic/combat/nato
	name = "NATO Combat Shotgun"
	desc = "A semi automatic shotgun with tactical furniture and a six-shell capacity underneath. Designed for the NATO forces"
	icon = 'icons/hispania/obj/projectiles/48x32guns.dmi'
	icon_state = "nato-cm15"
	item_state = "nato-cm15"
	fire_delay = 3

// Revolver
/obj/item/gun/ballistic/derringer/traitor/nato
	name = "NATO Koi Revolver"
	desc = "A easily concealable revolver, used and designed by the NATO forces. High tech ballistic design allows this to be chambered in .357 and .38 ammo"
	icon = 'icons/hispania/obj/projectiles/projectile.dmi'
	icon_state = "nato-mateba"
	item_state = "nato-mateba"
	mag_type = /obj/item/ammo_box/magazine/internal/derr357, /obj/item/ammo_box/magazine/internal/derr38
