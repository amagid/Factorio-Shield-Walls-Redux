data:extend({
    {
    type = "item",
    name = "shielded-wall",
    icon = "__Shield-Walls-Redux__/graphics/icons/shield-wall.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "a[stone-wall]-b[shielded-wall]",
    place_result = "shielded-wall",
    stack_size = 100
    },
    {
    type = "item",
    name = "repulsor-wall",
    icon = "__Shield-Walls-Redux__/graphics/icons/repulsor-wall.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "a[stone-wall]-b[shielded-wall]-c[repulsor-wall]",
    place_result = "repulsor-wall",
    stack_size = 100
    },
    {
    type = "item",
    name = "shielded-gate",
    icon = "__Shield-Walls-Redux__/graphics/icons/shield-gate.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "a[wall]-b[sheilded-wall]-c[gate]-d[shielded-gate]",
    place_result = "shielded-gate",
    stack_size = 50
  },
    {
    type = "item",
    name = "repulsor-gate",
    icon = "__Shield-Walls-Redux__/graphics/icons/repulsor-gate.png",
    icon_size = 32,
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "a[wall]-b[sheilded-wall]-c[repulsor-wall]-d[gate]-e[shielded-gate]-f[repulsor-gate]",
    place_result = "repulsor-gate",
    stack_size = 50
  }
})
