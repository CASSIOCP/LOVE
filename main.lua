Width = love.graphics.getWidth()
Height = love.graphics.getHeight()
StartDuel = false
State = "Play"
button = {}
medium = love.graphics.newFont(45)
background = love.graphics.newImage("joust.jpg")

BgSound = love.audio.newSource("encore.mp3", "stream")
--set the volume of the sound
--BgSound:setVolume(0.5)
--set the pitch level
--BgSound:setPitch(0.25)
--play the sound, you can also use shorthand BgSound:play()

function love.load(arg)
  --imports
  if State == "Menu" then
    ButtonSpawn(Width - 300, Height - 220, "START GAME", "start")
    ButtonSpawn(Width - 260, Height - 150, "OPTIONS", "options")
    ButtonSpawn(Width - 200, Height - 80, "EXIT", "exit")
  end
  if State == "Play" then
    hero = require "hero"
    villain = require "villain"
    stage = require "stage"
    --Load classes
    CreateHero()
    CreateVillain()
    CreateStage()
  end
end

function love.update(dt)
  if State == "Menu" then

  end
  if State == "Options" then
  end
  if State == "Play" then
    if not StartDuel and love.keyboard.isDown("space") then
      StartDuel = true;
    end;
    if StartDuel then
      MoveHero(dt)
      MoveVillain(dt)
    end
    if Hero.x >= Width / 2 - Hero.width then
      love.audio.play(BgSound)
    end
  end
end

function love.draw()
  if State == "Menu" then
    love.graphics.draw(background)
    --love.graphics.setColor(255, 255, 255)
    --love.graphics.print("Screen-> Width: "..Width.." Height: "..Height)
    ButtonDraw()
  end
  if State == "Options" then

  end
  if State == "Play" then
    DrawStageBackground()
    DrawScreenStatistics()
    DrawVillain()
    DrawStageFence(Width, Height)
    DrawHero()
  end
end

function DrawScreenStatistics()
  love.graphics.setColor(255, 255, 255)
  --love.graphics.print("Screen-> Width: "..Width.." Height: "..Height)
  --love.graphics.line(Width / 2, 0, Width / 2, Height)
end

function ButtonSpawn(x, y, text, id)
  table.insert(button, {x = x, y = y, text = text, mouseover = false} )
end

function ButtonDraw()
  love.graphics.setFont(medium)
  for i, v in ipairs(button) do
     love.graphics.print(v.text, v.x, v.y)
  end
---if mouse is not on button, the color should be black
  --if v.mousover == false then
  --   love.graphics.setColor(0,0,0)
  -- end
---if mouse is on button
  -- if v.mousover == true then
  --   love.graphics.setColor(0,252,252)
  -- end
end
