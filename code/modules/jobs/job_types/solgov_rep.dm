/*
SolGov Representative
*/

/datum/job/solgov
	name = "SolGov Representative"
	total_positions = 2
	spawn_positions = 2
	wiki_page = "Government_Attaché"
	minimal_player_age = 7
	exp_requirements = 180
	officer = TRUE
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY

	access = list(ACCESS_LAWYER, ACCESS_COURT, ACCESS_SECURITY, ACCESS_BRIG, ACCESS_SEC_DOORS, ACCESS_WEAPONS,
				ACCESS_HEADS, ACCESS_MAINT_TUNNELS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_SOLGOV)

	minimal_access = list(ACCESS_LAWYER, ACCESS_COURT, ACCESS_SECURITY, ACCESS_BRIG, ACCESS_SEC_DOORS, ACCESS_WEAPONS,
						ACCESS_HEADS, ACCESS_MAINT_TUNNELS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_SOLGOV)

	display_order = JOB_DISPLAY_ORDER_SOLGOV
