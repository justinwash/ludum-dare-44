pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

function levelfail_show()
  game.upd = levelfail_update
  game.draw = levelfail_draw
end

function levelfail_update()
  if btnp(btn1) then
    game.upd=buy_show

    --reset map page 
    map_goToPage(0)

    --reset yarnballs
    yarnballs_reset()

  end
end

function levelfail_draw()
  cls(dark_blue)
  if currentlevel<=levels then
    rectfill(36,10,94,22,blue)
    rectfill(34,8,92,20,red)
    print("oh no, taki!", 40, 12, white)

    rectfill(15,36,118,48,blue)
    rectfill(13,34,116,46,red)
    print("you spent all your lives", 17, 38, white)

    rectfill(19,60,113,72,blue)
    rectfill(17,58,111,70,red)
    print("press [z] to try again", 21, 62, 7)
  else win_show() end
end