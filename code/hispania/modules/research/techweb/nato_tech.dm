/datum/techweb_node/nato_ballistics
	id = "nato_ballistics"
	display_name = "NATO Ballistic Ammo"
	description = "Refined NATO ballistic weaponry for extra combat trauma."
	prereq_ids = list("adv_ballistics", "adv_weaponry")
	design_ids = list("p16ammo", "cm15ammo", "vectorammo", "hp9mm", "hp10mm", "hp45", "ap556mmHITP", "hp556mmHITP")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7500)

/datum/techweb_node/nato_electrics
	id = "nato_electrics"
	display_name = "NATO Electric Weaponry"
	description = "Refined ballistic ammunition for extra combat trauma."
	prereq_ids = list("adv_beam_weapons", "adv_weaponry")
	design_ids = list("ap9mm", "ap10mm", "ap45", "hp9mm", "hp10mm", "hp45", "ap556mmHITP", "hp556mmHITP")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7500)

/datum/techweb_node/adv_nato_ballistics
	id = "adv_nato_ballistics"
	display_name = "NATO Ballistic Weaponry"
	description = "Finest NATO ballistic weaponry for all combat scenarios."
	prereq_ids = list("adv_ballistics", "adv_weaponry")
	design_ids = list("ap9mm", "ap10mm", "ap45", "hp9mm", "hp10mm", "hp45", "ap556mmHITP", "hp556mmHITP")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 7500)
