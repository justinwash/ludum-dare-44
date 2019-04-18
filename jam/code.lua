-- system --

game = {}

function _init()
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
  if btn(4) then
    show_game()
  end
end

function menu_draw()
  cls()
  print("press z to start", 10, 10)
end

-- main game --

function show_game()
  x = 63
  y = 63
	
  game.upd = game_update
  game.draw = game_draw
end

function game_update()
  if btn(0) then x-=1 end
  if btn(1) then x+=1 end
  if btn(2) then y-=1 end
  if btn(3) then y+=1 end
	
  if x < 0 or x > 127 or y < 0 or y > 127 then
    show_game_over()
  end
end

function game_draw()
  cls(8)
  map(0, 0, 0, 0, 16 ,16)
  circfill(x, y, 3, 7)
end

-- game over --

function show_game_over()
  game.upd = game_over_update
  game.draw = game_over_draw
end

function game_over_update()
  if btn(4) then
    show_game()
  end
end

function game_over_draw()
  cls(1)
  print("game over", 10, 10, 7)
  print("press z to restart", 10, 20, 7)
end
