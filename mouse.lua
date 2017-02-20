function CreateButton()
  Button = {}
  table.insert(Button, { x = 400, y = 600, id = "start", mouseOver = false, spriteNormal = love.graphics.newImage "images/buttons/player_01.png", spriteOver = love.graphics.newImage "images/buttons/player_02.png" } )
  table.insert(Button, { x = 400, y = 680, id = "multiplayer", mouseOver = false, spriteNormal = love.graphics.newImage "images/buttons/multiplayer_01.png", spriteOver = love.graphics.newImage "images/buttons/multiplayer_02.png"} )
  table.insert(Button, { x = 750, y = 600, id = "tutorial", mouseOver = false, spriteNormal = love.graphics.newImage "images/buttons/tutorial_01.png", spriteOver = love.graphics.newImage "images/buttons/tutorial_02.png" } )
  table.insert(Button, { x = 750, y = 680, id = "credits", mouseOver = false, spriteNormal = love.graphics.newImage "images/buttons/credits_01.png", spriteOver = love.graphics.newImage "images/buttons/credits_02.png" } )
end

function CreateButtonName()
  Button = {}
  table.insert(Button, { x = Width - 300, y = Height / 2 - 30, id = "ok1", mouseOver = false, spriteNormal = love.graphics.newImage "images/buttons/ok_01.png", spriteOver = love.graphics.newImage "images/buttons/ok_02.png" } )
end

function CreateButtonLetter()
  Button = {}
  table.insert(Button, { x = Width - 200, y = Height - 100, id = "ok2", mouseOver = false, spriteNormal = love.graphics.newImage "images/buttons/ok_01.png", spriteOver = love.graphics.newImage "images/buttons/ok_02.png" } )
end

function ButtonClick(id)
  if love.mouse.isDown("1") then
    MetalSound:play()
    if id == "start" then
      State = "Name"
      CreateButtonName()
    elseif id == "ok1" then
      State = "Story"
      CreateButtonLetter()
    elseif id == "ok2" or id == "multiplayer" then
      if id == "multiplayer" then
        Multiplayer = true
      end
      State = "Play"
      BgSound:stop()
      Ost:play()
      ResetState()
    elseif id == "credits" then
      State = "Credits"
    elseif id=="tutorial" then
      State = "Tutorial"
    elseif id == "exit" then
      State = "Exit"
    end
  end
end

function MouseCheck()
  for i, v in ipairs(Button) do
    if love.mouse.getX() > v.x and love.mouse.getX() < v.x + v.spriteNormal:getWidth() and
       love.mouse.getY() > v.y and love.mouse.getY() < v.y + v.spriteNormal:getHeight() then
      v.mouseOver = true
      ButtonClick(v.id)
    else
      v.mouseOver = false
    end
  end
end

function ButtonDraw()
  love.graphics.setColor(255, 255, 255)
  for i, v in ipairs(Button) do
    if v.mouseOver then
      love.graphics.draw(v.spriteOver, v.x, v.y)
    else
      love.graphics.draw(v.spriteNormal, v.x, v.y)
    end
  end
end
