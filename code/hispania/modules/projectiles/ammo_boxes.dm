/obj/item/ammo_box/magazine/m45/nato_enforcer
	name = "pistol  magazine (.45)"
	desc = "A single stack M1911 reproduction magazin e, faithfully designed to chamber .45."
	icon = 'icons/hispania/obj/projectiles/projectile.dmi'
	icon_state = "enforcer"
	var/ammo_sprite = "normal"

/obj/item/ammo_box/magazine/m45/nato_enforcer/fire
	name = "pistol magazine (.45 incendiary)"
	desc = "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with rounds which ignite the target."
	ammo_type = /obj/item/ammo_casing/c45/fire
	ammo_sprite = "fire"

/obj/item/ammo_box/magazine/m45/nato_enforcer/hp
	name = "pistol magazine (.45 HP)"
	desc= "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with rounds which deal more damage, but are completely ineffective against armor."
	ammo_type = /obj/item/ammo_casing/c45/hp
	ammo_sprite = "hollow"

/obj/item/ammo_box/magazine/m45/nato_enforcer/ap
	name = "pistol magazine (.45 AP)"
	desc= "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with rounds which penetrate armour, but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c45/ap
	ammo_sprite = "armor"

/obj/item/ammo_box/magazine/m45/nato_enforcer/rubbershot
	name = "pistol magazine (.45 rubbershot)"
	desc = "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with less-lethal rubber rounds which disable targets without causing serious damage."
	ammo_type = /obj/item/ammo_casing/c45/rubbershot
	ammo_sprite = "rubber"

/obj/item/ammo_box/magazine/m45/nato_enforcer/update_icon()
	..()
	if (ammo_count() >= 8)
		icon_state = "enforcer-8-[ammo_sprite]"
	else
		icon_state = "enforcer-[ammo_count()]-[ammo_sprite]"

/obj/item/ammo_box/magazine/sniper_rounds/nato_ekho
	name = "Ekho rounds (.50)"
	icon_state = "ekho_mag"
	icon = 'icons/hispania/obj/projectiles/ammo.dmi'


/obj/item/ammo_box/magazine/sniper_rounds/nato_ekho/update_icon()
	..()
	if(ammo_count())
		icon_state = "[initial(icon_state)]_mag"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/ammo_box/magazine/internal/derr357/nato
	name = "\improper NATO revolver cylinder"
	ammo_type = /obj/item/ammo_casing/a357
	caliber = ".357", ".38"
	max_ammo = 6
	instant_load = TRUE
