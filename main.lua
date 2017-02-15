Width = love.graphics.getWidth()
Height = love.graphics.getHeight()
StartDuel = false
State = "Menu"
background = love.graphics.newImage("images/backgrounds/joust.jpg")
BgSound = love.audio.newSource("sounds/encore.mp3", "stream")
--set the volume of the sound
--BgSound:setVolume(0.5)
--set the pitch level
--BgSound:setPitch(0.25)
--play the sound, you can also use shorthand BgSound:play()

function love.load(arg)
  --imports
  --if State == "Menu" then

  --elseif State == "Play" then
    mouse = require "mouse"
    hero = require "hero"
    villain = require "villain"
    stage = require "stage"
    love.keyboard.setKeyRepeat(0.2, 0.3)
    --Load classes
    CreateButton()
    CreateHero()
    CreateVillain()
    CreateStage()
  --end
end

function love.update(dt)
  --  State = "Play"
  if State == "Menu" then
    MouseCheck()
  elseif State == "Options" then
    --
  elseif State == "Play" then
    if not StartDuel and love.keyboard.isDown("space") then
      StartDuel = true;
    elseif StartDuel then
      MoveHero(dt)
      MoveVillain(dt)
    end
  elseif State == "Exit" then
    love.event.quit(0)
  end

  -- if Hero.x >= Width / 2 - Hero.width then
  --   love.audio.play(BgSound)
  -- end
end

function love.draw()
  ResetFont()
  if State == "Menu" then
    love.graphics.draw(background)
    ButtonDraw()
  elseif State == "Options" then
    --
  elseif State == "Play" then
    ResetFont()
    DrawStageBackground()
    DrawScreenStatistics()
    DrawVillain()
    DrawStageFence(Width, Height)
    DrawHero()
    SetLance()
    SetShield()
  end
end

function DrawScreenStatistics()
  love.graphics.setColor(255, 255, 255)
  --love.graphics.print("Screen-> Width: "..Width.." Height: "..Height)
  love.graphics.line(Width / 2, 0, Width / 2, Height)
end

function ResetFont()
  normal = love.graphics.newFont(14)
  love.graphics.setFont(normal)
  love.graphics.setColor(255, 255, 255)
end
