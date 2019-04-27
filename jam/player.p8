pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

player={
  spr=1,
  flip=true,
  x=63,
  y=63,
  dx=0,
  dy=0,
  w=16,
  h=16,
  busy=false,
  jumpmomentum=3,
  timeonground=0
}

function player_init()
  player.x=63
  player.y=63
end

function player_eachframe()
  local x=player.x
  local y=player.y
  local w=player.w
  local h=player.h

  player.dx=0
  if not player_isonground() then
    player.timeonground=0
    player.dy+=0.2
    if player.dy>2 then player.dy=2 end
  else player.timeonground+=1 end
end

function player_update()
  player_eachframe()

  if not player.busy then
    player_act=player_idle
    if player_shouldmove() then player_move() end
    if player_shouldjump() then player_jump() end
  end

  player_act()
  player_updatepos()
end

function player_draw() 
  spr(player.spr, player.x, player.y, player.w/8, player.h/8, player.flip)
end

function player_act()
  -- placeholder for action functions
end

function player_idle()  
  -- reset jump strength
end

function player_shouldmove()
  if btn(left) 
  or btn(right)
  or btn(up)
  or btn(down) then 
    return true
  else return false end
end

function player_move() 
  if btn(left) then player.dx-=1 end
  if btn(right) then player.dx+=1 end
end

function player_shouldjump()
  if btnp(btn1) and player_isonground() then
    return true
  else 
    return false 
  end
end

function player_jump()
    if btn(left) then player.dx-=1 end
    if btn(right) then player.dx+=1 end
    player.dy-=player.jumpmomentum
end

function player_wouldcollidex()
local x=player.x
  local y=player.y
  local w=player.w
  local h=player.h
  
  if map_wouldcollide(x+player.dx,y,w,h) then
    return true
  else return false end
end

function player_wouldcollidey()
  local x=player.x
  local y=player.y
  local w=player.w
  local h=player.h

  if map_wouldcollide(x,y+player.dy,w,h) then
    return true
  else return false end
end

function player_isonground()
  local x=player.x
  local y=player.y
  local w=player.w
  local h=player.h

  if map_wouldcollide(x,y+1,w,h) then
    return true
  else return false end
end

function player_updatepos()
  local x=player.x
  local y=player.y
  local w=player.w
  local h=player.h
  
  if player_wouldcollidex() then
    player.dx=0
  end

  if player_wouldcollidey() then
    player.dy=0
  end

  --player cannot scroll left on the first map page
  if map_getPage() == 0 and player.x < 1 then
    player.dx = 1
  end

  --player cannot go above map ceilng
  if player.y == 0 then
    player.dy = 1
  end

  player.x+=player.dx
  player.y+=player.dy

  map_shouldScroll()
end


