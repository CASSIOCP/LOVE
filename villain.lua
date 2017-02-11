function CreateVillain()
  Villain = {}
  Villain.sprite = love.graphics.newImage "villain.png"
  Villain.width = Villain.sprite:getWidth()
  Villain.height = Villain.sprite:getHeight()
  Villain.speed = 100
  Villain.x = Width - Villain.width
  Villain.y = Height / 1.3 - Villain.height / 2
end

function DrawVillain()
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("Villain-> X:"..Villain.x.." Y: "..Villain.y.." width: "..Villain.width.." height: "..Villain.height, 0, 20)
  love.graphics.draw(Villain.sprite, Villain.x, Villain.y)
  --love.graphics.setColor(0, 255, 0)
  --love.graphics.rectangle("fill", Villain.x, Villain.y, Villain.width, Villain.height)
end

function MoveVillain(dt)
  Villain.x = Villain.x - Villain.speed * dt
end
