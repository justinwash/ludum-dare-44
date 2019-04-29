pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

girl={
  x=106,
  y=64,
  spr=128
}

function girl_update()
  if map_getPage()==7 then
    girl_hit()
  end
end

function girl_draw()
  if map_getPage()==7 then
    if player.x>30 or girl.running then
      girl.running=true
      girl.x-=1
      if t%20==0 then girl.spr=129 end
      if t%40==0 then girl.spr=130 end
    end
    spr(girl.spr,girl.x,girl.y,1,2)
  end
end

function girl_hit()
  if ((abs(girl.x-player.x)<8 and abs(girl.y-player.y-7)<8)) and player.invuln<60 then
    player.lives-=1
    player.invuln=120
    cameraoffset=1
    sfx(7)
    player.dx-=2
  end
end