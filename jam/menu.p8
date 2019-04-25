pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

function menu_show()
  game.upd = menu_update
  game.draw = menu_draw
end

function menu_update()
  if btnp(btn1) then game_show() end
end

function menu_draw()
  cls()
  print("press z to start", 10, 10)
end