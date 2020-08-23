#!/usr/bin/env python3

from PIL import Image, ImageFont, ImageDraw
import sys
# Uncomment the 3 lines below to have files be read from the file.
# Also comment out the 2 lines below it.
# If you are on Windows you have to find all and replace "/" with "\".

# with open("all_imgs_unix.txt","r") as fh:
# 	files = []
# 	for line in fh.readlines():
# 		files.append(line.rstrip())

files_str = sys.stdin.readline()
files = files_str.rstrip().split(' ')

TILE_SIZE = 16
TILES_HIGH = 0
TILES_WIDE = 0
BLOCK_HEIGHT = 16
BLOCK_WIDTH = 16
SCALE = 3
font_size = 4 * SCALE
FONT_COLOR = (255, 255, 255)
font = ImageFont.truetype('SDS_8x8.ttf', font_size)
for file in files:
	counter = 1
	split_str = file.split('/')
	new_filename = split_str[-1]
	folder = split_str[0]
	img0 = Image.open(f'{file}0.png')
	img1 = Image.open(f'{file}1.png')
	TILES_HIGH = (img0.size[1] // TILE_SIZE) + 1
	TILES_WIDE = (img0.size[0] // TILE_SIZE) + 1
	new_img = Image.new('RGBA', (img0.size[0] * 2, img0.size[1]))
	num_img = new_img

	if new_filename in ["Tree"]:
		BLOCK_HEIGHT = TILE_SIZE * 3
		BLOCK_WIDTH = TILE_SIZE * 6
	elif new_filename in ["Pit"]:
		BLOCK_HEIGHT = TILE_SIZE * 2
		BLOCK_WIDTH = TILE_SIZE * 3
	elif new_filename in ["Hill"]:
		BLOCK_WIDTH = TILE_SIZE * 4
		BLOCK_HEIGHT = TILE_SIZE * 4
	elif new_filename in ["Map"]:
		BLOCK_HEIGHT = TILE_SIZE * 3
		BLOCK_WIDTH = TILE_SIZE * 3
	elif new_filename in ["Ore"]:
		BLOCK_WIDTH = TILE_SIZE * 2
		BLOCK_HEIGHT = TILE_SIZE * 2
	elif new_filename == "Effect":
		BLOCK_WIDTH = TILE_SIZE * 3
		BLOCK_HEIGHT = TILE_SIZE * 3
	else:
		BLOCK_HEIGHT, BLOCK_WIDTH = TILE_SIZE, TILE_SIZE

	# numbered_img = ImageDraw.Draw(new_img_draw)
	cropped_img = Image.new("RGBA", (BLOCK_WIDTH, BLOCK_HEIGHT))

	for y in range(TILES_HIGH):
		if new_filename == "Effect":
			if y > 14:
				BLOCK_WIDTH = TILE_SIZE * 2
				BLOCK_HEIGHT = TILE_SIZE
			elif y > 20:
				BLOCK_WIDTH = TILE_SIZE
		if new_filename == "Reptile" and y > 11:
			crop_x0 = 0
			crop_x1 = TILE_SIZE * 8
			crop_y0 = y * TILE_SIZE
			crop_y1 = (y + 4) * TILE_SIZE
			cropped_img = img0.crop((crop_x0, crop_y0, crop_x1, crop_y1))
			new_img.paste(cropped_img, (0, y * BLOCK_HEIGHT))
			num_img.paste(cropped_img, (0, y * BLOCK_HEIGHT))

			break
		else:
			for x in range(TILES_WIDE):
				crop_x0 = (x * BLOCK_WIDTH)
				crop_x1 = (x * BLOCK_WIDTH + BLOCK_WIDTH)
				crop_y0 = (y * BLOCK_HEIGHT)
				crop_y1 = (y * BLOCK_HEIGHT + BLOCK_HEIGHT)
				cropped_img = img0.crop((crop_x0, crop_y0, crop_x1, crop_y1))
				paste_x0 = (x * BLOCK_WIDTH * 2)
				paste_x1 = (x * BLOCK_WIDTH * 2 + BLOCK_WIDTH)
				new_img.paste(cropped_img, (paste_x0, y * BLOCK_HEIGHT))
				num_img.paste(cropped_img, (paste_x0, y * BLOCK_HEIGHT))
				cropped_img = img1.crop((crop_x0, crop_y0, crop_x1, crop_y1))
				new_img.paste(cropped_img, (paste_x1, y * BLOCK_HEIGHT))
				num_img.paste(cropped_img, (paste_x1, y * BLOCK_HEIGHT))

	num_img = new_img
	# We resize the image to be larger to see it more easily when doing tile designing decisions.
	num_img = num_img.resize((num_img.size[0] * SCALE, num_img.size[1] * SCALE), Image.NEAREST)
	num_img_draw = ImageDraw.Draw(num_img)
	BLOCK_WIDTH = SCALE * TILE_SIZE
	BLOCK_HEIGHT = SCALE * TILE_SIZE

	for y in range(TILES_HIGH):
		for x in range(TILES_WIDE):
			crop_x0 = (x * BLOCK_WIDTH)
			crop_x1 = (x * BLOCK_WIDTH + BLOCK_WIDTH)
			crop_y0 = (y * BLOCK_HEIGHT)
			crop_y1 = (y * BLOCK_HEIGHT + BLOCK_HEIGHT)
			paste_x0 = (x * BLOCK_WIDTH * 2)
			paste_x1 = (x * BLOCK_WIDTH * 2 + BLOCK_WIDTH)
			num_img_draw.text((paste_x0 + 1, y * BLOCK_HEIGHT), str(counter), (0, 0, 0), font=font)
			num_img_draw.text((paste_x0, y * BLOCK_HEIGHT + 1), str(counter), (0, 0, 0), font=font)
			num_img_draw.text((paste_x0, y * BLOCK_HEIGHT), str(counter), FONT_COLOR, font=font)
			counter += 1
			num_img_draw.text((paste_x1 + 1, y * BLOCK_HEIGHT), str(counter), (0, 0, 0), font=font)
			num_img_draw.text((paste_x1, y * BLOCK_HEIGHT + 1), str(counter), (0, 0, 0), font=font)
			num_img_draw.text((paste_x1, y * BLOCK_HEIGHT), str(counter), FONT_COLOR, font=font)
			counter += 1
		counter += 1

	num_img.save(f'/tmpdownload/{new_filename}_numbered.png')
	new_img.save(f'/tmpdownload/{new_filename}.png')
