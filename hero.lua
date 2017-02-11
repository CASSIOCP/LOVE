function CreateHero()
  Hero = {}
  Hero.sprite = love.graphics.newImage "hero.png"
  Hero.width = Hero.sprite:getWidth()
  Hero.height = Hero.sprite:getHeight()
  Hero.speed = 100
  Hero.x = 0--Width / 10 - Hero.width / 2
  Hero.y = Height / 1.3 - Hero.height / 2  
end

function DrawHero()
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("Hero-> X:"..Hero.x.." Y: "..Hero.y.." width: "..Hero.width.." height: "..Hero.height, 0, 10)
  --love.graphics.setColor(255, 0, 0)
  --love.graphics.rectangle("fill", Hero.x, Hero.y, Hero.width, Hero.height)
  love.graphics.draw(Hero.sprite, Hero.x, Hero.y)
end

function MoveHero(dt)
  Hero.x = Hero.x + Hero.speed * dt
end
