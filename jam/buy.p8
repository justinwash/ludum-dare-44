pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

cursor={
  x=2,
  y=24,
  pos=1
}

purchases={ {24,'double-jump',color=white,bought=false,cost=2},
          {30,'lazers',color=white,bought=false,cost=3},
          {36,'jetpack',color=white,bought=false,cost=5},
          {42,'the biggest ball o\' yarn',color=white,bought=false,cost=8} 
}

spent=0

function buy_show()
  game.upd = buy_update
  game.draw = buy_draw
end

function buy_update()
  if btnp(down) and cursor.pos < 4 then
    cursor.pos+=1
  end
  if btnp(up) and cursor.pos > 1 then
    cursor.pos-=1
  end

  if btnp(btn1) then 
    if purchases[cursor.pos].color == white 
    and spent < 9 - purchases[cursor.pos].cost then
      purchases[cursor.pos].color = orange 
      purchases[cursor.pos].bought = true 
      spent+=purchases[cursor.pos].cost
    
    elseif purchases[cursor.pos].color == orange then
      purchases[cursor.pos].color = white
      purchases[cursor.pos].bought = false
      spent-=purchases[cursor.pos].cost
    end
  end

  if btnp(btn2) then game_show() end
end

function buy_draw()
  cls()
  print("buy something why don't ya", 10, 10, white)

  print(purchases[1][2], 12, 24, purchases[1].color)
  print(purchases[2][2], 12, 30, purchases[2].color)
  print(purchases[3][2], 12, 36, purchases[3].color)
  print(purchases[4][2], 12, 42, purchases[4].color)

  print(purchases[1].cost, 120, 24, purchases[1].color)
  print(purchases[2].cost, 120, 30, purchases[2].color)
  print(purchases[3].cost, 120, 36, purchases[3].color)
  print(purchases[4].cost, 120, 42, purchases[4].color)
  
  print("lives: ", 10, 60, white)
  print(9 - spent, 36, 60, white)
  print("press z to purchase", 10, 80, white)
  print("press x to start", 10, 88, white)

  print(">",cursor.x,purchases[cursor.pos][1], white)
end