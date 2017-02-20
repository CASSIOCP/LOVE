BgSound = love.audio.newSource("sounds/intro.mp3", "stream")
BgSound:setVolume(0.4)
BgSound:setPitch(0.9)

MetalSound = love.audio.newSource("sounds/metal.mp3", "stream")
MetalSound:setVolume(0.7)
MetalSound:setPitch(0.9)

Ost = love.audio.newSource("sounds/ost2.mp3", "stream")
Ost:setVolume(0.3)
Ost:setPitch(0.9)

Galop = love.audio.newSource("sounds/galop.mp3", "stream")
Galop:setVolume(0.8)
Galop:setPitch(1.0)

MetalSound2 = love.audio.newSource("sounds/metal.mp3", "stream")
MetalSound2:setVolume(0.8)
MetalSound2:setPitch(0.5)
ms = true

VictorySound = love.audio.newSource("sounds/victory.mp3", "stream")
VictorySound:setVolume(0.5)
VictorySound:setPitch(0.9)

DefeatSound = love.audio.newSource("sounds/defeat.mp3", "stream")
DefeatSound:setVolume(0.8)
DefeatSound:setPitch(0.9)
