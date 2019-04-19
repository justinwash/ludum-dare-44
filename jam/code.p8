pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

left,right,up,down,btn1,btn2=0,1,2,3,4,5
black,dark_blue,dark_purple,dark_green,brown,dark_gray,light_gray,white,red,orange,yellow,green,blue,indigo,pink,peach=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15

function _init()
  game={}
  show_menu()
end

function _update()
  game.upd()
end

function _draw()
  game.draw()
end

-- main menu --
function show_menu()
  game.upd = menu_update
  game.draw = menu_draw
end

function menu_update()
  if btn(btn1) then show_game() end
end

function menu_draw()
  cls()
  print("press z to start", 10, 10)
end

-- main game --
function show_game()
  x = 63
  y = 63
  mapx = 0
  mapy = 0
  game.upd = game_update
  game.draw = game_draw
end

function game_update()
  mapx -= 1
  if mapx < -127 then mapx = 0 end
  
  if btn(left) then x-=1 end
  if btn(right) then x+=1 end
  if btn(up) then y-=1 end
  if btn(down) then y+=1 end
  if x < 0 or x > 127 or y < 0 or y > 127 then show_game_over() end
end

function game_draw()
  cls(red)
  map(0, 0, mapx, mapy, 16 ,16)
  map(0, 0, mapx + 128, mapy, 16 ,16)
  circfill(x, y, 3, 7)
end

-- game over --
function show_game_over()
  game.upd = game_over_update
  game.draw = game_over_draw
end

function game_over_update()
  if btn(btn1) then show_menu() end
end

function game_over_draw()
  cls(dark_blue)
  print("game over", 10, 10, 7)
  print("press z to restart", 10, 20, 7)
end