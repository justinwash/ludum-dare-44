pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

function menu_show()
  game.upd = menu_update
  game.draw = menu_draw
end

function menu_update()
  if btnp(btn1) then buy_show() end
end

function menu_draw()
  cls()
  print('don\'t die dumpstercat!', 22, 12)

  sspr(72,0,16,16,24,24,100,100)

  print("press [z] to start", 29, 112)
end