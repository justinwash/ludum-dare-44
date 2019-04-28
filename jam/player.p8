pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

player={
  spr=1,
  flip=true,
  x=0,
  y=0,
  dx=0,
  dy=0,
  w=16,
  h=16,
  lives=9,
  busy=false,
  jumpmomentum=3,
  jumpcount=0,
  timeonground=0,
  abilities={}
}

function player_init()
  player.x=63
  player.y=43

  player.abilities={
    djump=purchases[1].bought,
    lazers=purchases[2].bought,
    jetpack=purchases[3].bought,
    yarn=purchases[4].bought
  }

  player.lives=9-spent
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
  else 
    player.timeonground+=1
    player.jumpcount=0 end

  if player.dx>0 then player.flip=true
  elseif player.dx<0 then player.flip=false end

  if (map_getflag(map_gettile(player.x+7,player.y+7))==16 and t%60==0) then
    player.lives-=1
    player.spr=1
    sfx(7)
  end

  if player.lives<=0 then gameover_show() end
end

function player_update()
  player_eachframe()

  if not player.busy then
    player_act=player_idle
    if player_shouldmove() then player_act=player_move end
    if player_shouldclimb() then player_act=player_climb end
    if player_shouldjump() then player_act=player_jump end
    if player_shoulddoublejump() then player_act=player_doublejump end
    if player_shouldjetpack() then player_act=player_jetpack end
  end

  player_act()
  player_updatepos()
end

function player_draw() 
  if btn(left) then player.flip=false end
  if btn(right) then player.flip=true end
  spr(player.spr, player.x, player.y, player.w/8, player.h/8, player.flip)
  print('lives: ' ..player.lives)
  
end

function player_act()
  -- placeholder for action functions
end

function player_idle()  
  player.spr=44
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
  if player_isonground() then
    if t%20==0 then player.spr=5 end
    if t%40==0 then player.spr=7 end
  end
  if btn(left) then player.dx-=1 end
  if btn(right) then player.dx+=1 end
end

function player_shouldjump()
  if btnp(btn1) and 
  (player_isonground() or
  (map_getflag(map_gettile(player.x+7,player.y+7))==2
  or map_getflag(map_gettile(player.x+7,player.y+16))==2))
   then
    return true
  else 
    return false 
  end
end

function player_jump()
  player.spr=46
  if btn(left) then player.dx-=1 end
  if btn(right) then player.dx+=1 end
  player.dy-=player.jumpmomentum
  player.jumpcount+=1
  sfx(12)
end

function player_shoulddoublejump()
  if btnp(btn1) and player.abilities.djump then
    return true
  else return false end
end

function player_doublejump()
  if player.jumpcount<2 then
      player.dy=0
      player_jump()
  end
end

function player_shouldjetpack()
  if btn(btn1) and player.abilities.jetpack then
    return true
  else return false end
end

function player_jetpack()
  player.spr=9
  if btn(left) then player.dx-=1 end
  if btn(right) then player.dx+=1 end
  if player.y>1 then
      player.dy=-1.5
  end
  sfx(9)
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

function player_shouldclimb()
  if btn(left) then player.dx-=1 end
  if btn(right) then player.dx+=1 end

  if (map_getflag(map_gettile(player.x+7,player.y+7))==2
  or map_getflag(map_gettile(player.x+7,player.y+16))==2) and btn(up) then
    return true
  else return false end
end

function player_climb()
  player.spr=37
  if map_getflag(map_gettile(player.x+7,player.y+14))==2 then
    player.y-=2.4
  else player_jump() end
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
if player.dx>1 then player.dx=1 end
  if player.dx<-1 then player.dx=-1 end
  
  player.x+=player.dx
  player.y+=player.dy

  map_shouldScroll()
end


