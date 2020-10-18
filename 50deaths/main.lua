---
---
--- Created by Macarthur Inbody
--- DateTime: 8/18/20 1:05 PM
---

require 'src/Dependencies'


function love.load()
	love.window.setTitle("50 Deaths")
	love.window.setMode(640,512)
	TestWorld = World()
end

function love.update(dt)
	TestWorld:update(dt)
	if love.keyboard.isDown("escape") then
		love.event.quit()
	end
	Timer.update(dt)
end

function love.draw()
	TestWorld:render()
end
