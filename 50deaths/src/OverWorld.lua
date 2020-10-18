---
---
--- Created by macarthur.
--- DateTime: 8/22/20 12:08 PM
--- s
---
World = Class{}
function World:init()

	self.map = sti("first_map.lua", { "bump" })
	self.map:indexAllObjects(self.map.layers['scaled_enemies'],16,16)
	world = bump.newWorld(16)
	local maxHeight = (self.map.height * self.map.tileheight) - self.map.tileheight
	local maxWidth = (self.map.width * self.map.tilewidth) - self.map.tilewidth
	-- Prepare collision objects
	self.map:bump_init(world)

	self.map:addCustomLayer("Sprite Layer", 3)
	local objX, objY = 0,0
	-- Add data to Custom Layer
	local spriteLayer = self.map.layers["Sprite Layer"]
	for _, object in pairs(self.map.objects) do
		if object.type == "spawn" then
			objX = object.x
			objY = object.y
		end
	end
	gPlayer = {
		image = love.graphics.newImage("assets/sprite.png"),
		--x = 16,
		--y = 16,
		x = objX,
		y = objY,
		r = 0,
		collidable = true,
		canMove = true,
		canInteract = true,
	}
	spriteLayer.player = gPlayer

--[[
TODO: I'm going to make the player's movement be modified. If they are above/below a door,
it will make them walk through it(opening the door and then closing it) so they'll move 2 tiles
before the player can move again.
]]
	world:add(spriteLayer.player,objX,objY,16,16)
	-- Update callback for Custom Layer
	function spriteLayer:update(dt)
		local newX, newY
		--local player = self.player
		local player = gPlayer
		local move = false
		-- 48 pixels per second
		-- aka 3 tiles/s seems to be about right.
		--local speed = 48 * dt
		newY = player.y
		newX = player.x
		move = true
		if player.canMove then
			-- Move player up
			if love.keyboard.isDown("w", "up") and player.y > 0 then
				newY = player.y - 16
			-- Move player down
			elseif love.keyboard.isDown("s", "down") and player.y < maxHeight then
				newY = player.y + 16
			-- Move player left
			elseif love.keyboard.isDown("a", "left") and player.x > 0 then
				newX = player.x - 16
			-- Move player right
			elseif love.keyboard.isDown("d", "right") and player.x < maxWidth then
				newX = player.x + 16
			-- Movement wasn't allowed.
			else
				move = false
			end
		else
			move = false
		end

		if move == true then

			local actualX, actualY, cols, len = world:move(player, newX,newY)
			if len == 0 then
				gPlayer.canMove = false
				Timer.tween(0.125, {
					[gPlayer] = {x = newX, y = newY}
				}):finish(function()

					gPlayer.canMove = true
				end)
			--else
			--	player.x = actualX
			--	player.y = actualY
			end

		end

	end

	-- Draw callback for Custom Layer
	function spriteLayer:draw()
		local sprite = self.player
		local x = math.floor(sprite.x)
		local y = math.floor(sprite.y)
		local r = sprite.r
		love.graphics.draw(sprite.image, x, y, r)
	end

end

function World:update(dt)
	self.map:update(dt)
	interacts(self.map)
	--local tile_x,tile_y = self.map:convertPixelToTile(gPlayer.x,gPlayer.y)
	check_teleports(self.map,gPlayer.x,gPlayer.y)
end

function interacts(map)
	if love.keyboard.isDown("space","return") and gPlayer.canInteract then
		local x,y = gPlayer.x/16, gPlayer.y/16
		local obj = map:getTileObject(x,y)

		if obj == nil then
			obj = map:getTileObject(x,y-1);
		end
		if obj then
			print(obj.properties.interact)
		end
		gPlayer.canInteract = false
		Timer.after(0.25,function () gPlayer.canInteract = true end)
	end
end

--- Checks if the player is on a teleportation tile.
-- @param map The map we're checking.
-- @param x the X coordinate.
-- @param y the y coordinate
function check_teleports(map,x,y)
	for _, obj in pairs(map.objects) do
		if x == obj.x and y == obj.y then
			if(obj.type == "teleport") then
				local tele = map:getObject("teleports",obj.properties.to)
				map.layers["Sprite Layer"].player.x = tele.x
				map.layers["Sprite Layer"].player.y = tele.y
			end
			break;
		end
	end
end

function World:render()
	local window_tiles_height = 224
	local scale = 2
	love.graphics.setColor(1, 1, 1)
	local screen_width = love.graphics.getWidth() / 4
	local screen_height = (love.graphics.getHeight()) / 4

	local tx = math.min(160,math.max(0,math.floor(gPlayer.x - screen_width)))
	--local ty = math.min(screen_height*2,math.max(0,math.floor(gPlayer.y - screen_height)))
	--love.graphics.translate(-tx,-ty)
	local ty = math.min(224,math.max(0,math.floor(gPlayer.y - screen_height)))
	self.map:draw(-tx,-ty,scale,scale)
	love.graphics.setColor(1,1,1)
	-- Draw Collision Map (useful for debugging)
	love.graphics.setColor(1, 1, 0)
	self.map:bump_draw(-tx,-ty,scale,scale)
end
