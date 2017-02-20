function CreateHero()
  Hero = {}

  if GoldArmor then
    CreateGold()
  else
    CreateRed()
  end

  Hero.currentSprite = 1
  Hero.currentShieldSprite = 2

  Hero.width = Hero.sprite[Hero.currentSprite]:getWidth()
  Hero.height = Hero.sprite[Hero.currentSprite]:getHeight()
  Hero.x = 0
  Hero.y = Height / 1.3 - Hero.height / 2
  Hero.speed = 150
  Hero.count = 0
  Hero.enableMovements = true

  Hero.lanceSprite = {}
  table.insert(Hero.lanceSprite, love.graphics.newImage "images/characters/hero lance/spear_00.png")
  table.insert(Hero.lanceSprite, love.graphics.newImage "images/characters/hero lance/spear_01.png")
  table.insert(Hero.lanceSprite, love.graphics.newImage "images/characters/hero lance/spear_02.png")
  table.insert(Hero.lanceSprite, love.graphics.newImage "images/characters/hero lance/spear_03.png")
  Hero.currentLanceSprite = 2
end

function DrawHero()
  love.graphics.setColor(255, 255, 255)
  if Hero.lanceSprite ~= nil then
    if Hero.currentLanceSprite == 4 then
      love.graphics.draw(Hero.lanceSprite[Hero.currentLanceSprite], Hero.x + Hero.width / 2, Hero.y - Hero.height / 2)
    else
      love.graphics.draw(Hero.lanceSprite[Hero.currentLanceSprite], Hero.x + Hero.width / 2, Hero.y + 30)
    end
  end
  love.graphics.draw(Hero.sprite[Hero.currentSprite], Hero.x, Hero.y)
  if Hero.shieldSprite ~= nil then
    love.graphics.draw(Hero.shieldSprite[Hero.currentShieldSprite], Hero.x + Hero.width / 2, Hero.y + 35)
  else
    love.graphics.draw(Hero.fallenSprite, Width / 2 - Hero.width / 2, Hero.y + 200)
  end
end

function ActionHero(key)
  if not ReachCenter() then
    if key == "e" then
      Hero.currentLanceSprite = Hero.currentLanceSprite + 1
      if Hero.currentLanceSprite > 3 then
        Hero.currentLanceSprite = 3
      end
    elseif key == "d" then
      Hero.currentLanceSprite = Hero.currentLanceSprite - 1
      if Hero.currentLanceSprite < 1 then
        Hero.currentLanceSprite = 1
      end
    end
    if key == "r" then
      Hero.currentShieldSprite = Hero.currentShieldSprite + 1
      if Hero.currentShieldSprite > 3 then
        Hero.currentShieldSprite = 3
      end
    elseif key == "f" then
      Hero.currentShieldSprite = Hero.currentShieldSprite - 1
      if Hero.currentShieldSprite < 1 then
        Hero.currentShieldSprite = 1
      end
    end
  end
end

function MoveHero(dt)
  if Hero.enableMovements then
    if  Hero.count == 10 then
      if not finish then
        Galop:play()
      end
      Hero.currentSprite = Hero.currentSprite + 1
      if Hero.currentSprite > 4 then
        Hero.currentSprite = 2
      end
      Hero.count = 0;
    end
    Hero.count = Hero.count + 1;
    Hero.x = Hero.x + Hero.speed * dt

    if Hero.shieldSprite ~= nil and Hero.x > Width - Width / 5 - Hero.width then
      Hero.enableMovements = false
      Hero.currentLanceSprite = 4
      Hero.currentShieldSprite = 2
      Hero.currentSprite = 1
      if not finish then
        Galop:stop()
        Ost:stop()
        VictorySound:play()
        finish = true
        Round = Round + 1
        CreateButtonLetter()
      end
    elseif Hero.shieldSprite == nil then
      CreateButtonLetter()
    end
  end
end

function ReachCenter()
  return Hero.x + Hero.width >= Width / 2
end

function HeroShieldPosition()
  return Hero.currentShieldSprite
end

function HeroLancePosition()
  return Hero.currentLanceSprite
end

function HeroFall()
  Hero.sprite = {}
  if GoldArmor then
    table.insert(Hero.sprite, love.graphics.newImage "images/characters/gold/horse_00.png")
    table.insert(Hero.sprite, love.graphics.newImage "images/characters/gold/horse_01.png")
    table.insert(Hero.sprite, love.graphics.newImage "images/characters/gold/horse_02.png")
    table.insert(Hero.sprite, love.graphics.newImage "images/characters/gold/horse_03.png")
  else
    table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/horse_00.png")
    table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/horse_01.png")
    table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/horse_02.png")
    table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/horse_03.png")
  end
  Hero.shieldSprite = nil
  Hero.lanceSprite = nil
end

function CreateRed()
  Hero.sprite = {}
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/knight_00.png")
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/knight_01.png")
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/knight_02.png")
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/knight_03.png")

  Hero.shieldSprite = {}
  table.insert(Hero.shieldSprite, love.graphics.newImage "images/characters/red/shield_00.png")
  table.insert(Hero.shieldSprite, love.graphics.newImage "images/characters/red/shield_01.png")
  table.insert(Hero.shieldSprite, love.graphics.newImage "images/characters/red/shield_02.png")

  Hero.fallenSprite = love.graphics.newImage "images/characters/red/fallen.png"
end

function CreateGold()
  Hero.sprite = {}
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/gold/knight_00.png")
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/gold/knight_01.png")
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/gold/knight_02.png")
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/gold/knight_03.png")

  Hero.shieldSprite = {}
  table.insert(Hero.shieldSprite, love.graphics.newImage "images/characters/gold/shield_00.png")
  table.insert(Hero.shieldSprite, love.graphics.newImage "images/characters/gold/shield_01.png")
  table.insert(Hero.shieldSprite, love.graphics.newImage "images/characters/gold/shield_02.png")

  Hero.fallenSprite = love.graphics.newImage "images/characters/gold/fallen.png"
end
