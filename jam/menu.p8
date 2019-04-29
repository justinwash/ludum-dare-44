pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

title={
  y=20
}

function menu_show()
  game.upd = menu_update
  game.draw = menu_draw
end

function menu_update()
  if t%20==0 then title.y=18 end
  if t%40==0 then title.y=20 end
  if t%60==0 then title.y=22 end

  if btnp(btn1) then story_show() end
end

function menu_draw()
  cls(blue)

  rectfill(19,10,113,22,dark_blue)
  rectfill(17,8,111,20,red)
  print('don\'t die dumpstercat!',21,12,white)

  pigeons_draw()

  sspr(72,0,16,16,16,title.y,100,100,true)

  print("press [z] to start", 29, 118,white)
end