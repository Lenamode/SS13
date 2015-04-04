--[[
  __  __        _____           _ _       
 |  \/  |      |  __ \         | (_)      
 | \  / |_  __ | |__) |__ _  __| |_  ___  
 | |\/| \ \/ / |  _  // _` |/ _` | |/ _ \ 
 | |  | |>  <  | | \ \ (_| | (_| | | (_) |
 |_|  |_/_/\_\ |_|  \_\__,_|\__,_|_|\___/ 
--]]


DEFINE_BASECLASS( "base_gmodentity" )
ENT.PrintName		= "Mx Radio"
ENT.Author			= "Max/Sixx"
ENT.Information		= "Mx Internet Radio Player"
ENT.Category		= "Space Station 13"

ENT.Editable			= false
ENT.Spawnable			= true
ENT.AdminOnly			= false
ENT.RenderGroup 		= RENDERGROUP_TRANSLUCENT

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Shared Stuff
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////
//Name: Initialize
/////////////////////////////////////////////////////////////
function ENT:Initialize()

	if ( SERVER ) then
		self:SetModel(mxModel)
		self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
		self:SetMoveType( MOVETYPE_VPHYSICS )   -- after all, gmod is a physics
		self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
		
		--Wake the physics object up. It's time to have fun!
		local phys = self:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:Wake()
		end

	else 
	
		self.LightColor = Vector( 0, 0, 0 )
	
	end
	
end