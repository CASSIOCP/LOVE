function CreateHero()
  Hero = {}
  Hero.sprite = love.graphics.newImage "images/hero.png"
  --Hero.shieldSprite = love.graphics.newImage "images/shield/shield.png"
  --Hero.lanceSprite = love.graphics.newImage "images/spear/spear.png"
  Hero.width = Hero.sprite:getWidth()
  Hero.height = Hero.sprite:getHeight()
  Hero.speed = 100
  Hero.x = 0--Width / 10 - Hero.width / 2
  Hero.y = Height / 1.3 - Hero.height / 2
end

function DrawHero()
  --love.graphics.setColor(255, 255, 255)
  --love.graphics.print("Hero-> X:"..Hero.x.." Y: "..Hero.y.." width: "..Hero.width.." height: "..Hero.height, 0, 10)
  --love.graphics.draw(Hero.sprite, Hero.x, Hero.y)
  --love.graphics.draw(Hero.shieldSprite, Hero.x + 130, Hero.y + 50)
  --love.graphics.draw(Hero.lanceSprite, Hero.x + 30, Hero.y + 30)
end

function MoveHero(dt)
  Hero.x = Hero.x + Hero.speed * dt
end
