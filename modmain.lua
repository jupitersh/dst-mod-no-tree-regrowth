GLOBAL.require("components/desolationspawner")._ctor = function() end

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