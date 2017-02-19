Width = love.graphics.getWidth()
Height = love.graphics.getHeight()
StartDuel = false
State = "Menu"
--background = love.graphics.newImage("images/backgrounds/joust.jpg")
background2 = love.graphics.newImage("images/backgrounds/landscape.png")
letter = love.graphics.newImage("images/backgrounds/letter.png")
background = love.graphics.newImage("images/backgrounds/screen.jpg")
mainFont = love.graphics.newFont("Lohengrin.ttf", 45);

BgSound = love.audio.newSource("sounds/intro.mp3", "stream")
BgSound:setVolume(0.4)
BgSound:setPitch(0.9)

MetalSound = love.audio.newSource("sounds/metal.mp3", "stream")
MetalSound:setVolume(0.7)
MetalSound:setPitch(0.9)

Ost = love.audio.newSource("sounds/ost2.mp3", "stream")
Ost:setVolume(0.3)
Ost:setPitch(0.9)

Galop = love.audio.newSource("sounds/galop.mp3", "stream")
Galop:setVolume(0.8)
Galop:setPitch(1.0)

MetalSound2 = love.audio.newSource("sounds/metal.mp3", "stream")
MetalSound2:setVolume(0.8)
MetalSound2:setPitch(0.5)
ms = true

VictorySound = love.audio.newSource("sounds/victory.mp3", "stream")
VictorySound:setVolume(0.5)
VictorySound:setPitch(0.9)

finish = false

function love.load(arg)
  timer = 10
  startTime = love.timer.getTime()
  --medium = love.graphics.newFont(45)
  venceu = ""
  Name = ""
    love.graphics.setFont(mainFont);
  --imports
  --if State == "Menu" then
    --button1 = love.graphics.newImage "images/buttons/new_game_00.png"
    --button2 = love.graphics.newImage "images/buttons/new_game_01.png"
  --elseif State == "Play" then
    mouse = require "mouse"
    hero = require "hero"
    villain = require "villain"
    stage = require "stage"
    textBox = require "textBox"
    chocolate = require "chocolate"
    --love.keyboard.setKeyRepeat(0.2, 0.3)
    --Load classes
    CreateButton()
    CreateHero()
    CreateVillain()
    CreateStage()
    CreateChocolate()
    --love.audio.play(BgSound)
    BgSound:play()
  --end
end

function love.update(dt)
  --  State = "Play"
  if State == "Menu" or State == "Name" or State == "Story" then
    MouseCheck()
  elseif State == "Options" then
    --
  elseif State == "Play" then
    MoveClouds(dt)
    if not StartDuel and (love.keyboard.isDown("space") or (love.timer.getTime() - startTime >= 10)) then
      StartDuel = true;
    elseif StartDuel then
      MoveHero(dt)
      MoveVillain(dt)

      if ReachCenter() then
        if (ms == true) then
          MetalSound2:play()
          ms = false;
        end
        --if Stage. .NeedDraw then
        --  DrawCloud()
        --end
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
  elseif State == "Name" then
    love.graphics.draw(background2)
    Name = DrawTextBox(100, Height / 2, "Jogador, escreva teu nome", Name)
    ButtonDraw()
  elseif State == "Story" then
    love.graphics.draw(letter)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(mainFont)
    love.graphics.print(Name, 465, 155)
    ButtonDraw()
  elseif State == "Play" then
    ResetFont()
    DrawStageBackground()
    DrawScreenStatistics()
    DrawVillain()
    DrawStageFence(Width, Height)
    love.graphics.setColor(255, 255, 0)
    love.graphics.rectangle("fill", Width / 2, Height / 1.295, 15, 8)
    DrawHero()
    -- if ReachCenter() and Cloud.NeedDraw then
    --   love.graphics.draw(Cloud.sprite[Cloud.currentSprite], Width / 3.5, Height / 3)
    --   love.graphics.draw(Cloud.sprite[Cloud.currentSprite], Width / 4, Height / 3)
    --   love.graphics.draw(Cloud.sprite[Cloud.currentSprite], Width / 4.5, Height / 3)
    -- end
    --DrawChocolate()
    if ReachCenter() then
      love.graphics.print(venceu, Width / 4, 10)
    end
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(mainFont)
    if (love.timer.getTime() - startTime) <= 10 then
      result = string.format( "Tempo: %.2d", (10 - (love.timer.getTime() - startTime)))
      love.graphics.print(result, 500, 100)
    end

  end
  --love.graphics.draw(button1, Width - 300, Height - 220)
  --love.graphics.draw(button2, Width - 300, Height - 150)
end

function DrawScreenStatistics()
  love.graphics.setColor(255, 255, 255)
  --love.graphics.print("Screen-> Width: "..Width.." Height: "..Height)
  --love.graphics.line(Width / 2, 0, Width / 2, Height)
end

function ResetFont()
  normal = love.graphics.newFont(14)
  love.graphics.setFont(normal)
  love.graphics.setColor(255, 255, 255)
end

function love.keypressed(key, scancode, isrepeat)
  if State == "Play" then
    ActionVillain(key)
    ActionHero(key)
  end
end

-- function DrawCloud()
--   if Cloud.count == 10 then
--     Cloud.currentSprite = Cloud.currentSprite + 1
--     if Cloud.currentSprite > 4 then
--        Cloud.NeedDraw = false
--     end
--     Cloud.count = 0;
--   end
--   Cloud.count = Cloud.count + 1;
-- end
