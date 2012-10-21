function initPart()
	g=love.graphics
	gunsmoke = love.graphics.newParticleSystem(g.newImage("gunsmoke.png"),10)
	spark1 = love.graphics.newParticleSystem(g.newImage("spark1.png"),5)
	spark2 = love.graphics.newParticleSystem(g.newImage("spark2.png"),5)
	spark3 = love.graphics.newParticleSystem(g.newImage("spark3.png"),5)

	gunsmoke:setGravity(1,2)
	gunsmoke:setLifetime(1)
	gunsmoke:setSpeed(0.1,0.5)
	gunsmoke:setParticleLife(0.5,1)
	gunsmoke:setEmissionRate(2)
	gunsmoke:setSpread(35)
	gunsmoke:stop()

	spark1:setGravity(1,2)
	spark1:setLifetime(0.1)
	spark1:setSpeed(4,5)
	spark1:setParticleLife(0.1,0.2)
	spark1:setEmissionRate(5)
	spark1:setSpread(25)
	spark1:stop()

	spark2:setGravity(1,2)
	spark2:setLifetime(0.1)
	spark2:setSpeed(4,5)
	spark2:setParticleLife(0.1,0.2)
	spark2:setEmissionRate(5)
	spark2:setSpread(25)
	spark2:stop()

	spark3:setGravity(1,2)
	spark3:setLifetime(0.1)
	spark3:setSpeed(4,5)
	spark3:setParticleLife(0.1,0.2)
	spark3:setEmissionRate(5)
	spark3:setSpread(25)
	spark3:stop()
end