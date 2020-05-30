#! /usr/bin/lua
	
--Pipes
pipe =  {
		pipe_img = love.graphics.newImage("pipe.png"),
		x = window.right/2,
		y = window.bottom/2,
		rotation = math.rad(0),
		width = love.graphics.newImage("pipe.png"):getWidth(),
		height = love.graphics.newImage("pipe.png"):getHeight(),
		bottom,
		top,
		left,
		right,
		pipe_sprite = love.graphics.newQuad(0, 0,
							love.graphics.newImage("pipe.png"):getWidth(), 
							love.graphics.newImage("pipe.png"):getHeight(), 
							love.graphics.newImage("pipe.png"):getWidth(), 
							love.graphics.newImage("pipe.png"):getHeight())
	}
	

	return pipe
	


