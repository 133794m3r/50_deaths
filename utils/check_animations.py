#!/usr/bin/env python3

from PIL import Image, ImageFont, ImageDraw
import sys

files_str = sys.stdin.readline()
files = files_str.rstrip().split(' ')
# default output directory. Change this to whatever one you want.
out_dir = '/tmpdownload'
# The tiles are 16x16
TILE_SIZE = 16
TILES_HIGH = 0
BLOCKS_WIDE = 0
BLOCK_HEIGHT = 16
BLOCK_WIDTH = 16
# Scale is used for the numbered ones to make it easier to see.
SCALE = 3

for file in files:
	print(file)
	img0 = Image.open(f'{file}0.png')
	pixels = img0.load()

	# then create a new image that is twice as wide.
	# split it to get just the filename.
	split_str = file.split('/')
	# the filename is the last item in the list.
	new_filename = split_str[-1]
	# the folder is the first item.
	folder = split_str[0]
	# the lines below are due to the blocks of each "section" being different.
	if new_filename in "Tree":
		# Trees "blocks" or what is one set of the same pattern is 3 tiles high by 6 wide.
		BLOCK_HEIGHT = TILE_SIZE * 3
		BLOCK_WIDTH = TILE_SIZE * 6

	elif new_filename in "Pit":
		# the pits are all 2x3.
		BLOCK_HEIGHT = TILE_SIZE * 2
		BLOCK_WIDTH = TILE_SIZE * 3
	elif new_filename in "Hill":
		# The Hill sprite is 4x4.
		BLOCK_WIDTH = TILE_SIZE * 4
		BLOCK_HEIGHT = TILE_SIZE * 4
	elif new_filename in "Map":
		# The map ones are 3x3
		BLOCK_HEIGHT = TILE_SIZE * 3
		BLOCK_WIDTH = TILE_SIZE * 3
	elif new_filename in "Ore":
		# The ore is 2x2 tiles.
		BLOCK_WIDTH = TILE_SIZE * 2
		BLOCK_HEIGHT = TILE_SIZE * 2
	elif new_filename == "Effect":
		# Effects start off as 3x3.
		BLOCK_WIDTH = TILE_SIZE
		BLOCK_HEIGHT = TILE_SIZE
	else:
	#all others are just a single tile wide and high.
		BLOCK_HEIGHT, BLOCK_WIDTH = TILE_SIZE, TILE_SIZE
	blank_pixels = 0
	print(img0.size)
	BLOCKS_WIDE = (img0.size[0] // BLOCK_WIDTH)
	BLOCKS_HIGH = (img0.size[1] // BLOCK_HEIGHT)
	sprites = []
	print(BLOCKS_WIDE, BLOCKS_HIGH)
	counter = 0
	middle_y = 0
	TILES_HIGH = img0.size[1] // TILE_SIZE
	TILES_WIDE = img0.size[0] // TILE_SIZE
	tiles_y = 0
	print('bw', BLOCK_WIDTH)
	for y in range(TILES_HIGH):
		# if the filename is effect we have to do it special.
		middle_y = (y * TILE_SIZE) + TILE_SIZE // 2
		tiles_y = (TILES_WIDE * y) + counter +1
		for x in range(BLOCKS_WIDE):
			blank_pixels = 0
			for z in range(BLOCK_WIDTH):
				cur_pixel = img0.getpixel(((x * BLOCK_WIDTH) + z, middle_y))

				if cur_pixel == 0:
					blank_pixels += 1
				elif type(cur_pixel) is tuple:
					if cur_pixel[3] == 0:
						blank_pixels += 1

			if blank_pixels != BLOCK_WIDTH:
				print('xa,xb', tiles_y + (x * 2), tiles_y + (x * 2) + 1)
				if BLOCK_WIDTH == 16:
					sprites.append((tiles_y + (x * 2), tiles_y + (x * 2) + 1))
				else:
					sprites.append([(tiles_y + (x * 2) + a,tiles_y + (x*2) + a +1) for a in range(BLOCKS_WIDE)])

		counter += TILES_WIDE
	print(sprites)
