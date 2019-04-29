pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

function win_show()
  game.upd = win_update
  game.draw = win_draw
end

function win_update()
  if btnp(btn1) then
    game.upd=menu_show

    --reset map page 
    map_goToPage(0)

    --reset yarnballs
    yarnballs_reset()

  end
end

function win_draw()
  cls(blue)
    rectfill(32,10,102,22,dark_blue)
    rectfill(30,8,100,20,red)
    print("taki didn\'t die!", 34, 12, white)

    rectfill(15,36,118,48,dark_blue)
    rectfill(13,34,116,46,red)
    print("thank you for playing", 23, 38, white)

    rectfill(18,60,116,72,dark_blue)
    rectfill(16,58,114,70,red)
    print("press [z] to play again", 20, 62, 7)
end