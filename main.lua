function love.load()
	-- includes
	require "player_classes"
	-- initialize variables
	printx = 0
	printy = 0
	
	testplayer = {}
	waypoint = {}
	testplayer.x = 0
	testplayer.y = 0
	testplayer.ox = 24
	testplayer.oy = 24
	testplayer.gx = 1
	testplayer.gy = 1
	testplayer.reset = (function() testplayer.x, testplayer.y = 0,0 end)
	-- initialize graphics
	-- set aliases
	g = love.graphics
	-- (TB) set camera
	-- (TB) test classes	
end
function love.update(dt)
	-- testing
	testplayer.ox = testplayer.x + 24
	testplayer.oy = testplayer.y + 24
	testplayer.gx = math.ceil(testplayer.ox/48)
	testplayer.gy = math.ceil(testplayer.oy/48)
	-- check for input
	-- move accordingly
	-- [camera] move accordingly
	-- A-star
	-- collisions
	-- scoring
end
function love.keypressed(key)
	if key == "left" then testplayer.x = testplayer.x-48 end
	if key == "right" then testplayer.x = testplayer.x+48 end
	if key == "up" then testplayer.y = testplayer.y-48 end
	if key == "down" then testplayer.y = testplayer.y+48 end
	if key == " " then testplayer.reset() end
end
function love.mousepressed(x,y,button)
	printx = x
	printy = y
	makeWaypoint(x,y)
end
function love.draw()
	-- background
	-- top BG assets NS
	-- top BG assets solid
	-- playable characters
	g.rectangle("line",testplayer.x,testplayer.y,48,48)
	g.print((tostring(printx) .. "," .. tostring(printy)),printx,printy)
	g.print((tostring(math.ceil(testplayer.ox/48)) .. "," .. tostring(math.ceil(testplayer.oy/48))),300,350)
	g.print(lefttackle.class, 400, 400)
	g.print((tostring(waypoint[1]) .. "," .. tostring(waypoint[2])),300,300)
	-- HUD
end
function makeWaypoint(x,y)
	local wayx = math.ceil(x/48)
	local wayy = math.ceil(y/48)
	waypoint = {wayx, wayy}
end