function CreateButton()
  Button = {}
  ButtonSpawn(Width - 350, Height - 220, "START GAME", "start")
  ButtonSpawn(Width - 310, Height - 150, "OPTIONS", "options")
  ButtonSpawn(Width - 250, Height - 80, "EXIT", "exit")
end

function CreateButtonName()
  Button = {}
  ButtonSpawn(Width - 200, Height / 2, "OK", "ok1")
end

function CreateButtonLetter()
  Button = {}
  ButtonSpawn(Width - 200, Height - 100, "OK", "ok2")
end

function ButtonClick(id)
  if love.mouse.isDown("1") then
    MetalSound:play()
    --love.audio.stop()
    if id == "start" then
      State = "Name"
      CreateButtonName()
    elseif id == "ok1" then
      State = "Story"
      CreateButtonLetter()
    elseif id == "ok2" then
      State = "Play"
      BgSound:stop()
      Ost:play()
      startTime = love.timer.getTime()
    elseif id == "options" then
      State = "Options"
    elseif id == "exit" then
      State = "Exit"
    end
  end
end

function MouseCheck()
  for i, v in ipairs(Button) do
    if love.mouse.getX() > v.x and love.mouse.getX() < v.x + mainFont:getWidth(v.text) and
       love.mouse.getY() > v.y and love.mouse.getY() < v.y + mainFont:getHeight(v.text) then
      v.mouseOver = true
      ButtonClick(v.id)
    else
      v.mouseOver = false
    end
  end
end

function ButtonDraw()
  love.graphics.setFont(mainFont)
  for i, v in ipairs(Button) do
    if v.mouseOver then
      love.graphics.setColor(255, 255, 255)
    else
      love.graphics.setColor(0, 0, 0)
    end
    love.graphics.print(v.text, v.x, v.y)
  end
end

function ButtonSpawn(x, y, text, id)
  table.insert(Button, {x = x, y = y, text = text, id = id, mouseOver = false} )
end
