pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

function win_show()
  game.upd = win_update
  game.draw = win_draw
end

function win_update()
  if btnp(btn1) then
    printh("Restart!")
    game.upd=menu_show

    --reset map page 
    map_goToPage(0)

    --reset yarnballs
    yarnballs_reset()

  end
end

function win_draw()
  cls(dark_blue)
  print("you win!", 10, 10, 7)
  print("press z to restart", 10, 20, 7)
end