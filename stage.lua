function CreateStage()
  Stage = {}
  Stage.background = love.graphics.newImage("images/backgrounds/castelo.png")
  Stage.shadowFence = love.graphics.newImage("images/elements/shadow_fence.png")
  Stage.fence = love.graphics.newImage("images/elements/fence.png")
  Stage.fenceWidth = Stage.fence:getWidth()
  Stage.fenceHeight = Stage.fence:getHeight()
end

function DrawStageBackground()
  love.graphics.draw(Stage.background)
end

function DrawStageFence(width, height)
  love.graphics.draw(Stage.shadowFence, width / 2 - Stage.fenceWidth / 2, height / 1.3)
  love.graphics.draw(Stage.fence, width / 2 - Stage.fenceWidth / 2, height / 1.3)
end
