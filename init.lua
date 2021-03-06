-- override nodes

minetest.override_item("default:sand", {
	groups = {crumbly = 3, falling_node = 1, falling_aor_node = 1, sand = 1}
})

minetest.override_item("default:desert_sand", {
	groups = {crumbly = 3, falling_node = 1, falling_aor_node = 1, sand = 1, soil = 1}
})

minetest.override_item("default:stone", {
	drop = "default:gravel"
})

minetest.override_item("default:gravel", {
	groups = {crumbly = 2, falling_node = 1, falling_aor_node = 1, stone = 1}
})

minetest.override_item("default:dirt", {
	groups = {crumbly = 3, soil = 1, falling_node = 1, falling_aor_node = 1}
})

minetest.override_item("default:dirt_with_grass", {
	groups = {crumbly = 3, soil = 1, falling_node = 1, falling_aor_node = 1}
})

minetest.override_item("default:dirt_with_grass_footsteps", {
	groups = {crumbly = 3, soil = 1, not_in_creative_inventory = 1, falling_node = 1, falling_aor_node = 1}
})

minetest.override_item("default:dirt_with_dry_grass", {
	groups = {crumbly = 3, soil = 1, falling_node = 1, falling_aor_node = 1}
})

minetest.override_item("default:dirt_with_snow", {
	groups = {crumbly = 3, soil = 1, falling_node = 1, falling_aor_node = 1}
})

minetest.override_item("farming:soil", {
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 2, grassland = 1, field = 1, falling_node = 1, falling_aor_node = 1}
})

minetest.override_item("farming:soil_wet", {
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 3, wet = 1, grassland = 1, field = 1, falling_node = 1, falling_aor_node = 1}
})

minetest.override_item("farming:desert_sand_soil", {
	groups = {crumbly = 3, not_in_creative_inventory = 1, falling_node = 1, falling_aor_node = 1, sand = 1, soil = 2, desert = 1, field = 1}
})

minetest.override_item("farming:desert_sand_soil_wet", {
	groups = {crumbly = 3, falling_node = 1, falling_aor_node = 1, sand = 1, not_in_creative_inventory = 1, soil = 3, wet = 1, desert = 1, field = 1}
})

-- new nodes

minetest.register_node("repose:reinforced_dirt", {
	description = "Reinforced Dirt",
	tiles = {"default_dirt.png"},
	groups = {crumbly = 3, soil = 1, falling_node = 1},
	sounds = default.node_sound_dirt_defaults(),
	soil = {
		base = "repose:reinforced_dirt",
		dry = "repose:reinforced_soil",
		wet = "repose:reinforced_soil_wet"
	}
})

minetest.register_node("repose:reinforced_sand", {
	description = "Reinforced Sand",
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults()
})

minetest.register_node("repose:reinforced_desert_sand", {
	description = "Reinforced Desert Sand",
	tiles = {"default_desert_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1, soil = 1},
	sounds = default.node_sound_sand_defaults(),
	soil = {
		base = "repose:reinforced_desert_sand",
		dry = "repose:reinforced_desert_sand_soil",
		wet = "repose:reinforced_desert_sand_soil_wet"
	}
})

minetest.register_node("repose:reinforced_dirt_with_grass", {
	description = "Reinforced Dirt with Grass",
	tiles = {"default_grass.png", "default_dirt.png", {name = "default_dirt.png^default_grass_side.png", tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, falling_node = 1},
	drop = "repose:reinforced_dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25}
	}),
	soil = {
		base = "repose:reinforced_dirt",
		dry = "repose:reinforced_soil",
		wet = "repose:reinforced_soil_wet"
	}
})

minetest.register_node("repose:reinforced_dirt_with_dry_grass", {
	description = "Reinforced Dirt with Dry Grass",
	tiles = {"default_dry_grass.png", "default_dirt.png", {name = "default_dirt.png^default_dry_grass_side.png", tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, falling_node = 1},
	drop = "repose:reinforced_dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4}
	}),
	soil = {
		base = "repose:reinforced_dirt",
		dry = "repose:reinforced_soil",
		wet = "repose:reinforced_soil_wet"
	}
})

minetest.register_node("repose:reinforced_dirt_with_snow", {
	description = "Reinforced Dirt with Snow",
	tiles = {"default_snow.png", "default_dirt.png", {name = "default_dirt.png^default_snow_side.png", tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1, falling_node = 1},
	drop = "repose:reinforced_dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15}
	}),
})

minetest.register_node("repose:reinforced_soil", {
	description = "Reinforced Soil",
	tiles = {"default_dirt.png^farming_soil.png", "default_dirt.png"},
	drop = "repose:reinforced_dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 2, grassland = 1, field = 1, falling_node = 1},
	sounds = default.node_sound_dirt_defaults(),
	soil = {
		base = "repose:reinforced_dirt",
		dry = "repose:reinforced_soil",
		wet = "repose:reinforced_soil_wet"
	}
})

