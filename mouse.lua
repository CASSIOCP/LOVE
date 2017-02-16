Button = {}

function CreateButton()
  ButtonSpawn(Width - 300, Height - 220, "START GAME", "start")
  ButtonSpawn(Width - 260, Height - 150, "OPTIONS", "options")
  ButtonSpawn(Width - 200, Height - 80, "EXIT", "exit")
end

medium = love.graphics.newFont(45)

function ButtonClick(id)
  if love.mouse.isDown("1") then
    if id == "start" then
      State = "Play"
    elseif id == "options" then
      State = "Options"
    elseif id == "exit" then
      State = "Exit"
    end
  end
end

function MouseCheck()
  for i, v in ipairs(Button) do
    if love.mouse.getX() > v.x and love.mouse.getX() < v.x + medium:getWidth(v.text) and
       love.mouse.getY() > v.y and love.mouse.getY() < v.y + medium:getHeight(v.text) then
      v.mouseOver = true
      ButtonClick(v.id)
    else
      v.mouseOver = false
    end
  end
end

function ButtonDraw()
  love.graphics.setFont(medium)  
  for i, v in ipairs(Button) do
    if v.mouseOver then
      if love.keyboard.isDown("x") then
        love.graphics.print("sim", 0, 100)
      end
      love.graphics.print("id: "..v.id, 0, 0)
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
