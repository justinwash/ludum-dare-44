pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

birdModule={
    loop=0,
    birdsInFlight={},
    spawnSeed=40
}

function pigeons_draw() 
    if yarnballs_isBought() then
        birdModule.spawnSeed=140
    end

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
        pigeon:hit()

    end
end

function pigeons_attack() 
    if game.upd==game_update or game.upd==menu_update then
      local pigeon = pigeons_createPigeon()
      birdModule.birdsInFlight[#birdModule.birdsInFlight+1] = pigeon
    else birdModule.birdsInFlight={} end
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
    local yPosition = rnd(72)

    local pigeon = {
        spr=96,
        x = 127,
        y = yPosition,
        w = 16,
        h = 16
    }

    function pigeon:fly() 
        self.x-=1
        if t%20==0 then pigeon.spr=96 end
        if t%40==0 then pigeon.spr=98 end
    end

    function pigeon:draw() 
        spr(self.spr, self.x, self.y, self.w/8, self.h/8)
    end

    function pigeon:hit()
        if pigeon.x - player.x == 0
        and ((pigeon.y - player.y+7 < 12 and pigeon.y - player.y+7 > 0) 
        or (player.y - pigeon.y+10 < 12 and player.y - pigeon.y+10 > 0)) then
            player.lives-=1
            sfx(7)
            player.dx-=2
        end
    end

    return pigeon
end

function pigeon_offset(offset)
    local index = 1
    for k in pairs(birdModule.birdsInFlight) do
        index += 1
        local pigeon = birdModule.birdsInFlight[k]
        pigeon.x+=offset

        if pigeon.x < 1 then
            del(birdModule.birdsInFlight, pigeon)
        end

    end
end