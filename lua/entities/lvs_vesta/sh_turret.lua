
include("entities/lvs_tank_wheeldrive/modules/sh_turret.lua")

ENT.TurretAimRate = 30

ENT.TurretRotationSound = "vehicles/tank_turret_loop1.wav"

ENT.TurretPitchPoseParameterName = "gun_pitch"
ENT.TurretPitchMin = -20
ENT.TurretPitchMax = 20
ENT.TurretPitchMul = 0.5
ENT.TurretPitchOffset = 0


ENT.TurretYawPoseParameterName = "gun_yaw"
ENT.TurretYawMul = 1
ENT.TurretYawOffset = -10