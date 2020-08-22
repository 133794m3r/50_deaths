return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 16,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 7,
  nextobjectid = 9,
  properties = {},
  tilesets = {
    {
      name = "Wall",
      firstgid = 1,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 20,
      image = "Wall.png",
      imagewidth = 320,
      imageheight = 816,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 1020,
      tiles = {}
    },
    {
      name = "Floor",
      firstgid = 1021,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 21,
      image = "Floor.png",
      imagewidth = 336,
      imageheight = 624,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 819,
      tiles = {}
    },
    {
      name = "Decor0",
      firstgid = 1840,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "Decor0.png",
      imagewidth = 128,
      imageheight = 352,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 176,
      tiles = {}
    },
    {
      name = "Key",
      firstgid = 2016,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "Key.png",
      imagewidth = 128,
      imageheight = 16,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 8,
      tiles = {}
    },
    {
      name = "Chest0",
      firstgid = 2024,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "Chest0.png",
      imagewidth = 128,
      imageheight = 48,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 24,
      tiles = {}
    },
    {
      name = "Door0",
      firstgid = 2048,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "Door0.png",
      imagewidth = 128,
      imageheight = 96,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 48,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 16,
      id = 2,
      name = "base",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 61, 62, 62, 62, 62, 62, 85, 62, 62, 62, 62, 62, 62, 63, 10,
        10, 81, 1084, 1085, 1085, 1085, 1086, 81, 1084, 1085, 1085, 1085, 1085, 1086, 81, 10,
        10, 81, 1105, 1106, 1106, 1106, 1107, 81, 1105, 1106, 1106, 1106, 1106, 1107, 81, 10,
        10, 81, 1105, 1106, 1106, 1106, 1107, 81, 1105, 1106, 1106, 1106, 1106, 1107, 81, 10,
        10, 81, 1105, 1106, 1106, 1106, 1107, 81, 1105, 1106, 1106, 1106, 1106, 1107, 81, 10,
        10, 81, 1105, 1106, 1106, 1106, 1107, 81, 1105, 1106, 1106, 1106, 1106, 1107, 81, 10,
        10, 81, 1105, 1106, 1106, 1106, 1107, 81, 1105, 1106, 1106, 1106, 1106, 1107, 81, 10,
        10, 81, 1105, 1106, 1106, 1106, 1107, 81, 1105, 1106, 1106, 1106, 1106, 1107, 81, 10,
        10, 81, 1105, 1106, 1106, 1106, 1107, 81, 1105, 1106, 1106, 1106, 1106, 1107, 81, 10,
        10, 81, 1105, 1106, 1106, 1106, 1107, 81, 1105, 1106, 1106, 1106, 1106, 1107, 81, 10,
        10, 81, 1105, 1106, 1106, 1106, 1107, 81, 1105, 1106, 1106, 1106, 1106, 1107, 81, 10,
        10, 81, 1105, 1106, 1106, 1127, 1107, 82, 1105, 1106, 1106, 1106, 1106, 1107, 81, 10,
        10, 81, 1126, 1127, 1127, 1127, 1127, 1127, 1127, 1127, 1127, 1127, 1127, 1128, 81, 10,
        10, 101, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 62, 2056, 103, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 16,
      id = 1,
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 1912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1929, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1897, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 2009, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2008, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "teleport_points",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      objects = {
        {
          id = 4,
          name = "G",
          type = "teleport",
          shape = "rectangle",
          x = 208,
          y = 240,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 1059,
          visible = true,
          properties = {
            ["to"] = "A"
          }
        },
        {
          id = 5,
          name = "A",
          type = "spawn",
          shape = "rectangle",
          x = 208,
          y = 208,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 1059,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 16,
      id = 3,
      name = "collision",
      visible = true,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "lua",
      data = {
        31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31,
        31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31,
        31, 31, 31, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 31, 31,
        31, 31, 0, 0, 0, 0, 0, 31, 0, 0, 0, 31, 0, 0, 31, 31,
        31, 31, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 31, 31,
        31, 31, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 31, 31,
        31, 31, 0, 0, 0, 0, 0, 31, 0, 0, 0, 31, 0, 0, 31, 31,
        31, 31, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 31, 31,
        31, 31, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 31, 31,
        31, 31, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 31, 31,
        31, 31, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 31, 31,
        31, 31, 0, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 31, 31,
        31, 31, 31, 0, 0, 0, 0, 31, 0, 0, 0, 0, 0, 0, 31, 31,
        31, 31, 0, 0, 0, 0, 0, 0, 0, 0, 31, 0, 0, 0, 31, 31,
        31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 0, 31, 31,
        31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31
      }
    }
  }
}
