function CreateStage()
  Stage = {}
  Stage.background = love.graphics.newImage("images/backgrounds/landscape.png")

  Stage.cloud = {}
  table.insert(Stage.cloud, { image = love.graphics.newImage "images/backgrounds/cloud_00.png", x = 000, y = 10, speed = 100} )
  table.insert(Stage.cloud, { image = love.graphics.newImage "images/backgrounds/cloud_01.png", x = 300, y = 150, speed = 80} )
  table.insert(Stage.cloud, { image = love.graphics.newImage "images/backgrounds/cloud_02.png", x = 900, y = 100, speed = 50} )

  Stage.flagImage = {}
  table.insert(Stage.flagImage, love.graphics.newImage "images/backgrounds/flag_00.png")
  table.insert(Stage.flagImage, love.graphics.newImage "images/backgrounds/flag_01.png")

  Stage.flagPosition = {}
  table.insert(Stage.flagPosition, { x = 430, y = 140, count = 0, currentImage = 1} )
  table.insert(Stage.flagPosition, { x = 685, y = 005, count = 4, currentImage = 1} )
  table.insert(Stage.flagPosition, { x = 935, y = 140, count = 7, currentImage = 1} )

  Stage.castle = love.graphics.newImage("images/backgrounds/castle.png")
  Stage.shadowFence = love.graphics.newImage("images/elements/shadow_fence.png")
  Stage.fence = love.graphics.newImage("images/elements/fence.png")
  Stage.fenceWidth = Stage.fence:getWidth()
  Stage.fenceHeight = Stage.fence:getHeight()
end

function DrawStageBackground()
  love.graphics.draw(Stage.background)
  for i, v in ipairs(Stage.cloud) do
    love.graphics.draw(v.image, v.x, v.y)
  end
  love.graphics.draw(Stage.castle)
  for i, v in ipairs(Stage.flagPosition) do
    if v.count > 10 then
      v.count = 0
      if v.currentImage == 1 then
        v.currentImage = 2
      else
        v.currentImage = 1
      end
    end
    love.graphics.draw(Stage.flagImage[v.currentImage], v.x, v.y)
    v.count = v.count + 1
  end
end

function MoveClouds(dt)
  for i, v in ipairs(Stage.cloud) do
    v.x = v.x + v.speed * dt
    if v.x > Width then
      v.x = 0 - v.image:getWidth()
    end
  end
end

function DrawStageFence(width, height)
  love.graphics.draw(Stage.shadowFence, width / 2 - Stage.fenceWidth / 2, height / 1.3)
  love.graphics.draw(Stage.fence, width / 2 - Stage.fenceWidth / 2, height / 1.3)
end
