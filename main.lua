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
	

	-- Window
	width, height = love.graphics.getDimensions( )	

	window = {
			left = 0,
			right = width,
			top = 0,
			bottom = height
		 }
	--Game
	game = 	{
				
			scene = "Intro",
			background = love.graphics.newImage("background.jpg"),
			score = 0,
			score_increase_factor = 1 * love.timer.getDelta()

			
		}
	



end

function love.mousepressed(x, y, button)
   	--mouse pressed
	
	if game.scene == "Intro"
	then
		game.scene = "1"
	else
		move("up", player, 30000)
	end
end

function move(direction, player, speed, dt)
	--move


	-- player
	local player = require 'player'
	
	-- speed
	speed = speed or 200
	dt = dt or love.timer.getDelta()

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
		
	local player = require 'player'

	--Update
	game.score = game.score + game.score_increase_factor

	-- Player is automatically falling down
	move("down", player, 100, dt)
end


function draw_background(color)
	-- Draw background
	

	-- Background
	for i = 0, width / game.background:getWidth() 	
	do
        	for j = 0, height / game.background:getHeight() 		
		do
			--Set color with parameter value
			love.graphics.setColor(color)   

			--Draw background
			love.graphics.draw(game.background, i * game.background:getWidth(), j * game.background:getHeight())
        		
			--Reset after set
			love.graphics.reset()
		end
    	end
end

function love.draw()
	--Draw
	--
	local colors = require 'colors'
	local player = require 'player'
	local pipe = require 'pipe'

	-- Scene
	if game.scene == "Intro"
	then
	   	-- Splash screen
    		--setColor(red, green, blue) 
    		love.graphics.setColor(colors.yellow)
    		draw_background(colors.yellow)
		love.graphics.print("Flappy bird",  320, 250, 0, 2, 2)

	elseif game.scene == "1"
	then
		-- New scene (reset)
		love.graphics.reset()
		
		--Background
		draw_background(colors.blue)

		--Pipe
		pipe.x = 100
		pipe.y = 100
		love.graphics.draw(pipe.pipe_img, pipe.pipe_sprite, pipe.x, pipe.y)
		
		-- Player
		--player_draw = love.graphics.draw(player_img, player_sprite, player.x, player.y)
		love.graphics.draw(player.player_img, player.player_sprite, player.x, player.y)
		
    		love.graphics.print(math.floor(game.score/100),  window.right - 100, window.top + 20, 0, 2, 2)	
	end
	
end


