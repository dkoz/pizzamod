AddCSLuaFile( "shared.lua" )
include( "shared.lua" )
include( "../../config.lua" )

function ENT:SpawnFunction( ply, tr )
	
	if !tr.Hit then return end

	local SpawnPos = tr.HitPos + tr.HitNormal * 1

	local ent = ents.Create( "cheesepizza" )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	
	return ent
end

function ENT:Initialize()

	self.Entity:SetModel("models/cheesepizza01/cheesepizza01.mdl")
 
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )

	
	self.Index = self.Entity:EntIndex()
	
	local phys = self.Entity:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
	end
end

function ENT:Use(activator)
	local energyamount = PMConfig.energyamount
	local healthamount = PMConfig.healthamount

	if PMConfig.enablehunger then
		activator:SetSelfDarkRPVar("Energy", math.Clamp((activator:getDarkRPVar("Energy") or 100) + energyamount, 0, 100))
	end
	
	if PMConfig.enablehealth then
		activator:SetHealth(math.Clamp((activator:Health() or 100) + healthamount, 0, 100))
	end
	
	self.Entity:Remove()
	activator:EmitSound("pizzamod/eating.wav", 50, 100)
end
	