AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "cl_tankview.lua" )
AddCSLuaFile( "cl_attached_playermodels.lua" )
AddCSLuaFile( "sh_turret.lua" )
AddCSLuaFile( "sh_tracks.lua" )
include("shared.lua")
include("sh_tracks.lua")
include("sh_turret.lua")

function ENT:OnSpawn( PObj )
	local DriverSeat = self:AddDriverSeat( Vector(-20.3,15.6,35), Angle(0,-90,0) )
	DriverSeat.HidePlayer = true

	local GunnerSeat = self:AddPassengerSeat( Vector(-8.1,-10.9,35), Angle(0,-90,0) )
	GunnerSeat.HidePlayer = true
	self:SetGunnerSeat( GunnerSeat )

	local ID = self:LookupAttachment( "muzzle_end" )
	local Muzzle = self:GetAttachment( ID )
	self.SNDTurretMG = self:AddSoundEmitter( self:WorldToLocal( Muzzle.Pos ), "ambient/fire/fire_big_loop1.wav", "ambient/fire/fire_big_loop1.wav" )
	self.SNDTurretMG:SetSoundLevel( 95 )
	self.SNDTurretMG:SetParent( self, ID )

	//FRONT ARMOR
	self:AddArmor( Vector(30,0,35), Angle( 0,0,0 ), Vector(-10,-35,15), Vector(10,35,55), 800, self.FrontArmor )
	self:AddArmor( Vector(60,0,45), Angle( 0,0,0 ), Vector(-10,-35,-15), Vector(10,35,10), 800, self.FrontArmor )

	//LEFT ARMOR
	self:AddArmor( Vector(-30,35,35), Angle( 0,0,0 ), Vector(-40,-10,-15), Vector(60,10,55), 600, self.SideArmor )

	//RIGHT ARMOR
	self:AddArmor( Vector(-30,-35,35), Angle( 0,0,0 ), Vector(-40,-10,-15), Vector(60,10,55), 600, self.SideArmor )

	//BACK ARMOR
	self:AddArmor( Vector(-75,0,35), Angle( 0,0,0 ), Vector(-10,-35,-15), Vector(10,35,45), 400, self.BackArmor )

	self:AddEngine( Vector(52,0,52), Angle(0,-90,0) )
	self:AddFuelTank( Vector(-84,0,32), Angle(0,0,0), 600, LVS.FUELTYPE_PETROL )

	self:AddTrailerHitch( Vector(-73,0,25), LVS.HITCHTYPE_MALE )
end
