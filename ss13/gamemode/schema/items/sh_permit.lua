ITEM.name = "Food Perimt"
ITEM.model = Model("models/gibs/metal_gib4.mdl")
ITEM.desc = "A business permit that belongs to %Owner|no one%."
ITEM.price = 50
ITEM.weight = 0
ITEM.business = false

function ITEM:OnBought(client)
	netstream.Start(client, "nut_RefreshBusiness")
end

function ITEM:GetBusinessData(client, data)
	return {Owner = client:Name()}
end