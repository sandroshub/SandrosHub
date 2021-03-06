/datum/job/pathfinder
	title = "Chief Exploration Officer"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain and First Officer"
	selection_color = "#68099e"
	minimal_player_age = 1
	economic_power = 4
	ideal_character_age = 35
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/exploration/pathfinder
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_ADEPT,
	                    SKILL_SCIENCE     = SKILL_ADEPT,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT)
	skill_points = 22

	access = list(
		access_pathfinder, access_explorer, access_eva, access_maint_tunnels, access_bridge, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_expedition_shuttle_helm,
		access_guppy, access_hangar, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_maint, access_tox, access_tox_storage, access_research,
		access_xenobiology, access_xenoarch
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)

/datum/job/pathfinder/get_description_blurb()
	return "You are the Chief Exploration OFficer. Your duty is to organize and lead the expeditions to away sites, carrying out the Sandros' Primary Mission. You command Explorers. You make sure that expedition has the supplies and personnel it needs. You can pilot Charon if nobody else provides a pilot. Once on the away mission, your duty is to ensure that anything of scientific interest is brought back to the ship and passed to the relevant research lab."

/datum/job/nt_pilot
	title = "Shuttle Pilot"
	supervisors = "the Chief Exploration Officer"
	department = "Exploration"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	selection_color = "#68099e"
	economic_power = 10
	minimal_player_age = 2
	ideal_character_age = 25
	outfit_type = /decl/hierarchy/outfit/job/torch/passenger/pilot
	allowed_branches = list(
		/datum/mil_branch/fleet = /decl/hierarchy/outfit/job/torch/crew/exploration/pilot/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/o1
	)

	access = list(
		access_mining_office, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_maint, access_mining_station, access_expedition_shuttle,
		access_expedition_shuttle_helm, access_guppy, access_hangar, access_guppy_helm, access_mining, access_pilot,
		access_solgov_crew, access_eva, access_explorer, access_tox, access_tox_storage, access_research, access_xenobiology,
		access_xenoarch
	)
	min_skill = list(	SKILL_EVA   = SKILL_BASIC,
						SKILL_PILOT = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

/datum/job/explorer
	title = "Exploration Specialist"
	department = "Exploration"
	department_flag = EXP
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Captain, First Officer and Chief Exploration Officer"
	selection_color = "#68099e"
	ideal_character_age = 20
	outfit_type = /decl/hierarchy/outfit/job/torch/crew/exploration/explorer
	allowed_branches = list(/datum/mil_branch/fleet)

	allowed_ranks = list(
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4
	)
	min_skill = list(   SKILL_EVA = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERT,
	                    SKILL_WEAPONS     = SKILL_EXPERT)

	access = list(access_explorer, access_maint_tunnels, access_eva, access_emergency_storage,
		access_guppy_helm, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_petrov, access_petrov_analysis, access_petrov_phoron, access_petrov_toxins,
		access_petrov_chemistry, access_petrov_maint, access_tox, access_tox_storage, access_research,
		access_xenobiology, access_xenoarch
	)

	software_on_spawn = list(/datum/computer_file/program/deck_management)

/datum/job/explorer/get_description_blurb()
	return "You are an Explorer. Your duty is to go on expeditions to away sites. The Chief Explorations Officer is your team leader. You are to look for anything of economic or scientific interest to the TDF - mineral deposits, alien flora/fauna, artifacts. You will also likely encounter hazardous environments, aggressive wildlife or malfunctioning defense systems, so tread carefully."