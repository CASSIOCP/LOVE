local utf8 = require("utf8")
Text = ""
love.keyboard.setKeyRepeat(true)

function love.textinput(t)
  if State == "Name" and string.len(Text) < 15 then
    Text = Text..t
  end
end

function love.keypressed(key)
  if key == "backspace" then
    local byteoffset = utf8.offset(Text, -1)
    if byteoffset then
        Text = string.sub(Text, 1, byteoffset - 1)
    end
  end
end

function DrawTextBox(x, y, label, text)
  love.graphics.setFont(mainFont);
  love.graphics.setColor(0, 0, 0)
  text = string.format("%s: %s", label, Text)
  love.graphics.rectangle("line", x + mainFont:getWidth(label) + 20, y - mainFont:getHeight(label), 600, 80)
  love.graphics.printf(text, x, y, Width)
  return Text
end
