Width = love.graphics.getWidth()
Height = love.graphics.getHeight()
StartDuel = false
State = "Menu"
background = love.graphics.newImage("images/backgrounds/joust.jpg")
--BgSound = love.audio.newSource("sounds/encore.mp3", "stream")
--set the volume of the sound
--BgSound:setVolume(0.5)
--set the pitch level
--BgSound:setPitch(0.25)
--play the sound, you can also use shorthand BgSound:play()

function love.load(arg)
  Cloud = {}
  Cloud.sprite = {}
  table.insert(Cloud.sprite, love.graphics.newImage "images/elements/cloud_00.png")
  table.insert(Cloud.sprite, love.graphics.newImage "images/elements/cloud_01.png")
  table.insert(Cloud.sprite, love.graphics.newImage "images/elements/cloud_02.png")
  table.insert(Cloud.sprite, love.graphics.newImage "images/elements/cloud_03.png")
  Cloud.currentSprite = 1
  Cloud.count = 0
  Cloud.NeedDraw = true
  venceu = ""

  --imports
  --if State == "Menu" then
    --button1 = love.graphics.newImage "images/buttons/new_game_00.png"
    --button2 = love.graphics.newImage "images/buttons/new_game_01.png"
  --elseif State == "Play" then
    mouse = require "mouse"
    hero = require "hero"
    villain = require "villain"
    stage = require "stage"
    --love.keyboard.setKeyRepeat(0.2, 0.3)
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

      if ReachCenter() then
        if Cloud.NeedDraw then
          DrawCloud()
        end
        if not HeroLancePosition() == VillainShieldPosition() then
          if HeroShieldPosition() == VillainLancePosition() then
            venceu = "Hero ganhou"
          else
            venceu = "empate"
          end
        else
          if HeroShieldPosition() == VillainLancePosition() then
            venceu = "empate"
          else
            venceu = "Villain ganhou"
          end
        end
      end

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
    if ReachCenter() and Cloud.NeedDraw then
      love.graphics.draw(Cloud.sprite[Cloud.currentSprite], Width / 4, Height / 3)
    end
    if ReachCenter() then
      love.graphics.print(venceu, Width / 4, 10)
    end
  end
  --love.graphics.draw(button1, Width - 300, Height - 220)
  --love.graphics.draw(button2, Width - 300, Height - 150)
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

function love.keypressed(key, scancode, isrepeat)
  ActionVillain(key)
  ActionHero(key)
end

function DrawCloud()
  if Cloud.count == 10 then
    Cloud.currentSprite = Cloud.currentSprite + 1
    if Cloud.currentSprite > 4 then
       Cloud.NeedDraw = false
    end
    Cloud.count = 0;
  end
  Cloud.count = Cloud.count + 1;
end
