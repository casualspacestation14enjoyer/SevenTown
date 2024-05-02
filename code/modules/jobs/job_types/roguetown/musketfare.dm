#define BLUETEAM "Corvani" // attackers
#define REDTEAM "Heartfelts" // defenders

/datum/job/roguetown/warfare
	var/warfare_faction = null

/datum/job/roguetown/warfare/proc/GetAffiliation(affiliation)
	switch(affiliation)
		if(REDTEAM)
			return "Heartfelt"
		if(BLUETEAM)
			return "Corvan"
		else
			return "unknown"

/datum/job/roguetown/warfare/equip(mob/living/carbon/human/H, visualsOnly, announce, latejoin, datum/outfit/outfit_override, client/preference_source)
	. = ..()
	if(warfare_faction)
		H.affiliation = warfare_faction
		to_chat(H, "I am a proud [GetAffiliation(H.affiliation)]. Glory!")

/datum/job/roguetown/warfare/blue
	warfare_faction = BLUETEAM

/datum/job/roguetown/warfare/red
	warfare_faction = REDTEAM

// RED: Heartfelts

/datum/job/roguetown/warfare/red/captain
	title = "Heartfelt Lord"
	tutorial = "You're the Lord of Heartfelt, the filthy rebels have gotten at your final fortress. Your residence, if they get your crown it's over. Lead your men, valiantly."
	selection_color = JCOLOR_CAPR
	flag = REDCAPTAIN
	outfit = /datum/outfit/job/roguetown/captain/red
	department_flag = SERFS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = list("Humen",
	"Humen")
	allowed_sexes = list(MALE)

/datum/job/roguetown/warfare/red/captain/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		for(var/mob/living/carbon/human/RED in world)
			if(RED.affiliation == BLUETEAM)
				to_chat(RED, "<b><span class='notice'><span class='big'>[H.real_name] is your Lord.</span></span></b>")

/datum/job/roguetown/warfare/red/soldier
	title = "Heartfelt Soldier"
	tutorial = "You're a rifleman, shoot wisely and accurately. Bullets are expensive."
	selection_color = JCOLOR_RED
	flag = SOLDIER
	outfit = /datum/outfit/job/roguetown/soldier/red
	department_flag = SERFS
	faction = "Station"
	total_positions = 50
	spawn_positions = 10
	allowed_races = list("Humen",
	"Humen")

// BLUE: CORVANI

/datum/job/roguetown/warfare/blue/captain
	title = "Corvani Captain"
	tutorial = "You're the leader of the rebel charge agaisnt the tyranical regime. Lead your men onwards to a better Heartfelt. Glory to the Corvani. Glory to the stars!"
	selection_color = JCOLOR_CAPB
	flag = BLUCAPTAIN
	outfit = /datum/outfit/job/roguetown/captain/blue
	department_flag = SERFS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = list("Humen",
	"Humen")
	allowed_sexes = list(MALE)

/datum/job/roguetown/warfare/blue/captain/after_spawn(mob/living/H, mob/M, latejoin)
	. = ..()
	if(H)
		for(var/mob/living/carbon/human/BLU in world)
			if(BLU.affiliation == BLUETEAM)
				to_chat(BLU, "<b><span class='notice'><span class='big'>[H.real_name] is your leader.</span></span></b>")

/datum/job/roguetown/warfare/blue/soldier
	title = "Corvani Soldier"
	tutorial = "You're a rifleman, shoot wisely and accurately. Bullets are expensive."
	selection_color = JCOLOR_BLU
	flag = SOLDIER
	outfit = /datum/outfit/job/roguetown/soldier/blue
	department_flag = SERFS
	faction = "Station"
	total_positions = 9999
	spawn_positions = 5
	allowed_races = list("Humen",
	"Humen",
	"Elf",
	"Dwarf",
	"Tiefling",
	"Aasimar"
	)
