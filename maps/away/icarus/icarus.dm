#include "icarus_areas.dm"

/obj/effect/overmap/sector/icarus
	name = "forest planetoid"
	desc = "Sensors detect anomalous radiation area with the presence of artificial structures."
	icon_state = "globe"
	known = 0
	in_space = 0
	initial_generic_waypoints = list(
		"nav_icarus_1",
		"nav_icarus_2",
		"nav_icarus_antag"
	)

/obj/effect/overmap/sector/icarus/New(nloc, max_x, max_y)
	name = "[generate_planet_name()], \a [name]"
	..()

obj/effect/icarus/irradiate
	var/radiation_power = 20//20 Bq. Dangerous but survivable for 10-15 minutes if crew is too lazy to read away map description
	var/datum/radiation_source/S
	var/req_range = 100//to cover whole level

obj/effect/icarus/irradiate/Initialize()
	. = ..()
	S = new()
	S.flat = TRUE
	S.range = req_range
	S.respect_maint = FALSE
	S.decay = FALSE
	S.source_turf = get_turf(src)
	S.update_rad_power(radiation_power)
	SSradiation.add_source(S)

obj/effect/icarus/irradiate/Destroy()
	. = ..()
	QDEL_NULL(S)

/datum/map_template/ruin/away_site/icarus
	name = "Fallen Soteria"
	id = "awaysite_icarus"
	description = "The crashlanding site of the TRCV Soteria."
	suffixes = list("icarus/icarus-1.dmm", "icarus/icarus-2.dmm")
	cost = 2

/obj/effect/shuttle_landmark/nav_icarus/nav1
	name = "Planetary Navpoint #1"
	landmark_tag = "nav_icarus_1"
	flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/nav_icarus/nav2
	name = "Planetary Navpoint #2"
	landmark_tag = "nav_icarus_2"
	flags = SLANDMARK_FLAG_AUTOSET

/obj/effect/shuttle_landmark/nav_icarus/nav3
	name = "Planetary Navpoint #3"
	landmark_tag = "nav_icarus_antag"
	flags = SLANDMARK_FLAG_AUTOSET

obj/structure/icarus/broken_cryo
	name = "destroyed cryo sleeper"
	desc = "A mangled cryo sleeper with evidence that someone was inside when it was crushed. It looks like you could pry it open."
	icon = 'maps/away/icarus/icarus_sprites.dmi'
	icon_state = "broken_cryo"
	anchored = 1
	density = 1
	var/closed = 1
	var/busy = 0

obj/structure/icarus/broken_cryo/attack_hand(mob/user)
	..()
	if (closed)
		to_chat(user, "<span class='notice'>You tug at the glass but can't open it with your hands alone.</span>")
	else
		to_chat(user, "<span class='notice'>The glass is already open.</span>")


/obj/structure/icarus/broken_cryo/attackby(obj/item/W as obj, mob/user as mob)
	if (busy)
		to_chat(user, "<span class='notice'>Someone else is attempting to open this.</span>")
		return
	if (closed)
		if (isCrowbar(W))
			busy = 1
			visible_message("[user] starts to pry the glass cover off of \the [src].")
			if (!do_after(user, 50, src))
				visible_message("[user] stops trying to pry the glass off of \the [src].")
				busy = 0
				return
			closed = 0
			busy = 0
			icon_state = "broken_cryo_open"
			var/obj/dead = new /obj/item/icarus/dead_personnel(loc)
			dead.dir = src.dir//skeleton is oriented as cryo
	else
		to_chat(user, "<span class='notice'>The glass cover is already open.</span>")

/obj/item/icarus/dead_personnel
	name = "partial skeleton remains"
	desc = "Human bones wrapped in the shredded remnants of a familiar grey uniform..."
	icon = 'maps/away/icarus/icarus_sprites.dmi'
	icon_state = "dead_personnel"
	w_class = ITEM_SIZE_LARGE//pile of bones

