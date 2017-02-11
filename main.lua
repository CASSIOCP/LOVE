Width = love.graphics.getWidth()
Height = love.graphics.getHeight()
bg = love.graphics.newImage("castelo.png")
StartDuel = false

BgSound = love.audio.newSource("encore.mp3", "stream")
--set the volume of the sound
--BgSound:setVolume(0.5)
--set the pitch level
--BgSound:setPitch(0.25)
--play the sound, you can also use shorthand BgSound:play()

function love.load(arg)
  --imports
  hero = require "hero"
  villain = require "villain"
  --Load classes
  CreateHero()
  CreateVillain()
end

function love.update(dt)
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

function love.draw()
  love.graphics.draw(bg)
  DrawScreenStatistics()
  DrawHero();
  DrawVillain()
end

function DrawScreenStatistics()
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("Screen-> Width: "..Width.." Height: "..Height)
  love.graphics.line(Width / 2, 0, Width / 2, Height)
end
