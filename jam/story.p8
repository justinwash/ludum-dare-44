pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

texty=127

function story_show()
  game.upd = story_update
  game.draw = story_draw
end

function story_update()
  if t%20==0 then texty-=1 end
  if btnp(btn1) then buy_show() end
end

function story_draw()
  cls(blue)

  rectfill(19,10,113,22,dark_blue)
  rectfill(17,8,111,20,red)
  print('don\'t die dumpstercat!',21,12,white)

  pigeons_draw()

  sspr(72,0,16,16,16,title.y,100,100,true)

  print("press [z] to start", 29, 112,white)
end