
ENT.OpticsFov = 35
ENT.OpticsEnable = true
ENT.OpticsZoomOnly = true
ENT.OpticsFirstPerson = true
ENT.OpticsThirdPerson = false
ENT.OpticsPodIndex = {
	[1] = true,
}

local axis = Material( "lvs/circle_hollow.png" )
local sight = Material( "lvs/shermansights.png" )
local scope = Material( "lvs/scope.png" )

function ENT:PaintOptics( Pos2D, Col, PodIndex, Type )
	surface.SetMaterial( axis )
	surface.SetDrawColor( 255, 255, 255, 1 )
	surface.DrawTexturedRect( Pos2D.x - 6, Pos2D.y - 6, 16, 16 )
	surface.SetDrawColor( 0, 0, 0, 255, 1 )
	surface.DrawTexturedRect( Pos2D.x - 8, Pos2D.y - 8, 16, 16 )

	surface.SetMaterial( sight )
	surface.SetDrawColor( 0, 0, 0, 150 )
	surface.DrawTexturedRect( Pos2D.x - 210, Pos2D.y - 23, 420, 420 )

	self:DrawRotatedText( "FLAME", Pos2D.x + 35, Pos2D.y + 10, "LVS_FONT_PANEL", Color(0,0,0,220), 0)

	local diameter = ScrH()
	local radius = diameter * 0.5

	surface.SetMaterial( scope )
	surface.SetDrawColor( 0, 0, 0, 50 )
	surface.DrawTexturedRect( Pos2D.x - radius, Pos2D.y - radius, diameter, diameter )
end
