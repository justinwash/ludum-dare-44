pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

birdModule={
    loop=0,
    birdsInFlight={},
    spawnSeed=60
}

function pigeons_draw() 
    local seed = rnd(birdModule.spawnSeed)
    seed = flr(seed)

    if seed == 1 then
        pigeons_attack()
    end

    pigeons_move()
    pigeons_cleanup()

end

function pigeons_move() 
    for k in pairs(birdModule.birdsInFlight) do
        
        local pigeon = birdModule.birdsInFlight[k]

        pigeon:draw()
        pigeon:fly()

    end
end

function pigeons_attack() 
    local pigeon = pigeons_createPigeon()
    birdModule.birdsInFlight[#birdModule.birdsInFlight+1] = pigeon
    
    printh("Created pigeon: " .. " at " .. time())

end

function pigeons_cleanup()

    local index = 1

    for k in pairs(birdModule.birdsInFlight) do
        
        index += 1
        local pigeon = birdModule.birdsInFlight[k]
        
        if pigeon.x < 1 then
            del(birdModule.birdsInFlight, pigeon)
        end

    end

    -- printh(#birdModule.birdsInFlight .. " birds remaining")
end

function pigeons_createPigeon() 
    local yPosition = rnd(32)

    local pigeon = {
        spr=96,
        x = 127,
        y = yPosition,
        w = 16,
        h = 16
    }

    function pigeon:fly() 
        self.x-=1
    end

    function pigeon:draw() 
        -- printh("Draw me at " .. self.x)
        spr(self.spr, self.x, self.y, self.w/8, self.h/8)
    end

    return pigeon
end