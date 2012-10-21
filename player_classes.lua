-- Hackathon NOKIA 2012. Team: Ray, Sean, Will, Joe
-- This file sets up player variables to affect probablilty of success.

Player = {}

function Player.new(t)
  t.power = 5
  t.speed = 5
  return t
end

--for both sides of the ball:

function Player.createLineman(t)
  Player.new(t)
  t.class = "Lineman"
  t.power = t.power + 1
end

--Now offense:
function Player.createWideout(t)
  Player.new(t)
  t.class = "Wideout"
  t.speed = t.speed + 1
end

function Player.createRB(t)
  Player.new(t)
  t.class = "Runningback"
  t.power = t.power + 1
end

function Player.createQB(t)
  Player.new(t)
  t.class = "Quaterback"
  t.power = t.power + 1
end


--now Deffense!:

function Player.createLB(t)
  Player.new(t)
  t.class = "Linebacker"
  t.power = t.power + 1
end

function Player.createDB(t)
  Player.new(t)
  t.class = "Defensiveback"
  t.speed = t.speed + 1
end

function Player.createSafety(t)
  Player.new(t)
  t.class = "Safety"
  t.speed = t.speed + 1
end


-- --Offense Instantiations:
 
lefttackle = {}
Player.createLineman(lefttackle)


center = {}
Player.createLineman(center)


righttackle = {}
Player.createLineman(righttackle)

quarterback = {}
Player.createQB(quarterback)

leftwo = {}
Player.createWideout(leftwo)

rightwo = {}
Player.createWideout(rightwo)

runningback = {}
Player.createRB(runningback)


--Defense Instantiations:

leftend = {}
Player.createLineman(leftend)

nose = {}
Player.createLineman(nose)

rightend = {}
Player.createLineman(rightend)

lb = {}
Player.createLB(lb)

leftcorner = {}
Player.createDB(leftcorner)

rightcorner = {}
Player.createDB(rightcorner)

safety = {}
Player.createSafety(safety)




-- print(lefttackle.class)
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



