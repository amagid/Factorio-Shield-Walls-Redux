data:extend({
  {
    type = "recipe",
    name = "shielded-wall",
	energy_required = 10,
    enabled = false,
    ingredients = 
	{
	   {"hazard-concrete", 10},
	   {"construction-robot",5}
	},
    result = "shielded-wall",
    requester_paste_multiplier = 10
  },
  {
    type = "recipe",
    name = "repulsor-wall",
	energy_required = 20,
    enabled = false,
    ingredients = 
	{
	   {"shielded-wall", 1},
	   {"uranium-fuel-cell",10}
	},
    result = "repulsor-wall",
    requester_paste_multiplier = 10
  },
    {
    type = "recipe",
    name = "shielded-gate",
	energy_required = 10,
    enabled = false,
    ingredients = 
	{
	   {"shielded-wall", 10},
	},
    result = "shielded-gate",
    requester_paste_multiplier = 10
  },
  {
    type = "recipe",
    name = "repulsor-gate",
	energy_required = 20,
    enabled = false,
    ingredients = 
	{
	   {"repulsor-wall", 10},
	},
    result = "repulsor-gate",
    requester_paste_multiplier = 10
  }

})
