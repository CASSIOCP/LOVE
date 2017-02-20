Width = love.graphics.getWidth()
Height = love.graphics.getHeight()
State = "Menu"

player_name = love.graphics.newImage("images/backgrounds/player_name.png")
letter = love.graphics.newImage("images/backgrounds/letter.png")
background = love.graphics.newImage("images/backgrounds/screen.png")
clash = love.graphics.newImage("images/backgrounds/clash.png")
timerImage = love.graphics.newImage("images/backgrounds/timer.png")
victory = love.graphics.newImage("images/backgrounds/victory.png")
defeat = love.graphics.newImage("images/backgrounds/defeat.png")
creditscreen = love.graphics.newImage("images/backgrounds/credits.png")

mainFont = love.graphics.newFont("Oldengl.ttf", 45);
secondFont = love.graphics.newFont("Oldengl.ttf", 32);
normal = love.graphics.newFont(14)

Round = 1
Multiplayer = false
GoldArmor = false
Reset = false

function love.load(arg)
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
  tutorial = require "tutorial"

  --Load classes
  CreateButton()
  ResetState()
  LoadTutorial(arg)
  BgSound:play()
end

function love.update(dt)
  MouseCheck()
  if State == "Tutorial" then
    TutorialUpdate(dt)
  elseif State == "Play" then
    MoveClouds(dt)
    if not Multiplayer then
      ComputerAI()
    end
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
end

function love.draw()
  ResetFont()
  if State == "Menu" then
    love.graphics.draw(background)
    ButtonDraw()
  elseif State == "Credits" then
  	love.graphics.draw(creditscreen)
  	love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(secondFont)
    love.graphics.print("Pressione Enter p/ retornar", 465, 600)
    love.graphics.setFont(mainFont)
  elseif State == "Tutorial" then
  	DrawTutorial()
  elseif State == "Name" then
    love.graphics.draw(player_name)
    Name = DrawTextBox(100, Height / 2, "Jogador, escreva teu nome", Name)
    ButtonDraw()
  elseif State == "Story" then
    love.graphics.draw(letter)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(secondFont)
    love.graphics.print(Name, 710 - (15 * string.len(Name)), 145)
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
    if ReachCenter() then
      love.graphics.print(venceu, Width / 4, 10)
      if clashCount > 0 then
        clashCount = clashCount - 1
        love.graphics.draw(clash, 0, 0)
      end
    end

    DrawTimer()

    if finish then
      love.graphics.setColor(255, 255, 255)
      if venceu == "Hero ganhou" then
        love.graphics.draw(victory, Width / 2 - victory:getWidth() / 2, 100)
      elseif venceu == "Villain ganhou" then
        love.graphics.draw(defeat, Width / 2 - defeat:getWidth() / 2, 100)
      end
      ButtonDraw()
    end
  end
end

function ResetFont()
  love.graphics.setFont(normal)
  love.graphics.setColor(255, 255, 255)
end

function love.keypressed(key, scancode, isrepeat)
  if State == "Play" or State == "Tutorial" then
    if Multiplayer or State == "Tutorial" then
      ActionVillain(key)
    end
    ActionHero(key)
  elseif State == "Name" then
    Backspace(key)
  end
  if State == "Credits" and key == "return" then
	  State = "Menu"
	end
  if key == "escape" then
    love.event.quit(0)
  end
end

function DrawTimer()
  love.graphics.setFont(mainFont)
  if (love.timer.getTime() - startTime) <= timer then
    love.graphics.draw(timerImage, Width - 210, 10)
    result = string.format("%.2d", (timer - (love.timer.getTime() - startTime)))
    love.graphics.setColor(0, 0, 0)
    love.graphics.print(result, Width - 130, 70)
  end
end

function ResetState()
  startTime = love.timer.getTime()
  timer = 10

  StartDuel = false
  finish = false
  clashCount = 20
  venceu = ""

  CreateHero()
  CreateVillain()
  CreateStage()
  CreateChocolate()
end
