data:extend({
   {
    type = "technology",
    name = "shielded-walls",
    icon = "__Shield-Walls-Redux__/graphics/icons/shield-walls.png",
	icon_size = 128,
	prerequisites = {"gates", "concrete", "military-3", "solar-energy", "construction-robotics"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "shielded-wall"
      },
      {
        type = "unlock-recipe",
        recipe = "shielded-gate"
      }

    },
    unit =
    {
      count = 250,
      ingredients = 
	  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1},
			{"military-science-pack", 2}
	  },
      time = 45
    },
    order = "a-k-b"
   },
   {
    type = "technology",
    name = "repulsor-walls",
    icon = "__Shield-Walls-Redux__/graphics/icons/repulsor-walls.png",
	icon_size = 128,
	prerequisites = {"military-4", "shielded-walls", "nuclear-power"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "repulsor-wall"
      },
      {
        type = "unlock-recipe",
        recipe = "repulsor-gate"
      }
    },
    unit =
    {
      count = 750,
      ingredients = 
	  {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1},
			{"military-science-pack", 2},
			{"production-science-pack", 1},
			{"high-tech-science-pack", 1}			
	  },
      time = 45
    },
    order = "a-k-b"
  }

  
  
})
