#! /usr/bin/lua
-- Player

player = {
		player_img = love.graphics.newImage("player.png"),
		x = window.right/2,
		y = window.bottom/2,
		rotation = math.rad(0),
		width = love.graphics.newImage("player.png"):getWidth(),
		height = love.graphics.newImage("player.png"):getHeight(),
		bottom,
		top,
		bottom,
		bottom,
		left,
		right,
		player_sprite = love.graphics.newQuad(0, 0,
							love.graphics.newImage("player.png"):getWidth(), 
							love.graphics.newImage("player.png"):getHeight(), 
							love.graphics.newImage("player.png"):getWidth(), 
							love.graphics.newImage("player.png"):getHeight())

	
	}
	
	return player	
