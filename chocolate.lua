function CreateChocolate()
  Chocolate = {}

  Chocolate.choco = {}
  Chocolate.choco.sprite = {}
  table.insert(Chocolate.choco.sprite, love.graphics.newImage "images/elements/choc_01.png")
  table.insert(Chocolate.choco.sprite, love.graphics.newImage "images/elements/choc_02.png")
  table.insert(Chocolate.choco.sprite, love.graphics.newImage "images/elements/choc_03.png")
  table.insert(Chocolate.choco.sprite, love.graphics.newImage "images/elements/choc_04.png")
  table.insert(Chocolate.choco.sprite, love.graphics.newImage "images/elements/choc_05.png")
  table.insert(Chocolate.choco.sprite, love.graphics.newImage "images/elements/choc_06.png")
  table.insert(Chocolate.choco.sprite, love.graphics.newImage "images/elements/choc_07.png")
  table.insert(Chocolate.choco.sprite, love.graphics.newImage "images/elements/choc_08.png")
  Chocolate.choco.currentSprite = 1
  Chocolate.choco.count = - 80

  Chocolate.choco.width = Chocolate.choco.sprite[Chocolate.choco.currentSprite]:getWidth()
  Chocolate.choco.height = Chocolate.choco.sprite[Chocolate.choco.currentSprite]:getHeight()

  Chocolate.choco.x = Width / 2 - Chocolate.choco.width / 2
  Chocolate.choco.y = Height / 2 - Chocolate.choco.height / 2

  Chocolate.circle = {}
  Chocolate.circle.sprite = {}
  table.insert(Chocolate.circle.sprite, love.graphics.newImage "images/elements/circle_01.png")
  table.insert(Chocolate.circle.sprite, love.graphics.newImage "images/elements/circle_02.png")
  Chocolate.circle.currentSprite = 1
  Chocolate.circle.count = 0

  Chocolate.circle.width = Chocolate.circle.sprite[Chocolate.circle.currentSprite]:getWidth()
  Chocolate.circle.height = Chocolate.circle.sprite[Chocolate.circle.currentSprite]:getHeight()

  Chocolate.circle.x = Width / 2 - Chocolate.circle.width / 2
  Chocolate.circle.y = Height / 2 - Chocolate.circle.height / 2
end

function DrawChocolate()
  love.graphics.setColor(255, 255, 255)

  if Chocolate.circle.count > 10 then
    Chocolate.circle.count = 0
    Chocolate.circle.currentSprite = Chocolate.circle.currentSprite + 1
    if Chocolate.circle.currentSprite > 2 then
      Chocolate.circle.currentSprite = 1
    end
  end
  Chocolate.circle.count = Chocolate.circle.count + 1
  love.graphics.draw(Chocolate.circle.sprite[Chocolate.circle.currentSprite], Chocolate.circle.x, Chocolate.circle.y)

  if Chocolate.choco.count > 12 then
    Chocolate.choco.count = 0
    Chocolate.choco.currentSprite = Chocolate.choco.currentSprite + 1
    if Chocolate.choco.currentSprite > 8 then
      Chocolate.choco.currentSprite = 1
      Chocolate.choco.count = - 15
    end
  end
  Chocolate.choco.count = Chocolate.choco.count + 1

  love.graphics.draw(Chocolate.choco.sprite[Chocolate.choco.currentSprite], Chocolate.choco.x, Chocolate.choco.y)
end
