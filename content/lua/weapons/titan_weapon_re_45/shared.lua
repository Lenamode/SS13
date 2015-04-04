if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if CLIENT then
SWEP.WepSelectIcon		= surface.GetTextureID( "titan_weapon_re_45" )
	
	killicon.Add( "titan_weapon_re_45", "vgui/hud/titan_weapon_re_45", color_white )
end
-- Variables that are used on both client and server
SWEP.Gun = ("titan_weapon_re_45") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "TitanFall"
SWEP.Author				= "Pillar"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "RE-45 AutoPistol"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 2				-- Slot in the weapon selection menu
SWEP.SlotPos				= 4			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox			= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   		= 	false	-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= false		-- Set false if you want no crosshair from hip
SWEP.Weight				= 30			-- Rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.XHair					= false	-- Used for returning crosshair after scope. Must be the same as DrawCrosshair
SWEP.BoltAction				= false		-- Is this a bolt action rifle?
SWEP.HoldType 				= "revolver"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 50
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_re45_pistol.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_pistol.mdl"	-- Weapon world model
SWEP.ShowWorldModel         = false
SWEP.Base 				= "halo_needler_base"
SWEP.ViewModelBoneMods = {
	["body"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.487, -1.367), angle = Angle(0, 0, 0) }
}



SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("p2011/wpn_re45_3p_wpnfire_firstshot_mid_2ch_v1_01.wav")		-- script that calls the primary fire sound
SWEP.Primary.SilencedSound 	= Sound("")
SWEP.Primary.RPM				= 800		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 20	-- Size of a clip
SWEP.Primary.DefaultClip			= 240	-- Bullets you start with
SWEP.Primary.KickUp				= 0.3				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.0			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.01	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "pistol"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.UseHands      = true
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets
SWEP.SelectiveFire		= true
SWEP.CanBeSilenced		= true

SWEP.Secondary.ScopeZoom			= 15	
SWEP.Secondary.UseACOG			= false -- Choose one scope type
SWEP.Secondary.UseMilDot		= false	-- I mean it, only one	
SWEP.Secondary.UseSVD			= false	-- If you choose more than one, your scope will not show up at all
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false	
SWEP.Secondary.UseAimpoint		= true
SWEP.Secondary.UseMatador		= false

SWEP.Secondary.IronFOV			=80		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}
SWEP.data.ironsights		= 1
SWEP.ScopeScale 			= 0.4
SWEP.ReticleScale 			= 0.6

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 10	--base damage per bullet
SWEP.Primary.Spread		= 0.05	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0.01 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(-3.224, -7.652, 1.644)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(7.742, -5.271, 2.709)
SWEP.RunSightsAng = Vector(-11.58, 31.843, 0)

SWEP.VElements = {
	["numbers"] = { type = "Quad", bone = "bolt", rel = "", pos = Vector(0, -0.304, -0.875), angle = Angle(180, 0, 0), size = 0.027, draw_func = nil}
}


SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/weapons/p2011_auto/w_p2011_auto.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.144, 1.83, 0.342), angle = Angle(-174.995, 178.804, 0), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}



function SWEP:DetectionHUD(trace)

	if trace.Entity and trace.Entity:IsNPC() || trace.Entity:IsPlayer() then
	color = Color(255,0,0,255)

	else
	color = Color( 0, 161, 255, 255 )
	end
	
	surface.SetTexture(surface.GetTextureID("crosshairs/dmr_hr"))
	surface.SetDrawColor( color )
	surface.DrawTexturedRect( ScrW()/2 - 31, ScrH()/2 - 0, 0, 0 )

end


