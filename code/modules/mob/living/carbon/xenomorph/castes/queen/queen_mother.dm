/mob/living/carbon/xenomorph/queen/mother
	caste_base_type = /datum/xeno_caste/queen/mother
	name = "Queen"
	desc = "A huge, looming alien creature. The biggest and the baddest."
	icon = 'ntf_modular/icons/Xeno/castes/queen_mother.dmi'
	icon_state = "Queen Walking"
	health = 500
	maxHealth = 500
	plasma_stored = 600
	pixel_x = -16
	mob_size = MOB_SIZE_BIG
	drag_delay = 8 //pulling a big dead xeno is hard
	tier = XENO_TIER_FOUR //Queen doesn't count towards population limit.
	upgrade = XENO_UPGRADE_NORMAL
	bubble_icon = "alienroyal"
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/hijack,
	)

// ***************************************
// *********** Init
// ***************************************
/mob/living/carbon/xenomorph/queen/mother/Initialize(mapload, do_not_set_as_ruler, _hivenumber)
	. = ..()
	playsound(loc, 'sound/voice/alien/queen_command.ogg', 75, 0)

// ***************************************
// *********** Mob overrides
// ***************************************

/mob/living/carbon/xenomorph/queen/mother/handle_special_state()
	if(is_charging >= CHARGE_ON)
		icon_state = "[xeno_caste.caste_name][(xeno_flags & is_a_rouny) ? " rouny" : ""] Charging"
		return TRUE
	return FALSE

/mob/living/carbon/xenomorph/queen/upgrade_xeno(newlevel, silent = FALSE)
	. = ..()
	hive?.update_leader_pheromones()

// ***************************************
// *********** Name
// ***************************************
/mob/living/carbon/xenomorph/queen/mother/generate_name()
			name = "Queen Mother"


// ***************************************
// *********** Death
// ***************************************
/mob/living/carbon/xenomorph/queen/mother/death_cry()
	playsound(loc, 'sound/voice/alien/queen_died.ogg', 75, 0)

/mob/living/carbon/xenomorph/queen/mother/xeno_death_alert()
	return
