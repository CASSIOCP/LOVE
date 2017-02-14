function CreateStage()
  Stage = {}
  Stage.background = love.graphics.newImage("castelo.png")
  Stage.fence = love.graphics.newImage("fence.png")
  Stage.fenceWidth = Stage.fence:getWidth()
  Stage.fenceHeight = Stage.fence:getHeight()
end

function DrawStageBackground()
  love.graphics.draw(Stage.background)
end

function DrawStageFence(width, height)
  love.graphics.draw(Stage.fence, width / 2 - Stage.fenceWidth / 2, height / 1.3)
end
