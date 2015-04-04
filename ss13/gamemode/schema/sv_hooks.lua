-- Called when the default armour is needed
function SCHEMA:PlayerSpawn(client)
	if (client:Team() == FACTION_SECURITY) then
			client:SetArmor(100)
		else
			client:SetArmor(200)
		end
	end
-- badlads

function SCHEMA:PlayerSpawn(client)
	if (client:Team() == FACTION_ANDROID) then
			client:SetArmor(70)
		else
			client:SetArmor(150)
		end
	end


function SCHEMA:PlayerFootstep(client, position, foot, soundName, volume)
	if (client:IsRunning()) then
		if (client:Team() == FACTION_SECURITY) then
			client:EmitSound("npc/metropolice/gear"..math.random(1, 6)..".wav", 50) 		--cuz they're wearing heavy gear

			return true
		elseif (client:Team() == FACTION_ANDROID) then
			client:EmitSound("npc/combine_soldier/gear"..math.random(1, 6)..".wav", 40)		 --bc they're fucking robots

			return true
		end
	end
end

function SCHEMA:GetDefaultInv(inventory, client, data)
	if (data.faction == FACTION_ASSISTANT) then
		data.chardata.digits = nut.util.GetRandomNum(5)

		inventory:Add("sid", 1, {
			Name = data.charname,
			Digits = data.chardata.digits
		})
	end
-- Gives the local player a station ID Card

if (data.faction == FACTION_ENGINEER or data.faction == FACTION_SECURITY or data.faction == FACTION_MEDICAL ) then
		data.chardata.digits = nut.util.GetRandomNum(5)

		inventory:Add("sid", 1, {
			Name = data.charname,
			Digits = data.chardata.digits
		})
		inventory:Add("flashlight", 1)
		end
	then  if (nut.item.Get("radio")) then
			inventory:Add("radio", 1, {
				Freq = nut.config.radioFreq
			})
		end

function SCHEMA:PlayerPainSound(client)
	if (client:Team() == FACTION_ANDROID) then
		return "npc/metropolice/pain"..math.random(1, 3)..".wav"
-- They shouldn't sound like humans.

