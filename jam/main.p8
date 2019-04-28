pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

-- lifecycle functions: run every frame --
function _init()
  game={}
  t=0
  player_init()
  menu_show()
  music(3,10000)
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
  player_draw()
  yarnballs_draw()
  pigeons_draw()
end

function game_checkfail()

  if player.y > 127 then 
    gameover_show()
  end
  
end