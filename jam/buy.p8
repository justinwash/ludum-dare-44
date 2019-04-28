pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

cursor={
  x=2,
  y=36,
  pos=1
}

purchases={ {36,'catnip',color=white,bought=false,cost=2,description='need a boost?'},
          {42,'lazers',color=white,bought=false,cost=3,description='yes, literally lazers'},
          {48,'jetpack',color=white,bought=false,cost=8, description='altitude for your catitude'},
          {54,'lots o\' yarn',color=white,bought=false,cost=5, description='crush em with cashmere'} 
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
      purchases[cursor.pos].color = yellow 
      purchases[cursor.pos].bought = true 
      spent+=purchases[cursor.pos].cost
    
    elseif purchases[cursor.pos].color == yellow then
      purchases[cursor.pos].color = white
      purchases[cursor.pos].bought = false
      spent-=purchases[cursor.pos].cost
    end
  end

  if btnp(btn2) then game_show() end
  
end

function buy_draw()
  cls(dark_blue)
  rectfill(10,10,120,22,blue)
  rectfill(8,8,118,20,red)
  print("use lives to buy upgrades?", 12, 12, white)

  rectfill(10,34,120,64,blue)
  rectfill(8,32,118,62,red)
  print(purchases[1][2], 12, 36, purchases[1].color)
  print(purchases[2][2], 12, 42, purchases[2].color)
  print(purchases[3][2], 12, 48, purchases[3].color)
  print(purchases[4][2], 12, 54, purchases[4].color)
  print('cost: ' ..purchases[1].cost, 87, 36, purchases[1].color)
  print('cost: ' ..purchases[2].cost, 87, 42, purchases[2].color)
  print('cost: ' ..purchases[3].cost, 87, 48, purchases[3].color)
  print('cost: ' ..purchases[4].cost, 87, 54, purchases[4].color)

  rectfill(10,76,120,88,blue)
  rectfill(8,74,118,86,red)
  print(purchases[cursor.pos].description,12,78,white)
  
  print("lives: " ..9-spent, 12, 98, white)
  print("press z to toggle/purchase", 12, 106, white)
  print("press x to start", 12, 114, white)

  print(">",cursor.x,purchases[cursor.pos][1], white)
end