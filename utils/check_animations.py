#!/usr/bin/env python3

from PIL import Image, ImageFont, ImageDraw
import sys

from tiles_config import get_file_infos

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
TILESET_TEMPLATE_START = """<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.4" tiledversion="1.4.2" name="%s" tilewidth="16" tileheight="16" tilecount="%d" columns="%d">
	<image source="../../combined_assets/%s/%s" width="%d" height="%d"/>"""
for file in files:
	print(file)
	img0 = Image.open(f'{file}0.png')
	pixels = img0.load()

	BLOCK_HEIGHT, BLOCK_WIDTH, folder, new_filename = get_file_infos(file)

	blank_pixels = 0
	BLOCKS_WIDE = (img0.size[0] // BLOCK_WIDTH)
	BLOCKS_HIGH = (img0.size[1] // BLOCK_HEIGHT)
	sprites = []
	counter = 0
	middle_y = 0
	TILES_HIGH = img0.size[1] // TILE_SIZE
	TILES_WIDE = img0.size[0] // TILE_SIZE
	tiles_y = 0
	BLOCK_TILES = BLOCK_WIDTH // TILE_SIZE
	TOTAL_TILES = TILES_HIGH * TILES_WIDE
	print(TILESET_TEMPLATE_START % (new_filename, TOTAL_TILES, TILES_WIDE, folder, new_filename, img0.size[1], img0.size[0]))
	for y in range(TILES_HIGH):
		if new_filename == "Effect":
			# for row 14+ we go to 1x1 objects.
			if y > 14:
				BLOCK_WIDTH = TILE_SIZE
				BLOCK_HEIGHT = TILE_SIZE
				BLOCK_TILES = 1

		# The reptiles has the guys logo at the bottom and to just copy it once I do it here.
		elif new_filename == "Reptile" and y > 11:
			BLOCK_WIDTH = TILE_SIZE * 8
			BLOCKS_WIDE = (img0.size[0] // BLOCK_WIDTH)
			BLOCK_TILES = 8
		# if the filename is effect we have to do it special.
		middle_y = (y * TILE_SIZE) + TILE_SIZE // 2
		tiles_y = (TILES_WIDE * y) + counter + 1

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
				if BLOCK_WIDTH == 16:
					sprites.append((tiles_y + (x * BLOCK_TILES), tiles_y + (x * BLOCK_TILES) + 1))
				else:
					tmp_sprites = []

					for a in range(BLOCK_TILES):
						sprites.append(
							# [
							(tiles_y + (x * BLOCK_TILES) + a, tiles_y + (x * BLOCK_TILES) + a + BLOCK_TILES)
						)
				# for a in range(BLOCK_TILES)])

				tiles_y += BLOCK_TILES

		counter += TILES_WIDE

	print(sprites)
