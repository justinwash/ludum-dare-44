pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

function gameover_show()
  game.upd = gameover_update
  game.draw = gameover_draw
end

function gameover_update()
  if btnp(btn1) then
    printh("Restart!")
    _init()

    --reset map page 
    map_goToPage(0)

  end
end

function gameover_draw()
  cls(dark_blue)
  print("game over", 10, 10, 7)
  print("press z to restart", 10, 20, 7)
end