function SWEP:Initialize()

	if CLIENT then

		self.VElements["numbers"].draw_func = function( weapon )
			
			draw.SimpleText(""..weapon:Clip1(), "DefaultFixed", 0, 0, Color(0,161,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	
		end

	end


	if CLIENT then
	
		-- We need to get these so we can scale everything to the player's current resolution.
		local iScreenWidth = surface.ScreenWidth()
		local iScreenHeight = surface.ScreenHeight()
		
		-- The following code is only slightly riped off from Night Eagle
		-- These tables are used to draw things like scopes and crosshairs to the HUD.
		-- so DONT GET RID OF IT!

		self.ScopeTable = {}
		self.ScopeTable.l = iScreenHeight*self.ScopeScale
		self.ScopeTable.x1 = 0.5*(iScreenWidth + self.ScopeTable.l)
		self.ScopeTable.y1 = 0.5*(iScreenHeight - self.ScopeTable.l)
		self.ScopeTable.x2 = self.ScopeTable.x1
		self.ScopeTable.y2 = 0.5*(iScreenHeight + self.ScopeTable.l)
		self.ScopeTable.x3 = 0.5*(iScreenWidth - self.ScopeTable.l)
		self.ScopeTable.y3 = self.ScopeTable.y2
		self.ScopeTable.x4 = self.ScopeTable.x3
		self.ScopeTable.y4 = self.ScopeTable.y1
		self.ScopeTable.l = (iScreenHeight + 1)*self.ScopeScale -- I don't know why this works, but it does.

		self.QuadTable = {}
		self.QuadTable.x1 = 0
		self.QuadTable.y1 = 0
		self.QuadTable.w1 = iScreenWidth
		self.QuadTable.h1 = 0.5*iScreenHeight - self.ScopeTable.l
		self.QuadTable.x2 = 0
		self.QuadTable.y2 = 0.5*iScreenHeight + self.ScopeTable.l
		self.QuadTable.w2 = self.QuadTable.w1
		self.QuadTable.h2 = self.QuadTable.h1
		self.QuadTable.x3 = 0
		self.QuadTable.y3 = 0
		self.QuadTable.w3 = 0.5*iScreenWidth - self.ScopeTable.l
		self.QuadTable.h3 = iScreenHeight
		self.QuadTable.x4 = 0.5*iScreenWidth + self.ScopeTable.l
		self.QuadTable.y4 = 0
		self.QuadTable.w4 = self.QuadTable.w3
		self.QuadTable.h4 = self.QuadTable.h3

		self.LensTable = {}
		self.LensTable.x = self.QuadTable.w3
		self.LensTable.y = self.QuadTable.h1
		self.LensTable.w = 2*self.ScopeTable.l
		self.LensTable.h = 2*self.ScopeTable.l

		self.ReticleTable = {}
		self.ReticleTable.wdivider = 3.125
		self.ReticleTable.hdivider = 1.7579/self.ReticleScale		-- Draws the texture at 512 when the resolution is 1600x900
		self.ReticleTable.x = (iScreenWidth/2)-((iScreenHeight/self.ReticleTable.hdivider)/2)
		self.ReticleTable.y = (iScreenHeight/2)-((iScreenHeight/self.ReticleTable.hdivider)/2)
		self.ReticleTable.w = iScreenHeight/self.ReticleTable.hdivider
		self.ReticleTable.h = iScreenHeight/self.ReticleTable.hdivider

		self.FilterTable = {}
		self.FilterTable.wdivider = 3.125
		self.FilterTable.hdivider = 1.7579/1.35	
		self.FilterTable.x = (iScreenWidth/2)-((iScreenHeight/self.FilterTable.hdivider)/2)
		self.FilterTable.y = (iScreenHeight/2)-((iScreenHeight/self.FilterTable.hdivider)/2)
		self.FilterTable.w = iScreenHeight/self.FilterTable.hdivider
		self.FilterTable.h = iScreenHeight/self.FilterTable.hdivider

		
	end
	
	self.Reloadaftershoot = 0 				-- Can't reload when firing
	self:SetWeaponHoldType(self.HoldType)
	self.Weapon:SetNetworkedBool("Reloading", false)
	if SERVER and self.Owner:IsNPC() then
		self:SetNPCMinBurst(3)			
		self:SetNPCMaxBurst(10)			-- None of this really matters but you need it here anyway
		self:SetNPCFireRate(1/(self.Primary.RPM/60))	
		self:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_VERY_GOOD )
	end
	
	if CLIENT then

	
		-- // Create a new table for every weapon instance
		self.VElements = table.FullCopy( self.VElements )
		self.WElements = table.FullCopy( self.WElements )
		self.ViewModelBoneMods = table.FullCopy( self.ViewModelBoneMods )

		self:CreateModels(self.VElements) -- create viewmodels
		self:CreateModels(self.WElements) -- create worldmodels
		
		-- // init view model bone build function
		if IsValid(self.Owner) and self.Owner:IsPlayer() then
		if self.Owner:Alive() then
			local vm = self.Owner:GetViewModel()
			if IsValid(vm) then
				self:ResetBonePositions(vm)
				-- // Init viewmodel visibility
				if (self.ShowViewModel == nil or self.ShowViewModel) then
					vm:SetColor(Color(255,255,255,255))
				else
					-- // however for some reason the view model resets to render mode 0 every frame so we just apply a debug material to prevent it from drawing
					vm:SetMaterial("Debug/hsv")			
				end
			end
			
		end
		end
		
	end
	
	if CLIENT then
		local oldpath = "vgui/hud/name" -- the path goes here
		local newpath = string.gsub(oldpath, "name", self.Gun)
		self.WepSelectIcon = surface.GetTextureID(newpath)
	end
	
	self.SightsPos = self.IronSightsPos
	self.SightsAng = self.IronSightsAng
	
end
