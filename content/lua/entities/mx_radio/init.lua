--[[
  __  __        _____           _ _       
 |  \/  |      |  __ \         | (_)      
 | \  / |_  __ | |__) |__ _  __| |_  ___  
 | |\/| \ \/ / |  _  // _` |/ _` | |/ _ \ 
 | |  | |>  <  | | \ \ (_| | (_| | | (_) |
 |_|  |_/_/\_\ |_|  \_\__,_|\__,_|_|\___/ 
--]]

AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

//create settings file
if !file.Exists( "mxradio_settings.txt", "DATA" ) then
	local settings = {}
	settings[1] = "Model=models/cires992/props2/coffeemaker01.mdl"
	settings[2] = "ExplodeOnDamage=true"
	
	local SFile = file.Open( "mxradio_settings.txt", "a", "DATA" )
		if !SFile then return end
		for  k,v in pairs(settings) do
			SFile:Write(settings[k].."\n")
		end
	SFile:Close()
end

local SFile = file.Read("mxradio_settings.txt", "DATA")
SFile = string.Split( SFile, "\n" )

local mdl =  string.Explode( "=", SFile[1] )
mxModel = string.Trim(mdl[2])


local ShouldExplode = string.Split( SFile[2], "=" )
ShouldExplode = string.lower(ShouldExplode[2])
ShouldExplode = string.Trim(ShouldExplode)

if ShouldExplode == "false" then
	ShouldExplode = false
else
	ShouldExplode = true
end


/////////////////////////////////////////////////////////////
//Name: OnTakeDamage
/////////////////////////////////////////////////////////////
 ENT.OurHealth = 50;
 
 function ENT:OnTakeDamage(dmg)
 
	self:TakePhysicsDamage(dmg); -- React physically when getting shot/blown
	
	if (ShouldExplode) then
 
		if(self.OurHealth <= 0) then return; end -- If the health-variable is already zero or below it - do nothing
 
		self.OurHealth = self.OurHealth - dmg:GetDamage(); -- Reduce the amount of damage took from our health-variable
 
		if(self.OurHealth <= 0) then -- If our health-variable is zero or below it
			local explode = ents.Create( "env_explosion" ) //creates the explosion
				explode:SetPos( self:GetPos())
				//This will be where the player is looking (using)
				explode:SetOwner( self ) // this sets you as the person who made the explosion
				explode:Spawn() //this actually spawns the explosion
				explode:SetKeyValue( "iMagnitude", "20" ) //the magnitude
				explode:Fire( "Explode", 0, 0 )
			self:Remove(); -- Remove our entity
		end
	end
 end

/////////////////////////////////////////////////////////////
//Name: Use
/////////////////////////////////////////////////////////////
	wait = false
	function ENT:Use( activator, caller )
		if !wait then
			wait = true
			//send to activator
			radio = activator:GetEyeTrace().Entity
			ply = activator
			StartRMenu(ply, radio)
			timer.Simple( 2, function() wait = false end )
		end
	end
	
/////////////////////////////////////////////////////////////
// Needed Spawn function
/////////////////////////////////////////////////////////////
	function ENT:SpawnFunction( ply, tr, ClassName )

		if ( !tr.Hit ) then return end
	
		local SpawnPos = tr.HitPos + tr.HitNormal
	
		local ent = ents.Create( ClassName )
		ent:SetPos( SpawnPos )
		ent:Spawn()
		ent:Activate()
	
		return ent
	
	end