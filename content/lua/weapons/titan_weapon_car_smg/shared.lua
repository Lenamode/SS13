if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if CLIENT then
SWEP.WepSelectIcon		= surface.GetTextureID( "titan_weapon_car_smg" )
	
	killicon.Add( "titan_weapon_car_smg", "vgui/hud/titan_weapon_car_smg", color_white )
end
-- Variables that are used on both client and server
SWEP.Gun = ("titan_weapon_car_smg") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "TitanFall"
SWEP.Author				= "Pillar"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "2" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.PrintName				= "C.A.R Smg"		-- Weapon name (Shown on HUD)	
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
SWEP.HoldType 				= "smg"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg and crossbow make for good sniper rifles

SWEP.ViewModelFOV			= 44
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_car_smg.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_irifle.mdl"	-- Weapon world model
SWEP.ShowWorldModel         = false
SWEP.Base 				= "halo_needler_base"

SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true

SWEP.Primary.Sound			= Sound("")		-- script that calls the primary fire sound
SWEP.Primary.SilencedSound 	= Sound("")
SWEP.Primary.RPM				= 170		-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 30	-- Size of a clip
SWEP.Primary.DefaultClip			= 90	-- Bullets you start with
SWEP.Primary.KickUp				= 0.2				-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.0			-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.01	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= true		-- Automatic/Semi Auto
SWEP.Primary.Ammo			= "smg1"	-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.UseHands      = true
-- Pistol, buckshot, and slam always ricochet. Use AirboatGun for a light metal peircing shotgun pellets
SWEP.SelectiveFire		= true
SWEP.CanBeSilenced		= true

SWEP.Secondary.ScopeZoom			= 15	
SWEP.Secondary.UseACOG			= false -- Choose one scope type
SWEP.Secondary.UseMilDot		= true	-- I mean it, only one	
SWEP.Secondary.UseSVD			= false	-- If you choose more than one, your scope will not show up at all
SWEP.Secondary.UseParabolic		= false	
SWEP.Secondary.UseElcan			= false
SWEP.Secondary.UseGreenDuplex	= false	
SWEP.Secondary.UseAimpoint		= false
SWEP.Secondary.UseMatador		= false

SWEP.Secondary.IronFOV			= 80		-- How much you 'zoom' in. Less is more! 

SWEP.data 				= {}
SWEP.data.ironsights		= 1
SWEP.ScopeScale 			= 0.4
SWEP.ReticleScale 			= 0.6

SWEP.Primary.NumShots	= 1		--how many bullets to shoot per trigger pull
SWEP.Primary.Damage		= 20	--base damage per bullet
SWEP.Primary.Spread		= 0.04	--define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = 0.04 -- ironsight accuracy, should be the same for shotguns

-- enter iron sight info and bone mod info below

SWEP.IronSightsPos = Vector(-4.241, 0.187, -0.299)
SWEP.IronSightsAng = Vector(1.697, 1.292, 0)
SWEP.RunSightsPos = Vector(7.742, -5.271, 2.709)
SWEP.RunSightsAng = Vector(-11.58, 31.843, 0)

SWEP.VElements = {
	["numbers2"] = { type = "Quad", bone = "body", rel = "", pos = Vector(-0.071, -0.899, -0.524), angle = Angle(-180, 3.739, -40.052), size = 0.032, draw_func = nil},
	["numbers1"] = { type = "Quad", bone = "body", rel = "", pos = Vector(-0.094, -1.42, 1.105), angle = Angle(180, 3.747, 0), size = 0.012, draw_func = nil}
}

SWEP.WElements = {
	["element_name"] = { type = "Model", model = "models/v_models/v_silenced_smg.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-44.982, 1.445, 19.188), angle = Angle(-101.036, 1.639, 1.526), size = Vector(1.014, 1.014, 1.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


function SWEP:Initialize()

	if CLIENT then

		self.VElements["numbers1"].draw_func = function( weapon )
			
			draw.SimpleText(""..weapon:Clip1(), "DefaultFixed", 0, 0, Color(0,161,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
	
		end

	end
	
		if CLIENT then

		self.VElements["numbers2"].draw_func = function( weapon )
			
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


 
function SWEP:PrimaryAttack()


if ( !self:CanPrimaryAttack() ) then return end

self.Weapon:EmitSound("car/fire.wav")

self:ShootBullet(10)
self:ShootBulletInformation()

self:TakePrimaryAmmo( 1 )

self.Owner:ViewPunch( Angle( 0, 0, 0 ) )
self.Weapon:SetNextPrimaryFire( CurTime() + 0.08)

local trace = self.Owner:GetEyeTrace()
local effectdata = EffectData()
effectdata:SetOrigin( trace.HitPos )
effectdata:SetNormal( trace.HitNormal )
effectdata:SetEntity( trace.Entity )
effectdata:SetAttachment( trace.PhysicsBone )
util.Effect( "", effectdata )

local effectdata = EffectData()
effectdata:SetOrigin( trace.HitPos )
effectdata:SetStart( self.Owner:GetShootPos() )
effectdata:SetAttachment( 1 )
effectdata:SetEntity( self.Weapon )
util.Effect( "", effectdata )
util.Effect( "compact_muzzle", effectdata )
util.Effect( "", effectdata )
if (SERVER) then
local owner=self.Owner
if self.Owner.SENT then
owner=self.Owner.SENT.Entity
end

local explosion = ents.Create( "env_fire" )
explosion:SetPos(trace.HitPos)
explosion:SetKeyValue( "iMagnitude" , "40" )
explosion:SetPhysicsAttacker(owner)
explosion:SetOwner(owner)
explosion:Spawn()
explosion:Fire("explode","",0)
explosion:Fire("kill","",100 )

end
end
