CLASS.name = "Chef"
CLASS.faction = FACTION_ASSISTANT
CLASS.default = false
-- Function to give the chef's food permits.
function SCHEMA:GivePermit(client, inventory)
	if (data.class == CLASS_JANITOR) then
		inventory:Add("foodpermit", 1)
end
CLASS_JANITOR = CLASS.index
