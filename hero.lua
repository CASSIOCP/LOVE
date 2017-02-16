function CreateHero()
  Hero = {}

  Hero.sprite = {}
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/knight_00.png")
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/knight_01.png")
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/knight_02.png")
  table.insert(Hero.sprite, love.graphics.newImage "images/characters/red/knight_03.png")
  Hero.currentSprite = 1

  Hero.width = Hero.sprite[Hero.currentSprite]:getWidth()
  Hero.height = Hero.sprite[Hero.currentSprite]:getHeight()
  Hero.x = 0
  Hero.y = Height / 1.3 - Hero.height / 2
  Hero.speed = 150
  Hero.count = 0
  Hero.enableMovements = true

  Hero.shieldSprite = {}
  table.insert(Hero.shieldSprite, love.graphics.newImage "images/characters/red/shield_00.png")
  table.insert(Hero.shieldSprite, love.graphics.newImage "images/characters/red/shield_01.png")
  table.insert(Hero.shieldSprite, love.graphics.newImage "images/characters/red/shield_02.png")
  Hero.currentShieldSprite = 2

  Hero.lanceSprite = {}
  table.insert(Hero.lanceSprite, love.graphics.newImage "images/characters/red/spear_00.png")
  table.insert(Hero.lanceSprite, love.graphics.newImage "images/characters/red/spear_01.png")
  table.insert(Hero.lanceSprite, love.graphics.newImage "images/characters/red/spear_02.png")
  table.insert(Hero.lanceSprite, love.graphics.newImage "images/characters/red/spear_03.png")
  Hero.currentLanceSprite = 2
end

function DrawHero()
  love.graphics.setColor(255, 255, 255)
  if Hero.currentLanceSprite == 4 then
    love.graphics.draw(Hero.lanceSprite[Hero.currentLanceSprite], Hero.x + Hero.width / 2, Hero.y - Hero.height / 2)
  else
    love.graphics.draw(Hero.lanceSprite[Hero.currentLanceSprite], Hero.x + Hero.width / 2, Hero.y + 30)
  end
  love.graphics.draw(Hero.sprite[Hero.currentSprite], Hero.x, Hero.y)
  love.graphics.draw(Hero.shieldSprite[Hero.currentShieldSprite], Hero.x + Hero.width / 2, Hero.y + 35)
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
      if Hero.currentSprite == 1 or Hero.currentSprite == 4 then
         Hero.currentSprite = 2
      elseif Hero.currentSprite == 2 then
         Hero.currentSprite = 3
      elseif Hero.currentSprite == 3 then
         Hero.currentSprite = 4
      end
      Hero.count = 0;
    end
    Hero.count = Hero.count + 1;
    Hero.x = Hero.x + Hero.speed * dt
    if Hero.x > Width - Width / 8 - Hero.width then
      Hero.enableMovements = false
      Hero.currentLanceSprite = 4
      Hero.currentShieldSprite = 2
      Hero.currentSprite = 1
    end
  end
end

function ReachCenter()
  return Hero.x >= Width / 1.8
end

function HeroShieldPosition()
  return Hero.currentShieldSprite
end

function HeroLancePosition()
  return Hero.currentLanceSprite
end
