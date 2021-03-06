/datum/job/liaison
	title = "Foreign Diplomat"
	department = "Support"
	department_flag = SPT
	total_positions = 0
	spawn_positions = 0
	supervisors = "The Foreign Government of your species"
	selection_color = "#2f2f7f"
	economic_power = 15
	minimal_player_age = 0
	alt_titles = list()
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/workplace_liaison
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/sv)
	min_skill = list(   SKILL_BUREAUCRACY	= SKILL_EXPERT,
	                    SKILL_FINANCE		= SKILL_BASIC)
	skill_points = 20
	access = list(access_liaison, access_tox, access_tox_storage, access_bridge, access_research,
						access_mining, access_mining_office, access_mining_station, access_xenobiology,
						access_xenoarch, access_nanotrasen, access_sec_guard, access_hangar,
						access_petrov, access_petrov_helm, access_maint_tunnels, access_emergency_storage,
						access_janitor, access_hydroponics, access_kitchen, access_bar, access_commissary)
	software_on_spawn = list(/datum/computer_file/program/reports)

/datum/job/liaison/get_description_blurb()
	return "You are the Foreign Diplomat. You are a liason to your foreign Government, to aid the Sandros and assist it in regards to your government's interests. You are not internal affairs for your government, you simply advise the Captain on the best courses of action that could aid your homeland."

/datum/job/liaison/post_equip_rank(var/mob/person)
	var/my_title = "\a ["\improper [(person.mind ? (person.mind.role_alt_title ? person.mind.role_alt_title : person.mind.assigned_role) : "Loss Prevention Associate")]"]"
	for(var/mob/M in GLOB.player_list)
		if(M.client && M.mind)
			if(M.mind.assigned_role == "Loss Prevention Associate")
				to_chat(M, SPAN_NOTICE("<b>One of your employers, [my_title] named [person.real_name], is present on [GLOB.using_map.full_name].</b>"))

/datum/job/bodyguard
	title = "Foreign Protection Agent"
	department = "Support"
	department_flag = SPT
	total_positions = 0
	spawn_positions = 0
	supervisors = "the Foreign Diplomat"
	selection_color = "#3d3d7f"
	economic_power = 12
	minimal_player_age = 7
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/corporate_bodyguard
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/sv)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_ADEPT,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)
	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)
//	alt_titles = list()
	skill_points = 20
	access = list(access_liaison, access_tox, access_tox_storage, access_bridge, access_research,
						access_mining, access_mining_office, access_mining_station, access_xenobiology,
						access_xenoarch, access_nanotrasen, access_sec_guard, access_hangar,
						access_petrov, access_petrov_helm, access_maint_tunnels, access_emergency_storage,
						access_janitor, access_hydroponics, access_kitchen, access_bar, access_commissary)
	defer_roundstart_spawn = TRUE

/datum/job/bodyguard/is_position_available()
	if(..())
		for(var/mob/M in GLOB.player_list)
			if(M.client && M.mind && M.mind.assigned_role == "Workplace Liaison")
				return TRUE
	return FALSE

/datum/job/bodyguard/get_description_blurb()
	return "You are the Foreign Protection Agent. You are employed by one of the multitude of governments to protect their ambassadors, and your job is to prevent the loss of that Ambassador's life - even at the cost of your own. Good luck."

/datum/job/bodyguard/post_equip_rank(var/mob/person)
	var/my_title = "\a ["\improper [(person.mind ? (person.mind.role_alt_title ? person.mind.role_alt_title : person.mind.assigned_role) : "Loss Prevention Associate")]"]"
	for(var/mob/M in GLOB.player_list)
		if(M.client && M.mind)
			if(M.mind.assigned_role == "Workplace Liaison")
				to_chat(M, SPAN_NOTICE("<b>Your bodyguard, [my_title] named [person.real_name], is present on [GLOB.using_map.full_name].</b>"))
