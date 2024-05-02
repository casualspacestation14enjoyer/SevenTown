/obj/structure/roguethrone
	name = "throne of rockhill"
	desc = "A big throne, to hold the Lord's giant personality. Say 'help' with the crown on your head if you are confused."
	icon = 'icons/roguetown/misc/96x96.dmi'
	icon_state = "throne"
	density = FALSE
	can_buckle = 1
	pixel_x = -32
	max_integrity = 999999
	buckle_lying = FALSE

/obj/structure/roguethrone/post_buckle_mob(mob/living/M)
	..()
	density = TRUE
	M.set_mob_offsets("bed_buckle", _x = 0, _y = 8)

/obj/structure/roguethrone/post_unbuckle_mob(mob/living/M)
	..()
	density = FALSE
	M.reset_offsets("bed_buckle")

/obj/structure/roguethrone/Initialize()
	..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/structure/roguethrone/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/structure/roguethrone/lordcolor(primary,secondary)
	if(!primary || !secondary)
		return
	var/mutable_appearance/M = mutable_appearance(icon, "throne_primary", -(layer+0.1))
	M.color = primary
	add_overlay(M)
	M = mutable_appearance(icon, "throne_secondary", -(layer+0.1))
	M.color = secondary
	add_overlay(M)
	GLOB.lordcolor -= src

/obj/structure/heartfeltthrone // if corvan sits with heart crown, corvans win. if hearts sits with corvan crown, hearts win
	name = "throne of heartfelt"
	icon = 'icons/roguetown/misc/96x96.dmi'
	icon_state = "throne"
	density = FALSE
	can_buckle = 1
	pixel_x = -32
	max_integrity = 999999
	buckle_lying = FALSE

/obj/structure/heartfeltthrone/post_buckle_mob(mob/living/M)
	..()
	density = TRUE
	M.set_mob_offsets("bed_buckle", _x = 0, _y = 8)
	to_chat(world, "DEBUG: buckled")
	if(ishuman(M))
		var/mob/living/carbon/human/sitta = M
		if(sitta.affiliation == REDTEAM)
			if(istype(sitta.head, /obj/item/clothing/head/roguetown/crown/blucrown))
				// hearties win!
				to_chat(world, "DEBUG: hearties should win")
				SSticker.whoWon = REDTEAM
				SSticker.newLord = sitta.real_name
				SSticker.mode.check_finished()
		else // this technically means that humans with no affiliation that wear the red crown can make corvans win, idk
			if(istype(sitta.head, /obj/item/clothing/head/roguetown/crown/redcrown))
				// corvies win!
				to_chat(world, "DEBUG: corvies should win")
				SSticker.whoWon = BLUETEAM
				SSticker.newLord = sitta.real_name
				SSticker.mode.check_finished()
			

/obj/structure/heartfeltthrone/post_unbuckle_mob(mob/living/M)
	..()
	density = FALSE
	M.reset_offsets("bed_buckle")
