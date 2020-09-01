#!/usr/bin/env python3

from PIL import Image, ImageFont, ImageDraw
import sys
from os import makedirs

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
# TILESET_TEMPLATE_START = """<?xml version="1.0" encoding="UTF-8"?>
# <tileset version="1.4" tiledversion="1.4.2" name="{filename}" tilewidth="16" tileheight="16" tilecount="{total_tiles}" columns="{tiles_width}">
#  <image source="../../combined_assets/{folder}/{filename}.png" width="{img_width}" height="{img_height}"/>"""
TILESET_TEMPLATE_START = """<?xml version="1.0" encoding="UTF-8"?>
 <tileset version="1.4" tiledversion="1.4.2" name="{filename}" tilewidth="16" tileheight="16" tilecount="{total_tiles}" columns="{tiles_width}">
  <image source="../../{folder}/{filename}.png" width="{img_width}" height="{img_height}"/>"""
TILE_ANIMATION_TEMPLATE = """\n <tile id="{id}">
  <animation>
    <frame tileid="{id}" duration="500" />
    <frame tileid="{id2}" duration="500" />
  </animation>
 </tile>"""

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
	#print(TILESET_TEMPLATE_START % (new_filename, TOTAL_TILES*2, TILES_WIDE * 2, folder, new_filename, img0.size[0]*2, img0.size[1]))
	tileset_xml = TILESET_TEMPLATE_START.format(filename=new_filename, total_tiles=TOTAL_TILES*2,
												tiles_width=TILES_WIDE*2, folder=folder,
												img_width=img0.size[0] * 2, img_height=img0.size[1])
	if new_filename ==
	for y in range(TILES_HIGH):
		if new_filename == "Effect":
			# for row 14+ we go to 1x1 objects.
			if y > 14:
				BLOCK_WIDTH = TILE_SIZE
				BLOCK_HEIGHT = TILE_SIZE
				BLOCK_TILES = 1
		elif new_filename == "GUI" and y == 7:
			BLOCK_TILES = 4
			BLOCK_WIDTH = TILE_SIZE * 4
			BLOCK_HEIGHT = TILE_SIZE * 1
			BLOCKS_WIDE = img0.size[0] // BLOCK_WIDTH
		# The reptiles has the guys logo at the bottom and to just copy it once I do it here.
		elif new_filename == "Reptile":
			# The 12th row and onwards has no animations and is just part of the textbox. No reason to include it.
			if y > 12:
				break
			elif y > 11:
				# BLOCK_WIDTH = TILE_SIZE * 8
				# BLOCKS_WIDE = (img0.size[0] // BLOCK_WIDTH)
				# BLOCK_TILES = 8
				# special case just for this single sprite b/c it's the only one that doesn't follow the pattern.
				sprites.append((196, 204))
				tileset_xml += TILE_ANIMATION_TEMPLATE.format(id=195, id2=203)
				break

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
					tileset_xml += TILE_ANIMATION_TEMPLATE.format(id=tiles_y + (x * BLOCK_TILES) - 1,id2=tiles_y + (x * BLOCK_TILES))
					sprites.append((tiles_y + (x * BLOCK_TILES), tiles_y + (x * BLOCK_TILES) + 1))
				else:
					tmp_sprites = []
					frame0 = tiles_y + (x * BLOCK_TILES)
					frame1 = tiles_y + (x * BLOCK_TILES) + BLOCK_TILES
					for a in range(BLOCK_TILES):
						tileset_xml += TILE_ANIMATION_TEMPLATE.format(id=frame0 + a - 1, id2=frame1 + a - 1)
						sprites.append(
							# [
							(frame0 + a, frame1 + a)
							#(tiles_y + (x * BLOCK_TILES) + a, tiles_y + (x * BLOCK_TILES) + a + BLOCK_TILES)
						)
				# for a in range(BLOCK_TILES)])

				tiles_y += BLOCK_TILES

		counter += TILES_WIDE

	tileset_xml += "\n</tileset>"
	makedirs(f"/tmpdownload/tilesets/{folder}",exist_ok=True)
	with open(f"/tmpdownload/tilesets/{folder}/{new_filename}.tsx","w+") as fh:
		fh.write(tileset_xml)
	#print(sprites)
	#print(tileset_xml)