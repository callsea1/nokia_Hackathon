Enemy = {}

function Enemy.new(p,etype) -- 1 for dumb, 2 for strong
	local t = {}
	t.width = 48
	t.height = 48
	local tdict = {"dumb", "strong"}
	repeat
		t.x = math.random(0,love.graphics.getWidth())
		t.y = math.random(0,love.graphics.getHeight())
	until (math.abs(p.x - t.x) >50) and (math.abs(p.y-t.x)>50)
	t.toughness = 1
	t.power = 1
	t.speed = 125
	t.class = tdict[etype]
	t.image = love.graphics.newImage("res/goblin.png")
	if etype == 2 then
		t.toughness = t.toughness + 2
		t.image = love.graphics.newImage("res/frankinstein.png")
	end
	
	return t
end
function Enemy.toggleType(t)
	if t.class == "strong" then 
		t.class = "dumb"
	else
		t.class = "strong" 
	end
end
function Enemy.move(t,dt)
	local mVec = {x=0,y=0}
	if (t.x > p.x) then mVec.x = -1 end
	if (t.x < p.x) then mVec.x = 1 end
	if (t.y > p.y) then mVec.y = -1 end
	if (t.y < p.y) then mVec.y = 1 end
	if (t.class == "strong") then
		local dodgeCheck = {x=0,y=0}
		for a,b in ipairs(bullets) do
			if math.min(math.abs(t.x + t.width - b.x), math.abs(t.x - b.x)) < 16 then
				if (b.x > t.x) then dodgeCheck.x = -1 end
				if (b.x < t.x) then dodgeCheck.x = 1 end
			end
			if math.min(math.abs(t.y + t.height - b.x), math.abs(t.y - b.x)) < 16 then
				if (b.y > t.y) then dodgeCheck.y = -1 end
				if (b.y < t.y) then dodgeCheck.y = 1 end
			end
		end
		if dodgeCheck.x ~= 0 then mVec.x = dodgeCheck.x end
		if dodgeCheck.y ~= 0 then mVec.y = dodgeCheck.y end
	end
	if t.class == "dumb" then
		t.x, t.y = t.x+((125*mVec.x)*dt), t.y+((125*mVec.y)*dt)
	else
		t.x, t.y = t.x+((150*mVec.x))*dt, t.y+((150*mVec.y)*dt)
	end
end
function addNewEnemy(p)
	local temp = Enemy.new(p,math.random(1,2))
	table.insert(enemies,temp) 
end
function bbCollision(ax1,ay1,aw,ah, bx1,by1,bw,bh)
  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1
end
function checkCollision()
	for h,u in ipairs(enemies) do
		for i,v in ipairs(bullets) do
				if bbCollision(u.x,u.y,u.width,u.height,v.x,v.y,3,3) == true then
					u.toughness = u.toughness - 1
					if u.toughness <= 0 then
						if u.class == "dumb" then
							score = score + 100
						else
							score = score + 500
						end
						a.play(death)
						table.remove(enemies,h)
					end
					table.remove(bullets,i)
				end
		end
		if bbCollision(p.x,p.y,p.width,p.height,u.x,u.y,u.width,u.height) == true then
			a.play(playerdeath)
			dead = true
		end
	end
end