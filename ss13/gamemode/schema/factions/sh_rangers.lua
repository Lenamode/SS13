FACTION.name = "Desert Rangers"
FACTION.desc = "A group of people who care about the people of the wastes."
FACTION.color = Color(235, 235, 0)
FACTION.maleModels = {
	"models/ncr/rangercombatarmor.mdl",
	"models/ncr/desertranger.mdl"
}
-- Set the female models to be the same as male models.
FACTION.femaleModels = FACTION.maleModels
FACTION.isDefault = false


-- FACTION.index is defined when the faction is registered and is just a numeric ID.
-- Here, we create a global variable for easier reference to the ID.
FACTION_RANGERS = FACTION.index
