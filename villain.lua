function CreateVillain()
  Villain = {}
  --Villain.sprite = love.graphics.newImage "villain.png"
  Villain.number = 0
  Villain.count = 0
  Villain.sprite = love.graphics.newImage "images/knight/knight_00.png"
  Villain.shieldSprite = love.graphics.newImage "images/shield/shield_01.png"
  Villain.lanceSprite = love.graphics.newImage "images/spear/spear_01.png"
  Villain.width = Villain.sprite:getWidth()
  Villain.height = Villain.sprite:getHeight()
  Villain.speed = 100
  Villain.x = Width - Villain.width
  Villain.y = Height / 1.3 - Villain.height / 2
  Villain.lancePosition = 0
  Villain.shieldPosition = 0
end

function DrawVillain()
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("Villain-> X:"..Villain.x.." Y: "..Villain.y.." width: "..Villain.width.." height: "..Villain.height, 0, 20)
  love.graphics.draw(Villain.sprite, Villain.x, Villain.y)
  if Villain.lancePosition == 0 then
    Villain.lanceSprite = love.graphics.newImage "images/spear/spear_00.png"
    love.graphics.draw(Villain.lanceSprite, Villain.x - Villain.width / 2, Villain.y + 30)
  elseif Villain.lancePosition == 1 then
    Villain.lanceSprite = love.graphics.newImage "images/spear/spear_01.png"
    love.graphics.draw(Villain.lanceSprite, Villain.x - Villain.width / 2, Villain.y + 30)
  elseif Villain.lancePosition == 2 then
    Villain.lanceSprite = love.graphics.newImage "images/spear/spear_02.png"
    love.graphics.draw(Villain.lanceSprite, Villain.x - Villain.width / 2, Villain.y + 30)
  end
  if Villain.shieldPosition == 0 then
    Villain.shieldSprite = love.graphics.newImage "images/shield/shield_00.png"
    love.graphics.draw(Villain.shieldSprite, Villain.x + Villain.width / 3, Villain.y + 40)
  elseif Villain.shieldPosition == 1 then
    Villain.shieldSprite = love.graphics.newImage "images/shield/shield_01.png"
    love.graphics.draw(Villain.shieldSprite, Villain.x + Villain.width / 3, Villain.y + 40)
  elseif Villain.shieldPosition == 2 then
    Villain.shieldSprite = love.graphics.newImage "images/shield/shield_02.png"
    love.graphics.draw(Villain.shieldSprite, Villain.x + Villain.width / 3, Villain.y + 40)
  end
end

function SetLance()
  if love.keyboard.isDown("e") then
    Villain.lancePosition = Villain.lancePosition + 1
    if Villain.lancePosition > 2 then
      Villain.lancePosition = 2
    end
    love.event.wait(1)
  elseif love.keyboard.isDown("d") then
    Villain.lancePosition = Villain.lancePosition - 1
    if Villain.lancePosition < 0 then
      Villain.lancePosition = 0
    end
    love.event.wait(1)
  end

end

function SetShield()
  if love.keyboard.isDown("r") then
    Villain.shieldPosition = Villain.shieldPosition + 1
    if Villain.shieldPosition > 2 then
      Villain.shieldPosition = 2
    end
    love.event.wait(1)
  elseif love.keyboard.isDown("f") then
    Villain.shieldPosition = Villain.shieldPosition - 1
    if Villain.shieldPosition < 0 then
      Villain.shieldPosition = 0
    end
    love.event.wait(1)
  end

end

function MoveVillain(dt)
  if (Villain.count > 10) then
    if Villain.number == 0 or Villain.number == 3 then
       Villain.number = 1
       Villain.sprite = love.graphics.newImage "images/knight/knight_01.png"
    elseif Villain.number == 1 then
       Villain.number = 2
       Villain.sprite = love.graphics.newImage "images/knight/knight_02.png"
    elseif Villain.number == 2 then
       Villain.number = 3
       Villain.sprite = love.graphics.newImage "images/knight/knight_03.png"
    end
    Villain.count = 0;
  end
  Villain.count = Villain.count + 1;
  Villain.x = Villain.x - Villain.speed * dt
end
