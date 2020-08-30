#!/usr/bin/env python3
import os

from PIL import Image, ImageFont, ImageDraw
import sys

# Uncomment the 3 lines below to have files be read from the file.
# Also comment out the 2 lines below it.
# If you are on Windows you have to find all and replace "/" with "\".

# with open("all_imgs_unix.txt","r") as fh:
# 	files = []
# 	for line in fh.readlines():
# 		files.append(line.rstrip())

from tiles_config import get_file_infos

files_str = sys.stdin.readline()
files = files_str.rstrip().split(' ')

# default output directory. Change this to whatever one you want.
out_dir = '/tmpdownload'
# The tiles are 16x16
TILE_SIZE = 16
TILES_HIGH = 0
TILES_WIDE = 0
BLOCK_HEIGHT = 16
BLOCK_WIDTH = 16
# Scale is used for the numbered ones to make it easier to see.
SCALE = 4
# Font size is 4 pixels times the scale to make it not take up too much space.
font_size = 4 * SCALE
# The color by default is bright Yellow.
FONT_COLOR = (255, 255, 0)
# The font we're going to use. Make sure it's made for small text.
font = ImageFont.truetype('SDS_8x8.ttf', font_size)
# We read all of the files.
for file in files:
	# The counter is reset every time.
	counter = 0

	# the first image is the one ending in 0.
	img0 = Image.open(f'{file}0.png')
	# second one in the animation tiles ends in 1.
	img1 = Image.open(f'{file}1.png')
	# figure out how big it is.
	TILES_HIGH = (img0.size[1] // TILE_SIZE)
	TILES_WIDE = (img0.size[0] // TILE_SIZE)
	# then create a new image that is twice as wide.
	new_img = Image.new('RGBA', (img0.size[0] * 2, img0.size[1]))

	BLOCK_HEIGHT, BLOCK_WIDTH, folder, new_filename = get_file_infos(file)

	# create our crop image and make it be the same size as our block.
	cropped_img = Image.new("RGBA", (BLOCK_WIDTH, BLOCK_HEIGHT))

	# Iterate over every tile.
	for y in range(TILES_HIGH):
		# if the filename is effect we have to do it special.
		if new_filename == "Effect":
			print('effect', y)
			#from this row on we do just 1x1 blocks.
			if y > 14:
				BLOCK_WIDTH = TILE_SIZE
				BLOCK_HEIGHT = TILE_SIZE
				BLOCK_TILES = 1

		# The reptiles has the guys logo at the bottom and to just copy it once I do it here.
		elif new_filename == "Reptile" and y > 11:
			crop_x0 = 0
			crop_x1 = TILE_SIZE * 8
			crop_y0 = y * TILE_SIZE
			crop_y1 = (y + 4) * TILE_SIZE
			cropped_img = img0.crop((crop_x0, crop_y0, crop_x1, crop_y1))
			new_img.paste(cropped_img, (0, y * BLOCK_HEIGHT))
			# the second cropped image cropped again with the same values.
			cropped_img = img1.crop((crop_x0, crop_y0, crop_x1, crop_y1))
			paste_x1 = (BLOCK_WIDTH * 8)			
			# paste them into our image.
			new_img.paste(cropped_img, (paste_x1, y * BLOCK_HEIGHT))		
			break
		# else:
			# Otherwise we iterate over all of the tiles
		for x in range(TILES_WIDE):
			# we create a cropping rectangle the same size as the block.
			# And we put it's upper left point be our curent cursor.

			crop_x0 = (x * BLOCK_WIDTH)
			crop_x1 = (x * BLOCK_WIDTH + BLOCK_WIDTH)
			crop_y0 = (y * BLOCK_HEIGHT)
			crop_y1 = (y * BLOCK_HEIGHT + BLOCK_HEIGHT)
			# Crop the image from the first image.
			cropped_img = img0.crop((crop_x0, crop_y0, crop_x1, crop_y1))
			paste_x0 = (x * BLOCK_WIDTH * 2)
			# we move the second cropped block over by 1 block.
			paste_x1 = (x * BLOCK_WIDTH * 2 + BLOCK_WIDTH)
			# paste it into the new image based upon our iteration count.
			new_img.paste(cropped_img, (paste_x0, y * BLOCK_HEIGHT))
			# the second cropped image cropped again with the same values.
			cropped_img = img1.crop((crop_x0, crop_y0, crop_x1, crop_y1))
			# paste them into our image.
			new_img.paste(cropped_img, (paste_x1, y * BLOCK_HEIGHT))

	num_img = new_img
	# We resize the image to be larger to see it more easily when doing tile designing decisions.
	num_img = num_img.resize((num_img.size[0] * SCALE, num_img.size[1] * SCALE), Image.NEAREST)
	num_img_draw = ImageDraw.Draw(num_img)
	# we now change the block size to be the same as the scale * the tile_size
	# then we make sure we use this for drawing the letters. I do this here
	# instead of with the rest is due to me scaling it.
	BLOCK_WIDTH = SCALE * TILE_SIZE
	BLOCK_HEIGHT = SCALE * TILE_SIZE

	for y in range(TILES_HIGH):
		for x in range(TILES_WIDE):
			# same as above but we are just using the pasting values for the x
			# coordinate to make sure that we're drawing the text right
			paste_x0 = (x * BLOCK_WIDTH * 2)
			paste_x1 = (x * BLOCK_WIDTH * 2 + BLOCK_WIDTH)
			num_img_draw.text((paste_x0 + 1, y * BLOCK_HEIGHT), str(counter), (0, 0, 0), font=font)
			num_img_draw.text((paste_x0, y * BLOCK_HEIGHT + 1), str(counter), (0, 0, 0), font=font)
			num_img_draw.text((paste_x0, y * BLOCK_HEIGHT), str(counter), FONT_COLOR, font=font)
			# increase counter by 1.
			counter += 1
			# draw the next tile over.
			num_img_draw.text((paste_x1 + 1, y * BLOCK_HEIGHT), str(counter), (0, 0, 0), font=font)
			num_img_draw.text((paste_x1, y * BLOCK_HEIGHT + 1), str(counter), (0, 0, 0), font=font)
			num_img_draw.text((paste_x1, y * BLOCK_HEIGHT), str(counter), FONT_COLOR, font=font)
			# increase counter again.
			counter += 1
		# increase counter for each y.
		#counter += 1

	# save both images.
	new_img = new_img.convert("P", palette=Image.ADAPTIVE, colors=16)
	num_img = num_img.convert("P", palette=Image.ADAPTIVE, colors=32)
	# num_img = num_img.tobytes()
	# new_img = new_img.tobytes()
	#
	# with open(f'{out_dir}/{file}.png','x+b') as fh:
	# 	fh.write(new_img)
	# with open(f'{out_dir}/{file}_numbered.png','x+b') as fh:
	# 	fh.write(num_img)
	print(file)
	# num_img.save(f'{out_dir}/{folder}/{new_filename}_numbered.png')
	# new_img.save(f'{out_dir}/{folder}/{new_filename}.png')
	print(f'{out_dir}/{file}.png')
	num_img.save(f'{out_dir}/{file}_numbered.png')
	new_img.save(f'{out_dir}/{file}.png')
