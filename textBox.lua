local utf8 = require("utf8")
Text = ""
love.keyboard.setKeyRepeat(true)

function love.textinput(t)
  if State == "Name" and string.len(Text) < 15 then
    Text = Text..t
  end
end

function Backspace(key)
  if key == "backspace" then
    local byteoffset = utf8.offset(Text, -1)
    if byteoffset then
        Text = string.sub(Text, 1, byteoffset - 1)
    end
  end
end

function DrawTextBox()
  love.graphics.setFont(mainFont);
  love.graphics.setColor(0, 0, 0)
  love.graphics.printf(Text, 390, 360, Width)
  love.graphics.setColor(255, 255, 255)
  return Text
end
