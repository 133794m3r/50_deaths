local bump = require "bump"
local sti = require "sti"
gPlayer = {}
function love.load()
	love.window.setTitle("Test Map")
	-- Grab window size
	windowWidth  = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()

	-- Set world meter size (in pixels)
	--love.physics.setMeter(16)

	-- Load a map exported to Lua from Tiled
	map = sti("map.lua", { "bump" })

	-- Prepare physics world with horizontal and vertical gravity
	--world = love.physics.newWorld(0, 0)
	world = bump.newWorld(16)
	-- Prepare collision objects
	map:bump_init(world)

	-- Create a Custom Layer
	map:addCustomLayer("Sprite Layer", 3)
	local objX, objY = 0,0
	-- Add data to Custom Layer
	local spriteLayer = map.layers["Sprite Layer"]
	for _, object in pairs(map.objects) do
		if object.type == "spawn" then
			objX = object.x
			objY = object.y
		end
	end
	gPlayer = {
	image = love.graphics.newImage("sprite.png"),
	--x = 16,
	--y = 16,
	x = objX,
	y = objY - 16,
	r = 0,
	collidable = true
	}
	spriteLayer.player = gPlayer


	world:add(spriteLayer.player,objX,objY,16,16)
	-- Update callback for Custom Layer
	function spriteLayer:update(dt)
		local newX, newY
		--local player = self.player
		local player = gPlayer
		local move = false
		--for _, player in pairs(self.sprites) do
			-- 48 pixels per second
			-- aka 3 tiles/s seems to be about right.
			local speed = 48 * dt
			newY = player.y
			newX = player.x
			move = true
			-- Move player up
			if love.keyboard.isDown("w", "up") then
				newY = player.y - speed

			elseif love.keyboard.isDown("s", "down") then
				newY = player.y + speed
			-- Move player left
			elseif love.keyboard.isDown("a", "left") then
				newX = player.x - speed
			-- Move player right
			elseif love.keyboard.isDown("d", "right") then
				newX = player.x + speed
			else
				move = false
			end

			if move == true then
				local actualX, actualY, cols, len = world:move(player, newX,newY)
				if len == 0 then
					player.x = newX
					player.y = newY
				else
					player.x = actualX
					player.y = actualY
				end
				gPlayer = player
			end
		--end

	end

	-- Draw callback for Custom Layer
	function spriteLayer:draw()
		--for _, sprite in pairs(self.sprites) do
		local sprite = self.player
			local x = math.floor(sprite.x)
			local y = math.floor(sprite.y)
			local r = sprite.r
			love.graphics.draw(sprite.image, x, y, r)
		--end
	end

	--map:removeLayer("teleport_points")
	map:getObjectProperties("teleport_points",1,1)
end

function love.update(dt)
	map:update(dt)

	--local tile_x,tile_y = map:convertPixelToTile(gPlayer.x,gPlayer.y)
	check_teleports(map,gPlayer.x,gPlayer.y)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end	
end
function check_teleports(map,x,y)
	--for _,obj in pairs(map.layers.teleport_points.objects) do
	for _, obj in pairs(map.objects) do

		if x == obj.x and y+16 == obj.y then
			if(obj.type == "teleport") then
				local tele = map:getObject("teleport_points",obj.properties.to)

				map.layers["Sprite Layer"].player.x = tele.x
				map.layers["Sprite Layer"].player.y = tele.y - 16
				print(tele.x,tele.y)
			end
			break;
		end
	end
end
function print_r ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end
function love.draw()
	-- Draw the map and all objects within
	-- Please note that map:draw, map:box2d_draw, and map:bump_draw take
	-- translate and scale arguments (tx, ty, sx, sy) for when you want to
	-- grow, shrink, or reposition your map on screen.
	-- Scale world
	local scale = 2

	love.graphics.setColor(1, 1, 1)
	screen_width = love.graphics.getWidth() / 4
	screen_height = love.graphics.getHeight() / 4

	local player = map.layers["Sprite Layer"].player
	local tx = math.floor(player.x - screen_width /2)
	local ty = math.floor(player.y - screen_height /2)
	--love.graphics.translate(-tx,-ty)	
	map:draw(-tx,-ty,scale,scale)
	love.graphics.setColor(1,1,1)
	-- Draw Collision Map (useful for debugging)
	love.graphics.setColor(1, 1, 0)
	map:bump_draw(world,-tx,-ty,scale,scale)

	

end
