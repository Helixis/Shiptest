// Pistolita (Falta añadir su cargador custom y que se aplique el sprite de cuando se queda sin balas)
/obj/item/gun/ballistic/automatic/pistol/m1911/enforcer
	name = "\improper NATO Enforcer"
	desc = "A modern .45 handgun with a small magazine capacity used by the NATO Navy."
	icon = 'icons/hispania/obj/guns/projectile.dmi'
	icon_state = "enforcer_black"
	item_state = "enforcer_black"
	fire_sound_volume = 25
	can_suppress = FALSE
	can_bayonet = FALSE

// Sniper (Falta ponerle su munición propia)
/obj/item/gun/ballistic/automatic/sniper_rifle/ekho
	name = "NATO Sniper Rifle"
	desc = "An old and reliable sniper design based on the Intervention, called Ekho, with suppression compatibility. Quickscoping still doesn't work."
	fire_sound_volume = 25
	icon = 'icons/hispania/obj/guns/48x32guns.dmi'
	icon_state = "sniper"
	item_state = "sniper"
	zoom_amt = 15
	mag_type = /obj/item/ammo_box/magazine/sniper_rounds


// Rifle de asalto (TERMINADO)
/obj/item/gun/ballistic/automatic/assualt/p16/nato-p16
	name = "\improper NATO P-16"
	desc = "An ancient rifle used by professional NATO soldiers. It is said that the P-16 and AK-47 were destined to be in combat against each other. Chambered in 5.56mm. Designed to be lighter"
	icon = 'icons/hispania/obj/guns/48x32guns.dmi'
	fire_sound_volume = 25
	icon_state = "nato-p16"
	item_state = "nato-p16"
	weapon_weight = WEAPON_LIGHT

// SMG (TERMINADO)
/obj/item/gun/ballistic/automatic/smg/vector/nato-vector
	name = "\improper NATO Vector carbine"
	desc = "A military police carbine based off of an SMG design, with most of the complex workings removed for reliability. Chambered in 9mm."
	icon_state = "vector"
	item_state = "vector"
	fire_sound_volume = 25

// Marksman Rifle
/obj/item/gun/ballistic/automatic/assualt/p16/nato-cm16
	name = "\improper CM-16"
	desc = "Standard issue rifle of the Colonial Minutemen. A heavily modified version of the P-16 designed to fit the standards of operative warfare."
	icon_state = "cm16"
	item_state = "cm16"
	zoomable = TRUE
	zoom_amt = 10 //Long range, enough to see in front of you, but no tiles behind you.
	zoom_out_amt = 5
