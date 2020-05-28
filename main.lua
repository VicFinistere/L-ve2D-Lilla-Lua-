#! /usr/bin/lua

-- Flappy square
-- Move a square through the game window using arrows keys and avoid obstacles

-- Title
title = 'Flappy square'
love.window.setTitle(title)

--  Definitions
--  +  dt keyword  
--  	Meaning : stands for delta-time (exprimed in seconds)
--  	Usage : Represent the amount of time which has passed since it was last called. 
--  	Value : Usually smaller than 1 values like 0.01 are common
 
function love.load()
	--Load 



	-- Current scene 
	scene = "Intro"
	
	
	-- Window
	width, height = love.graphics.getDimensions( )	

	window = {
			left = 0,
			right = width,
			top = 0,
			bottom = height
		 }


	--Movemewidth, height = love.graphics.getDimensions( )nt (https://love2d.org/forums/viewtopic.php?t=83638)	
	-- movePlayer = true
	player = {
		 	x = 100,
			y = 100,
			width = 50,
			height = 50,
			top,
			bottom,
			left,
			right
		 } 
	
	--Colors
	colors = {
			white= {1, 1, 1},
			pink = {255, 105, 180},
			red = {1 ,0, 0}, 
			green = {0, 1, 0}, 
			blue = {0, 0, 1},
			cyan = {0, 255, 255},
			black = {0, 0, 0}
		} 
	


end


function love.mousepressed(x, y, button)
   	--mouse pressed
	
	if scene == "Intro"
	then
		scene = "1"
	end
end

function move(direction, dt, player)
	--move

	--move unit 
	--dt : delta time 
	move_unit = 100 * dt
	
	if direction == "up"
	then
		--move up
		new_player_height_position = player.y - move_unit

		--Check if player is not to high
		if new_player_height_position > window.top
		then 
			player.y = new_player_height_position
		end

	elseif direction == "down"
	then 

		--move down
		new_player_height_position = player.y + move_unit
	
		--player right side
		player.bottom = new_player_width_position + player.height
		
		--Check if player is not to low
		if window.bottom > player.bottom
		then 
			player.y = new_player_height_position
		end

	elseif direction == "left"
	then
		--move left
		new_player_width_position = player.x - move_unit

		--Check if player is not to backward
		if new_player_width_position > window.left
		then 
			player.x = new_player_width_position
		end

	elseif direction == "right"
	then
		--move right
		new_player_width_position = player.x + move_unit
	
		--player right side
		player.right = new_player_width_position + player.width	
		
		--Check if player is not to forward
		if window.right > player.right 
		then 
			player.x = new_player_width_position
		end
	
	end
end

function love.update(dt)
	--Update
	
	
	-- Super simple movement
	if love.keyboard.isDown("w") or love.keyboard.isDown("up")	
	then
		move("up", dt, player)

	elseif love.keyboard.isDown("s") or love.keyboard.isDown("down")
	then
		move("down", dt, player)	

	elseif love.keyboard.isDown("d") or love.keyboard.isDown("right")
	then
		move("right", dt, player)

	elseif love.keyboard.isDown("a") or love.keyboard.isDown("left") 
	then
		move("left", dt, player)	
	end	
end


function love.draw()
	--Draw
	
	if scene == "Intro"
	then
	   	-- Splash screen
    		--setColor(red, green, blue) 
    		love.graphics.setColor(colors.red)
    		love.graphics.print("Flappy bird",  320, 250, 0, 2, 2)

	elseif scene == "1"
	then
		-- Player
		love.graphics.rectangle("line",player.x, player.y, player.width, player.height)
	end
	
end


--[[
--
--Save colors in file
--
---- color.lua
-- holds definitions
local color = {}
color.red = {1,0,0}
-- ...
return color

--- main.lua or elsewhere where you need to use colors
local color = require 'color']]
