-- Called when the default armour is needed
function SCHEMA:PlayerSpawn(client)
	if (client:Team() == FACTION_SECURITY) then
			client:SetArmor(100)
		else
			client:SetArmor(200)
		end
	end
-- badlads

function SCHEMA:PlayerFootstep(client, position, foot, soundName, volume)
	if (client:IsRunning()) then
		if (client:Team() == FACTION_SECURITY) then
			client:EmitSound("npc/metropolice/gear"..math.random(1, 6)..".wav", 50) 		--cuz they're wearing heavy gear

			return true
		end
	end
end

function SCHEMA:GetDefaultInv(inventory, client, data)
	
	if (data.faction == FACTION_ASSISTANT or data.faction == FACTION_SECURITY or data.faction == FACTION_ENGINEER or data.faction == FACTION_MEDICAL) then
		inventory:Add("sid", 1, {
			Digits = math.random(111, 999),
			Owner = data.charname
		})
	end
end

