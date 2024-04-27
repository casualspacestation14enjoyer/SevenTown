/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock
	name = "flintlock weapon"
	desc = ""
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "pistol"
	item_state = "matchlock"
	possible_item_intents = list(/datum/intent/shoot/matchlock, INTENT_GENERIC)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/matchlock
	fire_sound = 'sound/combat/Ranged/firebow-shot-01.ogg'
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 0
	spread = 0
	can_parry = TRUE
	pin = /obj/item/firing_pin
	force = 25
	verbage = "cock"
	cartridge_wording = "ball"
	load_sound = 'sound/foley/struggle.ogg'
	associated_skill = /datum/skill/combat/crossbows

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/shoot_live_shot(mob/living/user, pointblank, mob/pbtarget, message)
	. = ..()
	new /obj/effect/particle_effect/smoke(get_turf(user))
