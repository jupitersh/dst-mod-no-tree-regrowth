--Disable the component of desolationspawner
GLOBAL.require("components/desolationspawner")._ctor = function() end

--Disable the use of plantregrowth
local plantregrowth_list = {
	"evergreen",
	"evergreen_sparse",
	"twiggytree",
	"deciduoustree",
}

--Whether to disable moon tree growth
if GetModConfigData("disable_moontree_regrowth") then
	table.insert(plantregrowth_list, "moon_tree")
end

--Whether to disable moon tree growth
if GetModConfigData("disable_mushtree_regrowth") then
	local mushtree_list = {
		"mushtree_tall",
		"mushtree_medium",
		"mushtree_small",
	}
	for k,v in pairs(mushtree_list) do
		table.insert(plantregrowth_list, v)
	end
end

for k,v in pairs(plantregrowth_list) do
	AddPrefabPostInit(v, function(inst)
		if inst.components and inst.components.plantregrowth then
			inst:RemoveComponent("plantregrowth")
		end
	end)
end

--Turn the Twiggytree into Sapling
if GetModConfigData("force_twiggytree_removal") then
	local twiggytree_list = {
		"twiggy_nut_sapling",
		"twiggytree",
	}

	for k,v in pairs(twiggytree_list) do
		AddPrefabPostInit(v, function(inst)
			inst:DoTaskInTime(0, function(inst)
				local x, y, z = inst.Transform:GetWorldPosition()
				inst:Remove()
				GLOBAL.SpawnPrefab("sapling").Transform:SetPosition(x, y, z)
			end)
		end)
	end
end