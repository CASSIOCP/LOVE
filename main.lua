Width = love.graphics.getWidth()
Height = love.graphics.getHeight()
StartDuel = false
State = "Menu"
--background = love.graphics.newImage("images/backgrounds/joust.jpg")
player_name = love.graphics.newImage("images/backgrounds/player_name.png")
letter = love.graphics.newImage("images/backgrounds/letter.png")
background = love.graphics.newImage("images/backgrounds/screen.png")
clash = love.graphics.newImage("images/backgrounds/clash.png")
timerImage = love.graphics.newImage("images/backgrounds/timer.png")

mainFont = love.graphics.newFont("Oldengl.ttf", 45);
secondFont = love.graphics.newFont("Oldengl.ttf", 32);
normal = love.graphics.newFont(14)

finish = false

Round = 2
Multiplayer = false

function love.load(arg)
  timer = 10
  startTime = love.timer.getTime()

  venceu = ""
  Name = ""
  love.graphics.setFont(mainFont);

  --imports
  mouse = require "mouse"
  hero = require "hero"
  villain = require "villain"
  stage = require "stage"
  textBox = require "textBox"
  chocolate = require "chocolate"
  sound = require "sound"

  --Load classes
  CreateButton()
  CreateHero()
  CreateVillain()
  CreateStage()
  CreateChocolate()
  --BgSound:play()
end

function love.update(dt)
  if State == "Menu" or State == "Name" or State == "Story" then
    MouseCheck()
  elseif State == "Play" then
    MoveClouds(dt)
    if not StartDuel and (love.keyboard.isDown("space") or (love.timer.getTime() - startTime >= timer)) then
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
        if venceu == "" then
          if HeroLancePosition() ~= VillainShieldPosition() then
            if HeroShieldPosition() == VillainLancePosition() then
              venceu = "Hero ganhou"
              VillainFall()
            else
              venceu = "Derrota dupla"
              HeroFall()
              VillainFall()
            end
          else
            if HeroShieldPosition() == VillainLancePosition() then
              venceu = "Empate"
            else
              venceu = "Villain ganhou"
              HeroFall()
            end
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
  elseif State == "Name" then
    love.graphics.draw(player_name)
    Name = DrawTextBox(100, Height / 2, "Jogador, escreva teu nome", Name)
    ButtonDraw()
  elseif State == "Story" then
    love.graphics.draw(letter)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(secondFont)
    love.graphics.print(Name, 465, 145)
    love.graphics.setFont(mainFont)
    ButtonDraw()
  elseif State == "Play" then
    ResetFont()
    DrawStageBackground()
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
    love.graphics.print("HeroLancePosition: "..HeroLancePosition(), Width / 4, 30)
    love.graphics.print("HeroShieldPosition: "..HeroShieldPosition(), Width / 4, 50)
    love.graphics.print("VillainLancePosition: "..VillainLancePosition(), Width / 4, 70)
    love.graphics.print("VillainShieldPosition: "..VillainShieldPosition(), Width / 4, 90)
    if ReachCenter() then
      love.graphics.print(venceu, Width / 4, 10)

    end

    love.graphics.setFont(mainFont)
    if (love.timer.getTime() - startTime) <= timer then
      love.graphics.draw(timerImage, Width - 210, 10)
      result = string.format("%.2d", (timer - (love.timer.getTime() - startTime)))
      love.graphics.setColor(0, 0, 0)
      love.graphics.print(result, Width - 130, 70)
    end

  end
  --love.graphics.draw(button1, Width - 300, Height - 220)
  --love.graphics.draw(button2, Width - 300, Height - 150)
end

function ResetFont()
  love.graphics.setFont(normal)
  love.graphics.setColor(255, 255, 255)
end

function love.keypressed(key, scancode, isrepeat)
  if State == "Play" then
    ActionVillain(key)
    ActionHero(key)
  elseif State == "Name" then
    Backspace(key)
  end
  if key == "escape" then
    love.event.quit(0)
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
