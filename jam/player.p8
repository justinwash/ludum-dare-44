pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

player={
  x=63,
  y=63,
  busy=false
}
function player_init()
  player.x=63
  player.y=63
end

function player_update()
  if not player.busy then
    if player_shouldmove() then player_act=player_move end
  end

  player_act()
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
  if btn(left) then player.x-=1 end
  if btn(right) then player.x+=1 end
  if btn(up) then player.y-=1 end
  if btn(down) then player.y+=1 end
end

