-- Hackathon NOKIA 2012. Team: Ray, Sean, Will, Joe
-- This file sets up Enemy structures for our hero to attack!

Enemy = {}

function Enemy.new(t)
  t.hp = 5
  t.power = 5
  t.speed = 5
  t.boss = false
  return t
end

-- Different common enemy types:

function Enemy.createGoblin(t)
  Enemy.new(t)
  t.class = "Goblin"
  t.hp = t.hp + 1
  t.power = t.power + 1
end

function Enemy.createGoon(t)
  Enemy.new(t)
  t.class = "Goon"
  t.speed = t.speed + 1
end

function Enemy.createPumpkin(t)
  Enemy.new(t)
  t.class = "Pumpkin"
  t.power = t.power + 2
  t.speed = t.speed - 1
end

function Enemy.createMonster(t)
  Enemy.new(t)
  t.class = "Monster"
  t.power = t.power + 2
end

--some bosses:

function Enemy.createMichaelMyers(t)
  Enemy.new(t)
  t.class = "MichaelMyers"
  t.power = t.power + 4
  t.speed = t.speed - 1
  t.boss = true

end

function Enemy.createJason(t)
  Enemy.new(t)
  t.class = "Jason"
  t.power = t.power + 3
  t.speed = t.speed + 1
  t.boss = true
end

-- Monster Instantiations:
 
goblin = {}
Enemy.createGoblin(goblin)


goon = {}
Enemy.createGoon(goon)


monster = {}
Enemy.createMonster(monster)

pumpkin = {}
Enemy.createPumpkin(pumpkin)

michaelmyers = {}
Enemy.createMichaelMyers(michaelmyers)

jason = {}
Enemy.createJason(jason)


function moveEnemy_dumb
if (bullet.x < 16) or (bullet.y < 16)
    dodgeRight()
end

function moveEnemy_medium
  if (bullet.x < 16) or (bullet.y < 16)
    dodgeLeft()
  
  if (hero.x < 16) or (hero.y < 16)
    dodgeRight()
end

function moveEnemy_hard
  if (bullet.x < 16) or (bullet.y < 16)
    dodgeLeft()
  
  if (hero.x < 16) or (hero.y < 16)
    attack(Enemy)
end

function dodgeRight(Enemy)
   Enemy.moveRight()

  end

function dodgeLeft(Enemy)
  Enemy.moveLeft()
end

function attack(Enemy)
  


end


-- print(jason.class)
-- print(center.class)
-- print(righttackle.class)
-- print(quarterback.class)
-- print(runningback.class)
-- print(leftwo.class)
-- print(rightwo.class)

-- print(rightend.class)
-- print(nose.class)
-- print(leftend.class)
-- print(lb.class)
-- print(rightcorner.class)
-- print(leftcorner.class)
-- print(safety.class)



