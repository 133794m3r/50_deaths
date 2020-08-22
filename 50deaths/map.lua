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
  nextobjectid = 11,
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
      image = "assets/tiles/Wall.png",
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
      image = "assets/tiles/Floor.png",
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
      image = "assets/tiles/Decor0.png",
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
      tiles = {
        {
          id = 169,
          animation = {
            {
              tileid = 32,
              duration = 500
            },
            {
              tileid = 35,
              duration = 500
            },
            {
              tileid = 36,
              duration = 500
            },
            {
              tileid = 37,
              duration = 500
            }
          }
        }
      }
    },
    {
      name = "Key",
      firstgid = 2016,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "assets/tiles/Key.png",
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
      image = "assets/tiles/Chest0.png",
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
      image = "assets/tiles/Door0.png",
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
    },
    {
      name = "Decor1",
      firstgid = 2096,
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 8,
      image = "assets/tiles/Decor1.png",
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
      encoding = "base64",
      compression = "gzip",
      data = "H4sIAAAAAAAAA+NiYGDgohDbArEdFhyKQxyE7ZH0BwKxDQvQHCRsx4JdHFkOWX8gUCwICQezYBdHlhvVP6ofm/50qJogEvSnQfURgzPQ9KfiySfYMAcH0Bwq5FsQBgDAwRuRAAQAAA=="
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
      encoding = "base64",
      compression = "gzip",
      data = "H4sIAAAAAAAAA2NgGByggp32dnTSwQ5agswh7v7BDG7SOGxvDNK4AwB1hxc2AAQAAA=="
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
      visible = false,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "base64",
      compression = "gzip",
      data = "H4sIAAAAAAAAA5NnYGCQHyQYHWATQ5bDpxebfnk0Nqn6KbWfUv1D3f2DWT8t0h8+syjNJ9TKcwDhsnF+AAQAAA=="
    }
  }
}
