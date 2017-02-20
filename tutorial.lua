function LoadTutorial()

endtutorial = false
tutorialTime=0
end
function TutorialUpdate(dt)
	MoveHero(dt)
	if HeroLancePosition()==4 then
		MoveVillain(dt)
	end
	if VillainLancePosition()==4 and not endtutorial then
		endtutorial=true
		tutorialTime = love.timer.getTime()
		end
	
	if endtutorial then
		if (love.timer.getTime() - tutorialTime >= 3) then
		State="Menu"
		endtutorial = false
		end
	end
end

function DrawTutorial()
if State=="Tutorial" then 
    love.graphics.setColor(124, 124, 124)
	love.graphics.draw(Stage.background)
	DrawVillain()
	DrawStageFence(Width, Height)
	DrawHero()
	love.graphics.setColor(255, 0, 0,255)
	love.graphics.setFont(mainFont)
	if HeroLancePosition()<4 then
		love.graphics.print("Jogador 1", 265, 50)
		love.graphics.print("Pressione E e D para Controlar a lança", 265, 155)
		love.graphics.print("Pressione R e F para Controlar o escudo", 265, 250)
	end
	if HeroLancePosition() == 4 and VillainLancePosition()<4 then
		love.graphics.setColor(50, 50, 255,255)
		love.graphics.print("Jogador 2", 465, 50)
		love.graphics.print("Pressione i e k para Controlar a lança", 465, 155)
		love.graphics.print("Pressione O e L para Controlar o escudo", 465, 250)
	end

	if endtutorial then
		love.graphics.print("BOM JOGO", 500, 300)
	end	
	end
end