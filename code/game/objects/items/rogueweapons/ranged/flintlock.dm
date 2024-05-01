/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock
	name = "flint weapon"
	desc = "A new design of ranged weaponry made by a famous dwarven designer 'Urist Gunilda'. Some scientists still debate on how to call this new weapon."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "pistol"
	item_state = "matchlock"
	possible_item_intents = list(/datum/intent/shoot/matchlock, INTENT_GENERIC)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/matchlock
	fire_sound = 'sound/combat/Ranged/firebow-shot-01.ogg'
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 0
	spread = 0
	can_parry = TRUE
	pin = /obj/item/firing_pin
	force = 25
	verbage = "load"
	cartridge_wording = "munition"
	load_sound = 'sound/foley/struggle.ogg'
	associated_skill = /datum/skill/combat/crossbows
	recoil = 8

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/royal
	name = "royal flinty"
	desc = "It is gold encrusted."
	icon_state = "pistol2"

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/blunder
	name = "blunder weapon"
	desc = "A strange derivation from the original design, this one sports a large barrel to hold a pouch of multiple lead balls in it. Shooting many projectiles at once."
	icon_state = "pistol3"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/matchlock/blunder
	recoil = 16

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/before_firing(atom/target, mob/user)
	var/mob/living/carbon/human/H = user
	playsound(H, 'sound/misc/click.ogg', 100)
	sleep(3)
	..()
	
/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/blunder/shoot_live_shot(mob/living/user, pointblank, mob/pbtarget, message)
	var/mob/living/carbon/human/H = user
	new /obj/effect/particle_effect/smoke/musket(get_turf(H))
	playsound(user, fire_sound, fire_sound_volume, vary_fire_sound)

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/shoot_live_shot(mob/living/user, pointblank, mob/pbtarget, message)
	new /obj/effect/particle_effect/smoke/musket(get_turf(user))
	playsound(user, fire_sound, fire_sound_volume, vary_fire_sound)
