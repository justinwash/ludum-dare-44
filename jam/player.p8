pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

player={
  x=63,
  y=63,
  dx=0,
  dy=0,
  w=8,
  h=8,
  busy=false
}

function player_init()
  player.x=63
  player.y=63
end

function player_eachframe()
  player.dx=0
  player.dy=0
end

function player_update()
  player_eachframe()

  if not player.busy then
    if player_shouldmove() then player_act=player_move end
  end

  player_act()
  player_updatepos()
end

function player_draw() 
  spr(1, player.x, player.y)
end

function player_act()
  -- placeholder for action functions
end

function player_idle()  
  -- do nothing
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
  if btn(up) then player.dy-=1 end

  if btn(down) then 
    player.dy+=1
  end

end

function player_updatepos()
  local x=player.x
  local y=player.y
  local w=player.w
  local h=player.h
  
  if map_wouldcollide(x+player.dx,y,w,h) then
    player.dx=0
  end

  if map_wouldcollide(x,y+player.dy,w,h) then
    player.dy=0
  end

  player.x+=player.dx
  player.y+=player.dy

  map_shouldScroll()
end
