pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

yarn = {
    loop = 0,
    available = true,
    balls = {}
}

function yarnballs_draw() 

    if purchases[4].bought then
        yarn_go()
        yarn.loop+=1
    end

end

function yarnballs_createball(seed) 
    local ball = {
        spr=35,
        x=0,
        y=seed*16,
        w=16,
        h=16
    }
    return ball
end

function yarn_go()

    if yarn.available then

        if yarn.loop == 0 then
            yarnballs_generate()
        end

        for k in pairs(yarn.balls) do
            local ball = yarn.balls[k]

            spr(ball.spr, ball.x, ball.y, ball.w/8, ball.h/8)
            ball.x+=1
        end

        if yarn.balls[1].x == 127 then
            yarn.available = false
        end

    end

end

function yarnballs_reset() 
    yarn.loop = 0
    yarn.available = true
end

function yarnballs_generate() 
    for i=1,8 do yarn.balls[i]=yarnballs_createball(i) end
end