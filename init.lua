minetest.override_item("default:dirt", {
	groups = {crumbly = 3, soil = 1, falling_node = 1},
})
minetest.override_item("default:dirt_with_grass", {
	groups = {crumbly = 3, soil = 1, falling_node = 1},
})
minetest.override_item("default:dirt_with_grass_footsteps", {
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1, falling_node = 1},
})
minetest.override_item("default:dirt_with_dry_grass", {
	groups = {crumbly = 3, soil = 1, falling_node = 1},
})
minetest.override_item("default:dirt_with_snow", {
	groups = {crumbly = 3, soil = 1, falling_node = 1},
})

repose = {}

function repose.register(name)

minetest.register_abm({
	nodenames = {name},
	interval = 1,
	chance = 1,
	action = function(pos, node)
		local north = minetest.get_node({x = pos.x, y = pos.y, z = pos.z + 1})
		local east = minetest.get_node({x = pos.x + 1, y = pos.y, z = pos.z})
		local south = minetest.get_node({x = pos.x, y = pos.y, z = pos.z - 1})
		local west = minetest.get_node({x = pos.x - 1, y = pos.y, z = pos.z})
		local northdown = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z + 1})
		local eastdown = minetest.get_node({x = pos.x + 1, y = pos.y - 1, z = pos.z})
		local southdown = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z - 1})
		local westdown = minetest.get_node({x = pos.x - 1, y = pos.y - 1, z = pos.z})
		local down = minetest.get_node({x = pos.x, y = pos.y - 1, z = pos.z})
		local northopen
		if north.name == "air" or north.name == "default:water_source" or north.name == "default:water_flowing" or north.name == "default:river_water_source" or north.name == "default:river_water_flowing" then
		northopen = true else northopen = false end
		local eastopen
		if east.name == "air" or east.name == "default:water_source" or east.name == "default:water_flowing" or east.name == "default:river_water_source" or east.name == "default:river_water_flowing" then
		eastopen = true else eastopen = false end
		local southopen
		if south.name == "air" or south.name == "default:water_source" or south.name == "default:water_flowing" or south.name == "default:river_water_source" or south.name == "default:river_water_flowing" then
		southopen = true else southopen = false end
		local westopen
		if west.name == "air" or west.name == "default:water_source" or west.name == "default:water_flowing" or west.name == "default:river_water_source" or west.name == "default:river_water_flowing" then
		westopen = true else westopen = false end
		local northdownopen
		if northdown.name == "air" or northdown.name == "default:water_source" or northdown.name == "default:water_flowing" or northdown.name == "default:river_water_source" or northdown.name == "default:river_water_flowing" then
		northdownopen = true else northdownopen = false end
		local eastdownopen
		if eastdown.name == "air" or eastdown.name == "default:water_source" or eastdown.name == "default:water_flowing" or eastdown.name == "default:river_water_source" or eastdown.name == "default:river_water_flowing" then
		eastdownopen = true else eastdownopen = false end
		local southdownopen
		if southdown.name == "air" or southdown.name == "default:water_source" or southdown.name == "default:water_flowing" or southdown.name == "default:river_water_source" or southdown.name == "default:river_water_flowing" then
		southdownopen = true else southdownopen = false end
		local westdownopen
		if westdown.name == "air" or westdown.name == "default:water_source" or westdown.name == "default:water_flowing" or westdown.name == "default:river_water_source" or westdown.name == "default:river_water_flowing" then
		westdownopen = true else westdownopen = false end
		local downopen
		if down.name == "air" or down.name == "default:water_source" or down.name == "default:water_flowing" or down.name == "default:river_water_source" or down.name == "default:river_water_flowing" then
		downopen = true else downopen = false end
		if downopen then
			minetest.set_node(pos, {name = "air"})
			minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z}, {name = name})
		else
			if northopen and northdownopen then
				minetest.set_node(pos, {name = "air"})
				minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z + 1}, {name = name})
			elseif eastopen and eastdownopen then
				minetest.set_node(pos, {name = "air"})
				minetest.set_node({x = pos.x + 1, y = pos.y - 1, z = pos.z}, {name = name})
			elseif southopen and southdownopen then
				minetest.set_node(pos, {name = "air"})
				minetest.set_node({x = pos.x, y = pos.y - 1, z = pos.z - 1}, {name = name})
			elseif westopen and westdownopen then
				minetest.set_node(pos, {name = "air"})
				minetest.set_node({x = pos.x - 1, y = pos.y - 1, z = pos.z}, {name = name})
			end
		end
	end,
})

end

repose.register("default:sand")
repose.register("default:gravel")
repose.register("default:dirt")
repose.register("default:dirt_with_grass")
repose.register("default:dirt_with_grass_footsteps")
repose.register("default:dirt_with_dry_grass")
repose.register("default:dirt_with_snow")
