def get_file_infos(file, TILE_SIZE = 16):
	# then create a new image that is twice as wide.
	# split it to get just the filename.
	split_str = file.split('/')
	# the filename is the last item in the list.
	new_filename = split_str[-1]
	# the folder is the first item.
	folder = split_str[-2]

	# the lines below are due to the blocks of each "section" being different.
	if new_filename == "Tree":
		# Trees "blocks" or what is one set of the same pattern is 3 tiles high by 6 wide.
		BLOCK_HEIGHT = TILE_SIZE * 3
		BLOCK_WIDTH = TILE_SIZE * 6

	elif new_filename == "Pit":
		# the pits are all 2x3.
		BLOCK_HEIGHT = TILE_SIZE * 2
		BLOCK_WIDTH = TILE_SIZE * 8
	elif new_filename == "Hill":
		# The Hill sprite is 4x4.
		BLOCK_WIDTH = TILE_SIZE * 4
		BLOCK_HEIGHT = TILE_SIZE * 4
	elif new_filename == "Map":
		# The map ones are 3x3
		BLOCK_HEIGHT = TILE_SIZE * 3
		BLOCK_WIDTH = TILE_SIZE * 3
	elif new_filename == "Ore":
		# The ore is 2x2 tiles.
		BLOCK_WIDTH = TILE_SIZE * 5
		BLOCK_HEIGHT = TILE_SIZE * 1
	elif new_filename == "Effect":
		# Effects start off as 3x3.
		BLOCK_WIDTH = TILE_SIZE * 3
		BLOCK_HEIGHT = TILE_SIZE * 3
	else:
		# all others are just a single tile wide and high.
		BLOCK_HEIGHT, BLOCK_WIDTH = TILE_SIZE, TILE_SIZE

	return BLOCK_HEIGHT, BLOCK_WIDTH, folder, new_filename