/obj/item/weapon/disk/icarus
	name = "black box backup disk"
	desc = "Digital storage. Inscription says: \"Deliver to Terran Government Officials!\". Content is encrypted with quantum crypthography methods."
	icon = 'icons/obj/items.dmi'
	icon_state = "nucleardisk"
	item_state = "card-id"
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/paper/icarus/log
	name = "Printed piece of paper"
	info = "\[LOG\]: Orbit stabilized. Next correction burst, est.: 2 hrs 12 m<br>\
			\[LOG\]: Orbit stabiliztion. Announcing...<br>\
			\[ANN\]: Attention all hands, TRCV Soteria is stabilizing orbit in 30 seconds. Prepare for possible gravitational spikes.<br>\
			\[LOG\]: Announcing complete.<br>\
			\[LOG\]: Preparing for burst: heating up impulse mass.<br>\
			\[WARN\]: Minor pressure alert, Reactor Cooling Loop 3.<br>\
			\[LOG\]: Burst ready. Bursting in 5 seconds.<br>\
			\[LOG\]: Orbit stabilized. Next correction burst, est.: 1 hr 47 m.<br>\
			\[ADM\]: Preparing shuttles for landing. Current status: required refuilling. <br>\
			\[REQ\]: Request to Engineering, Please refuel Shuttle #2... Sent.<br>\
			\[WARN\]: Minor pressure alert, Reactor Cooling Loop 1.<br>\
			\[RET\]: Request completed.<br>\
			\[LOG\]: Manual correction {Engine->Cooling->Pumps}: calculating new trend.<br>\
			\[LOG\]: Calculating complete. Notify ADMIN...<br>\
			\[ERR\]: Positive feedback loop in Engine Core! Prepare for emergency procedures.<br>\
			\[ERR\]: Positive feedback loop in Engine Core! Prepare for emergency procedures.<br>\
			\[ERR\]: Positive feedback loop in Engine Core! Prepare for emergency procedures.<br>\
			\[ERR\]: Positive feedback loop in Engine Core! Prepare for emergency procedures.<br>\
			\[ERR\]: Positive feedback loop in Engine Core! Prepare for emergency procedures.<br>\
			\[LOG\]: This error was muted for 120 seconds.<br>\
			\[WARN\]: Multiple hull breaches detected.<br>\
			\[WARN\]: Unexepected orbit change, calculating corrective burst.<br>\
			\[LOG\]: Preparing for burst: heating up impulse mass.<br>\
			\[ERR\]: Impulse mass: not found<br>\
			\[LOG\]: Orbit stabilizing: failed.<br>\
			\[WARN\]: Impact imminent... Preparing blackbox backup... Ready.<br>\
			\[LOG\]: Emergency shutdown!<br>\
			\[LOG\]: Now you can you safely turn off your computer.<br>"


/obj/item/weapon/paper/icarus/crew_roster
	name = "Printed piece of paper"
	info = "<center>\[terracrest]<BR>\
			<b></b><br>\
			TRCV Soteria Crew roster</center><br>\
			<b>Command</b><br>\
			\[list]\
			\[*]Captain: CAPT. Heinrich Brunheim\
			\[*]First Officer: Lt. Semyon Andors \
			\[*]CMO: Lt. Toko Nashamura\
			\[*]CE: Lt. Anna Lawrence\
			\[*]COS: Lt. Rand Forbarra\
			\[*]CSO: Dr. Carl Jozziliny\
			\[*]HM: Cdt. Gordon Johnson\
			\[/list]<br>\
			<b>Medical dept.</b><br>\
			\[list]\
			\[*]Physician: Lt. John Fors\
			\[*]Nurse: PO1 Antony Laffer\
			\[/list]<br>\
			<b>Engineering dept.</b><br>\
			\[list]\
			\[*]Engineer: CPO Ronda Atkins\
			\[*]Engineer: PO1 Peter Napp\
			\[/list]<br>\
			<b>Security dept.</b><br>\
			\[list]\
			\[*]SO: PO1 Nuri Batyam\
			\[*]SO: PO3 Benjamin Tho\
			\[*]SO: PO3 Tetha-12-Alpha\
			\[/list]<br>\
			<b>Exploration team.</b><br>\
			\[list]\
			\[*]CPO Alex Warda\
			\[*]PO1 William Lions\
			\[*]PO2 Hope Bafflow\
			\[*]PO1 Yuri Meadows\
			\[*]Dr. Tetha-12-Beta\
			\[list]"

/obj/item/toy/ship_model
	name = "table-top TRCV Soteria model"
	desc = "A small model of a spaceship mounted on a wooden stand. On the stand is engraved: \"TRCV Soteria 1:278th scale\". The small lights on the hull and the engine exhaust still light up and blink."
	icon = 'maps/away/icarus/icarus_sprites.dmi'
	icon_state = "model"

//to pass tests and make vesrion not depending on Torch code. Sol gov floor decal had to go though :(
/obj/structure/sign/icarus/solgov
	name = "\improper TAR Seal"
	desc = "A familiar seal showing this vessel is TAR property. This one looks like it's gone through hell."
	icon = 'maps/away/icarus/icarus_sprites.dmi'
	icon_state = "solgovseal"

/obj/item/clothing/under/icarus/ec_uniform
	name = "terran uniform"
	desc = "An older model of the utility uniform of the Terran Defence Force, later modified for the Xenocorps. It has a patch on the left sleeve signifying the wearer served on the TRCV Soteria."
	icon_state = "blackutility_crew"
	worn_state = "blackutility_crew"
	icon = 'maps/away/icarus/icarus_sprites.dmi'
	item_icons = list(slot_w_uniform_str = 'maps/away/icarus/icarus_sprites.dmi')

/obj/structure/sign/double/icarus/solgovflag
	name = "TAR Flag"
	desc = "The iconic flag of the Terran Amalgamated Republics, a symbol with many different meanings. This one looks like it's gone through hell. It's amazing it's still relatively intact."
	icon = 'maps/away/icarus/icarus_sprites.dmi'

/obj/structure/sign/double/icarus/solgovflag/left
	icon_state = "solgovflag-left"

/obj/structure/sign/double/icarus/solgovflag/right
	icon_state = "solgovflag-right"