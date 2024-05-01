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
	title = "Heartfelt Captain"
	selection_color = JCOLOR_CAPR
	flag = REDCAPTAIN
	department_flag = SERFS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = list("Humen",
	"Humen")
	allowed_sexes = list(MALE)

/datum/job/roguetown/warfare/red/soldier
	title = "Heartfelt Soldier"
	selection_color = JCOLOR_RED
	flag = SOLDIER
	outfit = /datum/outfit/job/roguetown/soldier/red
	department_flag = SERFS
	faction = "Station"
	total_positions = 9999
	spawn_positions = 10
	allowed_races = list("Humen",
	"Humen",
	"Elf",
	"Dwarf",
	"Tiefling",
	"Aasimar"
	)

// BLUE: CORVANI

/datum/job/roguetown/warfare/blue/captain
	title = "Corvani Captain"
	selection_color = JCOLOR_CAPB
	flag = BLUCAPTAIN
	department_flag = SERFS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = list("Humen",
	"Humen")
	allowed_sexes = list(MALE)

/datum/job/roguetown/warfare/blue/soldier
	title = "Corvani Soldier"
	selection_color = JCOLOR_BLU
	flag = SOLDIER
	outfit = /datum/outfit/job/roguetown/soldier/blue
	department_flag = SERFS
	faction = "Station"
	total_positions = 9999
	spawn_positions = 10
	allowed_races = list("Humen",
	"Humen",
	"Elf",
	"Dwarf",
	"Tiefling",
	"Aasimar"
	)