minetest.register_node("repose:reinforced_soil_wet", {
	description = "Reinforced Wet Soil",
	tiles = {"default_dirt.png^farming_soil_wet.png", "default_dirt.png^farming_soil_wet_side.png"},
	drop = "repose:reinforced_dirt",
	groups = {crumbly = 3, not_in_creative_inventory = 1, soil = 3, wet = 1, grassland = 1, field = 1, falling_node = 1},
	sounds = default.node_sound_dirt_defaults(),
	soil = {
		base = "repose:reinforced_dirt",
		dry = "repose:reinforced_soil",
		wet = "repose:reinforced_soil_wet"
	}
})

minetest.register_node("repose:reinforced_desert_sand_soil", {
	description = "Reinforced Desert Sand Soil",
	drop = "repose:reinforced_desert_sand",
	tiles = {"farming_desert_sand_soil.png", "default_desert_sand.png"},
	groups = {crumbly = 3, not_in_creative_inventory = 1, falling_node = 1, sand = 1, soil = 2, desert = 1, field = 1},
	sounds = default.node_sound_sand_defaults(),
	soil = {
		base = "repose:reinforced_desert_sand",
		dry = "repose:reinforced_desert_sand_soil",
		wet = "repose:reinforced_desert_sand_soil_wet"
	}
})

minetest.register_node("repose:reinforced_desert_sand_soil_wet", {
	description = "Reinforced Wet Desert Sand Soil",
	drop = "repose:reinforced_desert_sand",
	tiles = {"farming_desert_sand_soil_wet.png", "farming_desert_sand_soil_wet_side.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1, not_in_creative_inventory = 1, soil = 3, wet = 1, desert = 1, field = 1},
	sounds = default.node_sound_sand_defaults(),
	soil = {
		base = "repose:reinforced_desert_sand",
		dry = "repose:reinforced_desert_sand_soil",
		wet = "repose:reinforced_desert_sand_soil_wet"
	}
})

-- crafting

minetest.register_craft({
	type = "shapeless",
	output = "default:cobble",
	recipe = {"default:gravel", "default:clay_lump"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:gravel",
	recipe = {"default:cobble"}
})

minetest.register_craft({
	type = "shapeless",
	output = "repose:reinforced_dirt",
	recipe = {"default:dirt", "default:paper"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:dirt",
	recipe = {"repose:reinforced_dirt"}
})

minetest.register_craft({
	type = "shapeless",
	output = "repose:reinforced_sand",
	recipe = {"default:sand", "default:paper"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:sand",
	recipe = {"repose:reinforced_sand"}
})

minetest.register_craft({
	type = "shapeless",
	output = "repose:reinforced_desert_sand",
	recipe = {"default:desert_sand", "default:paper"}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:desert_sand",
	recipe = {"repose:reinforced_desert_sand"}
})

minetest.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:gravel"
})

-- abm

dofile(minetest.get_modpath("repose").."/lgplabm.lua")

minetest.register_abm({
	nodenames = {"group:falling_aor_node"},
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
		local north2 = minetest.registered_nodes[north.name]
		local east2 = minetest.registered_nodes[east.name]
		local south2 = minetest.registered_nodes[south.name]
		local west2 = minetest.registered_nodes[west.name]
		local northdown2 = minetest.registered_nodes[northdown.name]
		local eastdown2 = minetest.registered_nodes[eastdown.name]
		local southdown2 = minetest.registered_nodes[southdown.name]
		local westdown2 = minetest.registered_nodes[westdown.name]
		local down2 = minetest.registered_nodes[down.name]
		local northdownopen if northdown2.buildable_to and northdown.name ~= "ignore" then northdownopen = true else northdownopen = false end
		local eastdownopen if eastdown2.buildable_to and eastdown.name ~= "ignore" then eastdownopen = true else eastdownopen = false end
		local southdownopen if southdown2.buildable_to and southdown.name ~= "ignore" then southdownopen = true else southdownopen = false end
		local westdownopen if westdown2.buildable_to and westdown.name ~= "ignore" then westdownopen = true else westdownopen = false end
		local downopen if down2.buildable_to and down.name ~= "ignore" then downopen = true else downopen = false end
		if downopen then
			minetest.set_node(pos, {name = "air"})
			minetest.place_node({x = pos.x, y = pos.y - 1, z = pos.z}, {name = node.name})
		else
			if north2.buildable_to and northdownopen then
				minetest.set_node(pos, {name = "air"})
				minetest.place_node({x = pos.x, y = pos.y - 1, z = pos.z + 1}, {name = node.name})
			elseif east2.buildable_to and eastdownopen then
				minetest.set_node(pos, {name = "air"})
				minetest.place_node({x = pos.x + 1, y = pos.y - 1, z = pos.z}, {name = node.name})
			elseif south2.buildable_to and southdownopen then
				minetest.set_node(pos, {name = "air"})
				minetest.place_node({x = pos.x, y = pos.y - 1, z = pos.z - 1}, {name = node.name})
			elseif west2.buildable_to and westdownopen then
				minetest.set_node(pos, {name = "air"})
				minetest.place_node({x = pos.x - 1, y = pos.y - 1, z = pos.z}, {name = node.name})
			end
		end
	end
})
