pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

-- lifecycle functions: run every frame --
function _init()
  game={}
  player_init()
  menu_show()
end

function _update()
  game.upd()
end

function _draw()
  game.draw()
end

-- main game --
function game_show()
  mapx = 0
  mapy = 0
  game.upd = game_update
  game.draw = game_draw
end

function game_update() 
  map_update()
  player_update()
  game_checkfail()
end

function game_draw()
  cls(red)
  map_draw()
  player_draw()
end

function game_checkfail()
  if player.x < 0 
  or player.x > 127 
  or player.y < 0 
  or player.y > 127 then 
    gameover_show() 
  end
end