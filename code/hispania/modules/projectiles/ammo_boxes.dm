/obj/item/ammo_box/magazine/m45/nato_enforcer
	name = "pistol  magazine (.45)"
	desc = "A single stack M1911 reproduction magazin e, faithfully designed to chamber .45."
	icon = 'icons/hispania/obj/projectiles/projectile.dmi'
	icon_state = "enforcer"

/obj/item/ammo_box/magazine/m45/nato_enforcer/fire
	name = "pistol magazine (.45 incendiary)"
	desc = "A single s  tack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with rounds which ignite the target."
	ammo_type = /obj/item/ammo_casing/c45/fire

/obj/item/ammo_box/magazine/m45/nato_enforcer/hp
	name = "pistol magazine (.45 HP)"
	desc= "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with rounds which deal more damage, but are completely ineffective against armor."
	ammo_type = /obj/item/ammo_casing/c45/hp

/obj/item/ammo_box/magazine/m45/nato_enforcer/ap
	name = "pistol magazine (.45 AP)"
	desc= "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with rounds which penetrate armour, but are less effective against normal targets."
	ammo_type = /obj/item/ammo_casing/c45/ap

/obj/item/ammo_box/magazine/m45/nato_enforcer/rubbershot
	name = "pistol magazine (.45 rubbershot)"
	desc = "A single stack M1911 reproduction magazine, faithfully designed to chamber .45. Loaded with less-lethal rubber rounds which disable targets without causing serious damage."
	ammo_type = /obj/item/ammo_casing/c45/rubbershot

/obj/item/ammo_box/magazine/m45/nato_enforcer/update_icon()
	..()
	if (ammo_count() >= 8)
		icon_state = "enforcer-8"
	else
		icon_state = "enforcer-[ammo_count()]"
