function CreateVillain()
  Villain = {}

  Villain.sprite = {}
  table.insert(Villain.sprite, love.graphics.newImage "images/characters/blue/knight_00.png")
  table.insert(Villain.sprite, love.graphics.newImage "images/characters/blue/knight_01.png")
  table.insert(Villain.sprite, love.graphics.newImage "images/characters/blue/knight_02.png")
  table.insert(Villain.sprite, love.graphics.newImage "images/characters/blue/knight_03.png")
  Villain.currentSprite = 1

  Villain.width = Villain.sprite[Villain.currentSprite]:getWidth()
  Villain.height = Villain.sprite[Villain.currentSprite]:getHeight()
  Villain.x = Width - Villain.width
  Villain.y = Height / 1.3 - Villain.height / 2
  Villain.speed = 150
  Villain.count = 0
  Villain.enableMovements = true

  Villain.shieldSprite = {}
  table.insert(Villain.shieldSprite, love.graphics.newImage "images/characters/blue/shield_00.png")
  table.insert(Villain.shieldSprite, love.graphics.newImage "images/characters/blue/shield_01.png")
  table.insert(Villain.shieldSprite, love.graphics.newImage "images/characters/blue/shield_02.png")
  Villain.currentShieldSprite = 2

  Villain.lanceSprite = {}
  table.insert(Villain.lanceSprite, love.graphics.newImage "images/characters/blue/spear_00.png")
  table.insert(Villain.lanceSprite, love.graphics.newImage "images/characters/blue/spear_01.png")
  table.insert(Villain.lanceSprite, love.graphics.newImage "images/characters/blue/spear_02.png")
  table.insert(Villain.lanceSprite, love.graphics.newImage "images/characters/blue/spear_03.png")
  Villain.currentLanceSprite = 2
end

function DrawVillain()
  love.graphics.setColor(255, 255, 255)
  if Villain.currentLanceSprite == 4 then
    love.graphics.draw(Villain.lanceSprite[Villain.currentLanceSprite], Villain.x + Villain.width / 2.3, Villain.y - Villain.height / 2)
  else
    love.graphics.draw(Villain.lanceSprite[Villain.currentLanceSprite], Villain.x - Villain.width / 2, Villain.y)
  end
  love.graphics.draw(Villain.sprite[Villain.currentSprite], Villain.x, Villain.y - 30)
  love.graphics.draw(Villain.shieldSprite[Villain.currentShieldSprite], Villain.x + Villain.width / 3, Villain.y + 5)
end

function ActionVillain(key)
  if Villain.enableMovements then
    if key == "i" then
      Villain.currentLanceSprite = Villain.currentLanceSprite + 1
      if Villain.currentLanceSprite > 3 then
        Villain.currentLanceSprite = 3
      end
    elseif key == "k" then
      Villain.currentLanceSprite = Villain.currentLanceSprite - 1
      if Villain.currentLanceSprite < 1 then
        Villain.currentLanceSprite = 1
      end
    end
    if key == "o" then
      Villain.currentShieldSprite = Villain.currentShieldSprite + 1
      if Villain.currentShieldSprite > 3 then
        Villain.currentShieldSprite = 3
      end
    elseif key == "l" then
      Villain.currentShieldSprite = Villain.currentShieldSprite - 1
      if Villain.currentShieldSprite < 1 then
        Villain.currentShieldSprite = 1
      end
    end
  end
end

function MoveVillain(dt)
  if Villain.enableMovements then
    if  Villain.count == 10 then
      if Villain.currentSprite == 1 or Villain.currentSprite == 4 then
         Villain.currentSprite = 2
      elseif Villain.currentSprite == 2 then
         Villain.currentSprite = 3
      elseif Villain.currentSprite == 3 then
         Villain.currentSprite = 4
      end
      Villain.count = 0;
    end
    Villain.count = Villain.count + 1;
    Villain.x = Villain.x - Villain.speed * dt
    if Villain.x < Width / 8 then
      Villain.enableMovements = false
      Villain.currentLanceSprite = 4
      Villain.currentShieldSprite = 2
      Villain.currentSprite = 1
    end
  end
end

function VillainShieldPosition()
  return Villain.currentShieldSprite
end

function VillainLancePosition()
  return Villain.currentLanceSprite
end
