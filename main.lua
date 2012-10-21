function love.load()
	-- includes
	-- initialize variables
	player = {}
	bullets = {}
	player.x = 0
	player.y = 0
	player.width = 48
	player.height = 48
	bulletSpeed=250
	player.direction_x = 0
	player.direction_y = 0
	player.reset = (function() player.x, player.y = 0,0 end)
	-- initialize graphics
	-- set aliases
	g = love.graphics
	k = love.keyboard
	p = player
	-- (TB) set camera
	-- (TB) test classes	
end
function love.update(dt)
	-- testing
	if k.isDown("a") then p.direction_x = -1 end
	if k.isDown("d") then p.direction_x = 1 end
	if k.isDown("w") then p.direction_y = -1 end
	if k.isDown("s") then p.direction_y = 1 end
	p.x = p.x + dt*(p.direction_x*200)
	p.y = p.y + dt*(p.direction_y*200)
	
	for i,v in ipairs(bullets) do
        v["x"] = v["x"] + (v["dx"] * dt)
        v["y"] = v["y"] + (v["dy"] * dt)
    end
end
function love.keypressed(key)
	if key == " " then p.reset() end
end
function love.keyreleased(key)
	if (key == "a" or key == "d") then p.direction_x = 0 end
	if (key == "w" or key == "s") then p.direction_y = 0 end
end
function love.mousepressed(x,y,button)
    if button == "l" then
        local startX = p["x"] + p["width"] / 2
        local startY = p["y"] + p["height"] / 2
        local mouseX = x
        local mouseY = y
        
        local angle = math.atan2((mouseY - startY), (mouseX - startX))
        
        local bulletDx = bulletSpeed * math.cos(angle)
        local bulletDy = bulletSpeed * math.sin(angle)
        
        table.insert(bullets, {x = startX, y = startY, dx = bulletDx, dy = bulletDy})
    end
end
function love.draw()
	--[[background
	top BG assets NS
	top BG assets solid
	playable characters]]
	g.setColor(128, 128, 128)
    for i,v in ipairs(bullets) do
        love.graphics.circle("fill", v["x"], v["y"], 3)
    end
	g.setColor(178,234,59)
	g.rectangle("fill",p.x,p.y,48,48)
	 
	--[[g.print((tostring(printx) .. "," .. tostring(printy)),printx,printy)
	g.print((tostring(math.ceil(player.ox/48)) .. "," .. tostring(math.ceil(player.oy/48))),300,350)
	g.print((tostring(waypoint[1]) .. "," .. tostring(waypoint[2])),300,300)
	HUD]]
end