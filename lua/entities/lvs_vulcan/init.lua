AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "sh_turret.lua" )
AddCSLuaFile( "sh_tracks.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_optics.lua" )
AddCSLuaFile( "cl_tankview.lua" )
include("shared.lua")
include("sh_turret.lua")
include("sh_tracks.lua")


function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(10,0,20), Angle(0,-90,0) )
	DriverSeat.HidePlayer = true

	local GunnerSeat = self:AddPassengerSeat( Vector(10,0,50), Angle(0,-90,0) )
	GunnerSeat.HidePlayer = false
	self:SetGunnerSeat( GunnerSeat )

	local ID = self:LookupAttachment( "muzzle_end" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretMG = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "ambient/fire/fire_big_loop1.wav", "ambient/fire/fire_big_loop1.wav" )
	self.SNDTurretMG:SetSoundLevel( 95 )
	self.SNDTurretMG:SetParent( self, ID )

	self:AddEngine( Vector(-72,0,72), Angle(0,-90,0) )
	self:AddFuelTank( Vector(-82,0,71), Angle(0,0,0), 800, LVS.FUELTYPE_PETROL )

	//FRONT ARMOR
	self:AddArmor( Vector(80,0,40), Angle( -25,0,0 ), Vector(-10,-30,-15), Vector(10,30,38), 1000, self.FrontArmor )

	//LEFT ARMOR
	self:AddArmor( Vector(15,35,35), Angle( 0,0,0 ), Vector(-70,-5,-15), Vector(40,5,40), 800, self.SideArmor )

	//RIGHT ARMOR
	self:AddArmor( Vector(15,-35,35), Angle( 0,0,0 ), Vector(-70,-5,-15), Vector(40,5,40), 800, self.SideArmor )

	//BACK ARMOR
	self:AddArmor( Vector(-80,0,60), Angle( 70,0,0 ), Vector(-5,-35,-15), Vector(5,35,50), 600, self.BackArmor )


	//TURRET ARMOR
	local TurretArmor = self:AddArmor( Vector(0,0,75), Angle(0,0,0), Vector(-35,-25,0), Vector(40,25,40), 1200, self.TurretArmor )
	TurretArmor.OnDestroyed = function( ent, dmginfo ) if not IsValid( self ) then return end self:SetTurretDestroyed( true ) end
	TurretArmor.OnRepaired = function( ent ) if not IsValid( self ) then return end self:SetTurretDestroyed( false ) end
	TurretArmor:SetLabel( "Turret" )
	self:SetTurretArmor( TurretArmor )

	self:AddTrailerHitch( Vector(-89.12,0,37.03), LVS.HITCHTYPE_MALE )
end

-- set material on death
function ENT:OnDestroyed()
	self:SetMaterial("props/metal_damaged")
end
