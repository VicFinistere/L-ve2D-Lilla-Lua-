#! /usr/bin/lua

-- Flappy square
-- Move a square through the game window using arrows keys and avoid obstacles

-- Title
title = 'Flappy square'
love.window.setTitle(title)

--  Definitions
--  +  dt keyword  
--  	Meaning : stands for delta-time (exprimed in seconds)
--  	Usage : Represent the amount of time which has passed since the love.load method was last called. 
--  	Value : Usually smaller than 1 values like 0.01 are common
 
function love.load()
	--Load 
	
	dt = dt

	-- Current scene 
	scene = "Intro"
		
	-- Background
	background = love.graphics.newImage("background.jpg")	
	
	-- Window
	width, height = love.graphics.getDimensions( )	

	window = {
			left = 0,
			right = width,
			top = 0,
			bottom = height
		 }


	--Movemewidth, height = love.graphics.getDimensions(https://love2d.org/forums/viewtopic.php?t=83638)	
	-- movePlayer = true

	--player

	
	player_img = love.graphics.newImage("player.png")
	player = {
		 	x = window.right/2,
			y = window.bottom/2,
			rotation = math.rad(0),
			width = player_img:getWidth(),
			height = player_img:getHeight(),
			bottom,
			top,
			bottom,
			bottom,
			left,
			right,
		 }
	
	--player_sprite = love.graphics.newQuad(player.x, player.y, player.width, player.height, player.width, player.height)
   	player_sprite = love.graphics.newQuad(0, 0, 
					player_img:getWidth(), player_img:getHeight(), 
					player_img:getWidth(), player_img:getHeight())

	--Score
	score = 0
	score_increase_factor = 1 * love.timer.getDelta()
	
	--Pipes
	pipe_img = love.graphics.newImage("pipe.png")
	pipe = {
		 	x = window.right/2,
			y = window.bottom/2,
			rotation = math.rad(0),
			width = pipe_img:getWidth(),
			height = pipe_img:getHeight(),
			bottom,
			top,
			bottom,
			bottom,
			left,
			right,
		 }
	
	--pipe_sprite
   	pipe_sprite = love.graphics.newQuad(0, 0, 
					pipe_img:getWidth(), pipe_img:getHeight(), 
					pipe_img:getWidth(), pipe_img:getHeight())


	--Colors
	colors = {
			white= {1, 1, 1},
			pink = {255, 105, 180},
			red = {1 ,0, 0}, 
			yellow = {1, 1, 0}, 
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
	else
		move("up", player, 30000)
	end
end

function move(direction, player, speed)
	--move

	--dt : delta time
	dt = love.timer.getDelta()
	
	-- speed
	speed = speed or 200

	--move unit 
	move_unit = speed * dt
	
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
	
		--player bottom
		player.bottom = new_player_height_position + player.height
		
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
		if new_player_width_position  > window.left
		then 
			player.x = new_player_width_position
		end

	elseif direction == "right"
	then
		--move right
		new_player_width_position = player.x +  move_unit
	
		--player right side
		player.right = new_player_width_position + player.width	
		
		--Check if player is not to forward
		if window.right > player.right 
		then 
			player.x = new_player_width_position
		end
	
	end
end

function love.keypressed(key, scancode, isrepeat)
	print("Key ", key, " is pressed")   
end

function love.update(dt)
	
	--Update
	score = score + score_increase_factor

	-- Player is automatically falling down
	move("down", player, 100)
end


function draw_background(color)
	-- Draw background
	
	-- Background
	for i = 0, width / background:getWidth() 	
	do
        	for j = 0, height / background:getHeight() 		
		do
			--Set color with parameter value
			love.graphics.setColor(color)   

			--Draw background
			love.graphics.draw(background, i * background:getWidth(), j * background:getHeight())
        		
			--Reset after set
			love.graphics.reset()
		end
    	end
end

function love.draw()
	--Draw
	
	-- Scene
	if scene == "Intro"
	then
	   	-- Splash screen
    		--setColor(red, green, blue) 
    		love.graphics.setColor(colors.yellow)
    		draw_background(colors.yellow)
		love.graphics.print("Flappy bird",  320, 250, 0, 2, 2)

	elseif scene == "1"
	then
		-- New scene (reset)
		love.graphics.reset()
		
		--Background
		draw_background(colors.blue)

		--Pipe
		pipe.x = 100
		pipe.y = 100
		love.graphics.draw(pipe_img, pipe_sprite, pipe.x, pipe.y)
		
		-- Player
		--player_draw = love.graphics.draw(player_img, player_sprite, player.x, player.y)
		love.graphics.draw(player_img, player_sprite, player.x, player.y)
		
    		love.graphics.print(math.floor(score/100),  window.right - 100, window.top + 20, 0, 2, 2)	
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
