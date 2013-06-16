ENT.Type = "anim"
ENT.Base = "base_gmodentity"

ENT.PrintName = "Pepperoni Pizza"
ENT.Author = "KoZ"
ENT.Contact = ""
ENT.Purpose = "eat the pizza and gain health"
ENT.Instructions = "use to eat" 
ENT.Category = "Pizza Mod"

ENT.Spawnable			= true
ENT.AdminSpawnable		= true

function ENT:SetupModel()

	self.Entity:SetModel("models/peppizza02/peppizza02.mdl")

end