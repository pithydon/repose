minetest.register_abm({
	nodenames = {"repose:reinforced_dirt"},
	neighbors = {
		"repose:reinforced_dirt_with_grass",
		"repose:reinforced_dirt_with_dry_grass",
		"repose:reinforced_dirt_with_snow",
		"default:dirt_with_grass",
		"default:dirt_with_dry_grass",
		"default:dirt_with_snow",
		"group:grass",
		"group:dry_grass",
		"default:snow",
	},
	interval = 6,
	chance = 67,
	catch_up = false,
	action = function(pos, node)
		-- Most likely case, half the time it's too dark for this.
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		-- Look for likely neighbors.
		local p2 = minetest.find_node_near(pos, 1, {
			"repose:reinforced_dirt_with_grass", "repose:reinforced_dirt_with_dry_grass",
			"repose:reinforced_dirt_with_snow","default:dirt_with_grass",
			"default:dirt_with_dry_grass", "default:dirt_with_snow"})
		if p2 then
			-- But the node needs to be under air in this case.
			local n2 = minetest.get_node(above)
			if n2 and n2.name == "air" then
				local n3 = minetest.get_node(p2)
				local n4
				if n3.name == "default:dirt_with_grass" then n4 = "repose:reinforced_dirt_with_grass"
				elseif n3.name == "default:dirt_with_dry_grass" then n4 = "repose:reinforced_dirt_with_dry_grass"
				elseif n3.name == "default:dirt_with_snow" then n4 = "repose:reinforced_dirt_with_snow"
				else n4 = n3.name end
				minetest.set_node(pos, {name = n4})
				return
			end
		end

		-- Anything on top?
		local n2 = minetest.get_node(above)
		if not n2 then
			return
		end

		local name = n2.name
		-- Snow check is cheapest, so comes first.
		if name == "default:snow" then
			minetest.set_node(pos, {name = "repose:reinforced_dirt_with_snow"})
		-- Most likely case first.
		elseif minetest.get_item_group(name, "grass") ~= 0 then
			minetest.set_node(pos, {name = "repose:reinforced_dirt_with_grass"})
		elseif minetest.get_item_group(name, "dry_grass") ~= 0 then
			minetest.set_node(pos, {name = "repose:reinforced_dirt_with_dry_grass"})
		end
	end
})

minetest.register_abm({
	nodenames = {
		"repose:reinforced_dirt_with_grass",
		"repose:reinforced_dirt_with_dry_grass",
		"repose:reinforced_dirt_with_snow",
	},
	interval = 8,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "repose:reinforced_dirt"})
		end
	end
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	neighbors = {
		"repose:reinforced_dirt_with_grass",
		"repose:reinforced_dirt_with_dry_grass",
		"repose:reinforced_dirt_with_snow",
	},
	interval = 6,
	chance = 67,
	catch_up = false,
	action = function(pos, node)
		-- Most likely case, half the time it's too dark for this.
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		-- Look for likely neighbors.
		local p2 = minetest.find_node_near(pos, 1, {"repose:reinforced_dirt_with_grass",
				"repose:reinforced_dirt_with_dry_grass", "repose:reinforced_dirt_with_snow"})
		if p2 then
			-- But the node needs to be under air in this case.
			local n2 = minetest.get_node(above)
			if n2 and n2.name == "air" then
				local n3 = minetest.get_node(p2)
				local n4
				if n3.name == "repose:reinforced_dirt_with_grass" then n4 = "default:dirt_with_grass"
				elseif n3.name == "repose:reinforced_dirt_with_dry_grass" then n4 = "default:dirt_with_dry_grass"
				else n4 = "default:dirt_with_snow" end
				minetest.set_node(pos, {name = n4})
				return
			end
		end
	end
})
