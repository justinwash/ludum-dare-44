pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

-- lifecycle functions: run every frame --
function _init()
  game={}
  t=0
  levels=2
  currentlevel=1
  player_init()
  menu_show()
  music(3,10000)
  cameraoffset=0
end

function _update60()
  t+=1
  game.upd()
end

function _draw()
  game.draw()
end

-- main game --
function game_show()
  mapx = 0
  mapy = 0
  player_init()
  music(0,5000)
  game.upd = game_update
  game.draw = game_draw
end

function game_update() 
  map_update()
  player_update()
  game_checkfail()
end

function game_draw()
  cls(dark_blue)
  map_draw()
  yarnballs_draw()
  pigeons_draw()
  player_draw()
  cam_screenshake()
end

function game_checkfail()
  if player.y > 127 then 
    gameover_show()
  end
end

function cam_screenshake()
  local fade = 0.15
  local offset_x=16-rnd(32)
  local offset_y=16-rnd(32)
  offset_x*=cameraoffset
  offset_y*=cameraoffset
  
  camera(offset_x,offset_y)
  cameraoffset*=fade
  if cameraoffset<0.05 then
    camereaoffset=0
  end
end