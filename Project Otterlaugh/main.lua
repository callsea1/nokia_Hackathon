function love.load()
	-- includes
	require "enemy"
	-- require "particles"
	-- set aliases
	title = true
	paused = false
	dead = false
	alpha = 255
	score = 0
	a = love.audio
	bgm = a.newSource("res/startingmusic.mp3")
	shot1 = a.newSource("res/handgunreal.mp3")
	death = a.newSource("res/zombiedeath.mp3")
	bomb = a.newSource("res/bomb_shotgun.mp3")
	playerdeath = a.newSource("res/death.mp3")
	
	death:setVolume(0.7)
	bomb:setVolume(0.7)
	numBombs = 5
	bombDelay = 5
	g = love.graphics
	k = love.keyboard
	m = love.mouse
	width = g.getWidth()
	height = g.getHeight()
	-- initialize variables
	titleScr = g.newImage("res/title.png")
	g.setMode(800,600,false,false,0)
	castle_big = g.newFont("res/return.ttf",48)
	castle = g.newFont("res/return.ttf",24)
	bgm:setVolume(0.8)
	a.play(bgm)
	g.setFont(castle_big)
	-- m.setVisible(false)
	mouse={}
	player = {}
	p = player
	bullets = {}
	enemies = {}
	
	player.x = width/2
	player.y = height/2	
	player.image = g.newImage("res/player.png")
	-- mouse.image = g.newImage("cursor.png")
	bg = g.newImage("res/background.png")
	player.width = 48
	player.height = 48
	bulletSpeed=350
	bulletDelayTime=0.25
	enemySpawnTime=1000
	player.direction_x = 0
	player.direction_y = 0
	player.bomb = function() 
			if (numBombs > 0 and bombDelay <= 0) then
				for a = 0,8 do
					local startX = p.x + 5
					local startY = p.y + 35
					local mouseX,mouseY = m.getPosition()
				
					local angle = math.atan2((mouseY+(a*16) - startY), (mouseX - startX))
					
					local bulletDx = bulletSpeed * math.cos(angle)
					local bulletDy = bulletSpeed * math.sin(angle)
					
					table.insert(bullets, {x = startX, y = startY, dx = bulletDx, dy = bulletDy})
				end
				a.play(bomb)
				bombDelay = 5
			end
		end
	-- initialize graphics
	
	-- (TB) set camera
	-- (TB) test classes	
end
function love.update(dt)
	if not paused and not dead and title == false then
		-- testing
		for f,e in ipairs(enemies) do
			Enemy.move(e,dt)
		end
		checkCollision()
		if k.isDown("a") then p.direction_x = -1 end
		if k.isDown("d") then p.direction_x = 1 end
		if k.isDown("w") then p.direction_y = -1 end
		if k.isDown("s") then p.direction_y = 1 end
		mouse.x,mouse.y=m.getPosition()
		if ((p.x + dt*(p.direction_x*200)) > -10) and ((p.x+dt*(p.direction_x*200))<width -10) then p.x = p.x + dt*(p.direction_x*200) end
		if ((p.y + dt*(p.direction_y*200)) > -10) and ((p.y+dt*(p.direction_y*200))<height -10) then p.y = p.y + dt*(p.direction_y*200) end
		
		if alpha>0 then alpha = alpha-(255/3*dt) end
		
		if bulletDelayTime > 0 then bulletDelayTime = bulletDelayTime - dt end
		if bombDelay > 0 then bombDelay = bombDelay - dt end
		for i,v in ipairs(bullets) do
			v.x = v.x + (v.dx * dt)
			v.y = v.y + (v.dy * dt)
			if (v.x < -10) or (v.x > g.getWidth() +20) or (v.y < -10) or (v.y > g.getHeight() +10) then table.remove(bullets,i) end
		end
		enemySpawnTime = enemySpawnTime - 1
		if enemySpawnTime < 0 then
			addNewEnemy(p)
			enemySpawnTime = 1000 - (10*(score/200))
		end
	end
end
function love.keypressed(key)
	if not paused and not dead and title == false then
	if key == " " then p.bomb() end
	end
	if key == "escape" then paused = not paused end
end
function love.keyreleased(key)
	if (key == "a" or key == "d") then p.direction_x = 0 end
	if (key == "w" or key == "s") then p.direction_y = 0 end
end
function love.mousepressed(x,y,button)
	if not paused and not dead and title == false then
		if button == "l"  and bulletDelayTime <= 0 then
			local startX = p.x + 5
			local startY = p.y + 35
			local mouseX = x
			local mouseY = y
			
			local angle = math.atan2((mouseY - startY), (mouseX - startX))
			
			local bulletDx = bulletSpeed * math.cos(angle)
			local bulletDy = bulletSpeed * math.sin(angle)
			
			table.insert(bullets, {x = startX, y = startY, dx = bulletDx, dy = bulletDy})
			a.play(shot1)
			bulletDelayTime = 0.5
		end
	end
	if dead and button == "r" then
		love.event.push("quit")
	end
	if title and button == "r" then
		title = false
	end
end
function love.focus(b)
	if not b then
		paused = true
	end
end
function love.draw()
	--[[background
	top BG assets NS
	top BG assets solid
	playable characters]]
	g.setColorMode("combine")
	g.setColor(0,0,0)
	for a = 0,5 do
		for b = 0,5 do
			g.draw(bg,a*173,b*139)
		end
	end
	g.setColor(255, 255, 255)
    for i,v in ipairs(bullets) do
        love.graphics.circle("fill", v["x"], v["y"], 3)
    end
	for a,e in ipairs(enemies) do
		if e.toughness >= 2 then g.setColorMode("replace") end
		if e.toughness <= 1 then g.setColorMode("modulate") g.setColor(255,0,0) end
		g.draw(e.image,e.x,e.y,0,0.5,0.5)
	end
	g.setColorMode("replace")
	g.draw(player.image,player.x, player.y, 0, 1, 1)
	g.setColorMode("modulate")
	g.setColor(215,64,64,alpha)
	g.print("Bruce Killis Takes Halloween!", 100,400)
	g.setColor(255,96,96)
	g.print(tostring(score),10,500)
	if bombDelay <= 0  and numBombs > 0 then
		g.setColor(128,128,128,255)
		g.print("Bomb active!", 500,500)
	end
	if paused then
		g.setColor(255,255,255)
		g.print("Paused", (g.getWidth()/2)-70,(g.getHeight()/2)-15)
	end
	if dead then
		g.setColor(255,0,0)
		g.print("You have died!", (g.getWidth()/2)-125,(g.getHeight()/2)-15)
		g.setColor(200,0,0)
		g.print("Right-click to exit...", (g.getWidth()/2)-180,(g.getHeight()/2)+20)
	end
	if title then
		g.setColorMode("replace")
		g.draw(titleScr,0,0,0,6.3,6.3)
	end
	--[[g.draw(mouse.image,mouse.x-8,mouse.y-8,0,0.50,0.50)
	g.setColorMode("replace")
	g.print((tostring(printx) .. "," .. tostring(printy)),printx,printy)
	g.print((tostring(math.ceil(player.ox/48)) .. "," .. tostring(math.ceil(player.oy/48))),300,350)
	g.print((tostring(waypoint[1]) .. "," .. tostring(waypoint[2])),300,300)
	HUD]]
end
